import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:teachers_contact_book_mbstu/controllers/auth_services.dart';
import 'package:teachers_contact_book_mbstu/controllers/crud_services.dart';
import 'package:url_launcher/url_launcher.dart';

import 'update_contact.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late Stream<QuerySnapshot> _stream;
  TextEditingController _searchController = TextEditingController();
  FocusNode _searchfocusNode = FocusNode();

  @override
  void initState() {
    _stream = CRUDService().getContacts();
    super.initState();
  }

  @override
  void dispose() {
    _searchfocusNode.dispose();
    super.dispose();
  }

  // to call the contact using url launcher
  callUser(String phone) async {
    String url = "tel:$phone";
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw "Could not launch $url ";
    }
  }

  // search Function to perform search

  searchContacts(String search) {
    _stream = CRUDService().getContacts(searchQuery: search);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Text("Contacts Book",style: TextStyle(color: Colors.white,letterSpacing: 2,fontSize: 30,fontWeight: FontWeight.bold,),),
        centerTitle: true,
        // search box
        bottom: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width * 8, 80),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: TextFormField(
                    onChanged: (value) {
                      searchContacts(value);
                      setState(() {});
                    },
                    focusNode: _searchfocusNode,
                    controller: _searchController,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        label: const Text("Search"),
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: _searchController.text.isNotEmpty
                            ? IconButton(
                                onPressed: () {
                                  _searchController.clear();
                                  _searchfocusNode.unfocus();
                                  _stream = CRUDService().getContacts();
                                  setState(() {});
                                },
                                icon: const Icon(Icons.close),
                              )
                            : null),
                  )),
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/add");
        },
        child: const Icon(Icons.person_add),
      ),
      drawer: Drawer(
          child: ListView(
        children: [
          DrawerHeader(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                maxRadius: 32,
                child: Text(FirebaseAuth.instance.currentUser!.email
                    .toString()[0]
                    .toUpperCase()),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(FirebaseAuth.instance.currentUser!.email.toString())
            ],
          )),
          ListTile(
            onTap: () {
              AuthService().logout();
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("Logged Out")));
              Navigator.pushReplacementNamed(context, "/login");
            },
            leading: const Icon(Icons.logout_outlined),
            title: const Text("Logout"),
          )
        ],
      )),
      body: StreamBuilder<QuerySnapshot>(
          stream: _stream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text("Something Went Wrong");
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: Text("Loading...."),
              );
            }
            return snapshot.data!.docs.length == 0
                ? const Center(
                    child: Text("No Contacts Found ..."),
                  )
                : ListView(
                    children: snapshot.data!.docs
                        .map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data()! as Map<String, dynamic>;
                          return ListTile(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UpdateContact(
                                        name: data["name"],
                                        phone: data["phone"],
                                        email: data["email"],
                                        department: data["department"],
                                        docID: document.id, ))),
                            leading: CircleAvatar(child: Text(data["name"][0])),
                            title: Text(data["name"],style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(data["department"],style: const TextStyle(color:Colors.blueAccent),),
                                Text(data["phone"],style: const TextStyle(color: Colors.deepPurple),),
                                //Text(data["email"] ),

                              ],
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.call),
                              onPressed: () {
                                callUser(data["phone"]);
                              },
                            ),
                          );
                        })
                        .toList()
                        .cast(),
                  );
          }),
    );
  }
}


