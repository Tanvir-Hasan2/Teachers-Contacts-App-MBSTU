
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teachers_contact_book_mbstu/controllers/auth_services.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(children: [
            SizedBox(
              height: 90,
            ),
            Text(
              "Sign Up",
              style:
                  GoogleFonts.sora(fontSize: 40, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width * .9,
                child: TextFormField(
                  validator: (value) =>
                      value!.isEmpty ? "Email cannot be empty." : null,
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Email"),
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width * .9,
                child: TextFormField(
                  validator: (value) => value!.length < 8
                      ? "Password should have atleast 8 characters."
                      : null,
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Password"),
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            SizedBox(
                height: 65,
                width: MediaQuery.of(context).size.width * .9,
                child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        AuthService()
                            .createAccountWithEmail(
                                _emailController.text, _passwordController.text)
                            .then((value) {
                          if (value == "Account Created") {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Account Created")));
                            Navigator.pushReplacementNamed(context, "/caro");
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                value,
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.red.shade400,
                            ));
                          }
                        });
                      }
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 16),
                    ))),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 65,
              width: MediaQuery.of(context).size.width * .9,
              child: OutlinedButton(
                  onPressed: () {
                    AuthService().continueWithGoogle().then((value) {
                      if (value == "Google Login Successful") {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Google Login Successful")));
                        Navigator.pushReplacementNamed(context, "/caro");
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            value,
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.red.shade400,
                        ));
                      }
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "images/google.png",
                        height: 30,
                        width: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Continue with Google",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have and account?"),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Login"))
              ],
            )
          ]),
        ),
      ),
    );
  }
}
