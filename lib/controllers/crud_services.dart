import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';


class CRUDService {
  // add new contacts to firestore
  Future addNewContacts(
      String name, String phone, String email, String department) async {
    Map<String, dynamic> data = {
      "name": name,
      "email": email,
      "phone": phone,
      "department": department
    };
    try {
      await FirebaseFirestore.instance.collection("contacts").add(data);
      Fluttertoast.showToast(msg: "Document Added");
    } catch (e) {
      print(e.toString());
    }
  }

  // Update a contact in firestore
  Future updateContact(String contactId, String name, String phone,
      String email, String department) async {
    Map<String, dynamic> data = {
      "name": name,
      "email": email,
      "phone": phone,
      "department": department
    };
    try {
      await FirebaseFirestore.instance
          .collection("contacts")
          .doc(contactId)
          .update(data);
      print("Contact Updated");
    } catch (e) {
      print(e.toString());
    }
  }

// Delete a contact from firestore
  Future deleteContact(String contactId) async {
    try {
      await FirebaseFirestore.instance
          .collection("contacts")
          .doc(contactId)
          .delete();
      print("Contact Deleted");
    } catch (e) {
      print(e.toString());
    }
  }
}
