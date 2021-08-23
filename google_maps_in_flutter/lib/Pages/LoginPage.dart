import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_in_flutter/Pages/MainPage.dart';
import 'package:google_maps_in_flutter/Pages/SignUpPage.dart';
import 'package:google_maps_in_flutter/utils/FireAuth.dart';
import 'package:google_maps_in_flutter/utils/Validator.dart';


class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  final focusEmail = FocusNode();
  final focusPassword = FocusNode();

  bool isProcessing = false;

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    User? user = FirebaseAuth.instance.currentUser;

    // if (user != null) {
    //   Navigator.of(context).pushReplacement(
    //     MaterialPageRoute(
    //       builder: (context) => MainPage(user: user)
    //     ),
    //   );
    // }

    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        focusEmail.unfocus();
        focusPassword.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Where\' my car?"),
        ),
        body: FutureBuilder(
          future: _initializeFirebase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                  child: ListView(
                    children: <Widget>[
                      Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 24.0),
                          child: Text(
                            'Login',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ),
                        Form(
                          key: formKey,
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                controller: emailTextController,
                                focusNode: focusEmail,
                                validator: (value) => Validator.validateEmail(
                                  email: value,
                                ),
                                decoration: InputDecoration(
                                  hintText: "Email",
                                  errorBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(6.0),
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 8.0),
                              TextFormField(
                                controller: passwordTextController,
                                focusNode: focusPassword,
                                obscureText: true,
                                validator: (value) => Validator.validatePassword(
                                  password: value,
                                ),
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  errorBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(6.0),
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 24.0),
                              isProcessing
                                  ? CircularProgressIndicator()
                                  : Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        focusEmail.unfocus();
                                        focusPassword.unfocus();

                                        if (formKey.currentState!
                                            .validate()) {
                                          setState(() {
                                            isProcessing = true;
                                          });

                                          User? user = await FireAuth.signInUsingEmailPassword(
                                            email: emailTextController.text,
                                            password: passwordTextController.text,
                                          );

                                          setState(() {
                                            isProcessing = false;
                                          });

                                          if (user != null) {
                                            print("Vai merda");
                                            Navigator.push(context,
                                                MaterialPageRoute(builder: (BuildContext context) => MainPage(user: user)));
                                          }
                                        }
                                      },
                                      child: Text(
                                        'Sign In',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 24.0),
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => SignUpPage()),
                                            ModalRoute.withName('/'));
                                      },
                                      child: Text(
                                        'Sign Up',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    ]
                ),
              );
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}