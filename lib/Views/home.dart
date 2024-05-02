import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teachers_contact_book_mbstu/controllers/auth_services.dart';
import 'package:url_launcher/url_launcher.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List _allResults = [];
  List _resultList = [];
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    //create a add listner
    _searchController.addListener(_onSearchChanged);
    //getClientStream();
    super.initState();
  }

  //user data get from firestore
  getClientStream() async {
    var data = await firestore.collection('contacts').orderBy('name').get();
    //store data on allresults variable
    setState(() {
      _allResults = data.docs;
    });
    searchResultList();
  }

  //for search operation
  _onSearchChanged() {
    print(_searchController.text);
    searchResultList();
  }

  //search functionality
  searchResultList() {
    var showResults = [];
    if (_searchController.text.isNotEmpty) {
      for (var clientSnapShot in _allResults) {
        var name = clientSnapShot['name'].toString().toLowerCase();
        var department = clientSnapShot['department'].toString().toLowerCase();
        var phone = clientSnapShot['phone'].toString().toLowerCase();
        var email = clientSnapShot['email'].toString().toLowerCase();
        if (name.contains(_searchController.text.toLowerCase()) ||
            department.contains(_searchController.text.toLowerCase()) ||
            phone.contains(_searchController.text.toLowerCase()) ||
            email.contains(_searchController.text.toLowerCase())) {
          showResults.add(clientSnapShot);
        }
      }
    } else {
      showResults = List.from(_allResults);
    }
    setState(() {
      _resultList = showResults;
    });
  }

  // To call the contact using URL launcher
  void callUser(String phone) async {
    String url = "tel:$phone";
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw "Could not launch $url";
    }
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    getClientStream();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CupertinoSearchTextField(
          controller: _searchController,
        ),
      ),
      body: ListView.builder(
          itemCount: _resultList.length,
          itemBuilder: (_, index) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: ListTile(
                leading: CircleAvatar(
                    backgroundColor: Colors.amber,
                    child: Text(
                      _resultList[index]["name"][0],
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )),
                title: Text(
                  _resultList[index]['name'],
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_resultList[index]['department']),
                    Text(_resultList[index]['phone']),
                    Text(_resultList[index]['email']),
                  ],
                ),
                trailing: IconButton(
                  icon: Icon(Icons.call_outlined),
                  onPressed: () {
                    callUser(_allResults[index]["phone"]);
                  },
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () {
          Navigator.pushNamed(context, "/add");
        },
        child: Icon(
          Icons.person_add_alt_outlined,
          color: Colors.white,
        ),
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
              SizedBox(
                height: 10,
              ),
              Text(FirebaseAuth.instance.currentUser!.email.toString())
            ],
          )),
          ListTile(
            onTap: () {
              AuthService().logout();
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("Logged Out")));
              Navigator.pushReplacementNamed(context, "/login");
            },
            leading: Icon(Icons.logout_outlined),
            title: Text("Logout"),
          )
        ],
      )),
    );
  }
}
