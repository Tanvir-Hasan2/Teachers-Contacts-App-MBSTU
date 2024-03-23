
import 'package:flutter/material.dart';
import 'package:teachers_contact_book_mbstu/controllers/crud_services.dart';

class UpdateContact extends StatefulWidget {
  const UpdateContact(
      {super.key,
      required this.docID,
      required this.name,
      required this.phone,
      required this.email,
      required this.department,});
  final String docID, name, phone, email, department;

  @override
  State<UpdateContact> createState() => _UpdateContactState();
}

class _UpdateContactState extends State<UpdateContact> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _departmentController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController.text = widget.email;
    _phoneController.text = widget.phone;
    _nameController.text = widget.name;
    _departmentController.text = widget.department;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Update Contact",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * .9,
                    child: TextFormField(
                      validator: (value) =>
                          value!.isEmpty ? "Enter any name" : null,
                      controller: _nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Name"),
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * .9,
                    child: TextFormField(
                      controller: _phoneController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Phone"),
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * .9,
                    child: TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Email"),
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: TextFormField(
                    controller: _departmentController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Department"),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    height: 65,
                    width: MediaQuery.of(context).size.width * .9,
                    child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            CRUDService().updateContact(
                                _nameController.text,
                                _phoneController.text,
                                _emailController.text,
                                _departmentController.text,
                                widget.docID);
                            Navigator.pop(context);
                          }
                        },
                        child: const Text(
                          "Update",
                          style: TextStyle(fontSize: 16),
                        ))),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    height: 65,
                    width: MediaQuery.of(context).size.width * .9,
                    child: OutlinedButton(
                        onPressed: () {
                          CRUDService().deleteContact(widget.docID);
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Delete",
                          style: TextStyle(fontSize: 16),
                        ))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
