import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pdf_reader_app/screen/Sign/Sign_Up.dart';

import '../home_page.dart';
import 'EmailVerified.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late String emails, passwords;

  savepref(String email, String pass) async {
    SharedPreferences Preferences = await SharedPreferences.getInstance();
    Preferences.setString("email", email);
    Preferences.setString("passwerd", pass);
    Preferences.setBool("vir", true);
    print(Preferences.getBool("vir"));
  }

  adduser1() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emails,
        password: passwords,
      );
      if (userCredential.user?.emailVerified == false) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => StatefulBuilder(
              builder: (BuildContext context, setState) =>
                  const EmailVerified(),
            ),
          ),
        );
      } else {
        savepref(emails, passwords);

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => StatefulBuilder(
              builder: (BuildContext context, setState) => const home_page(),
            ),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('error'),
              content: Text("${e.code}"),
            );
          });
    }
  }

  getpref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    if (preferences.getBool('vir') == true) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => StatefulBuilder(
            builder: (BuildContext context, setState) => const home_page(),
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    getpref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(
            top: 100,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(
                  top: 20,
                  bottom: 10,
                ),
                // color: Colors.amber,
                child: const Center(
                  child: CircleAvatar(
                    // backgroundColor: Colors.amber,
                    radius: 80.0,
                    backgroundImage: AssetImage("images/2022.png"),
                  ),
                ),
              ),
              const Text(
                'Sign In',
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: TextField(
                  textAlign: TextAlign.left,
                  onChanged: (value) {
                    emails = value;
                  },
                  decoration: const InputDecoration(
                    hintText: "Email",
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.amber,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: TextField(
                  textAlign: TextAlign.left,
                  onChanged: (value) {
                    passwords = value;
                  },
                  decoration: const InputDecoration(
                    hintText: "password",
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.amber,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  adduser1();
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                  backgroundColor: Colors.amber,
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontStyle: FontStyle.normal),
                ),
                child: const Text('sign in'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => StatefulBuilder(
                            builder: (BuildContext context, setState) =>
                                const SignUP(),
                          ),
                        ),
                      );
                    },
                    child: const Text("sign up"),
                  ),
                  const Text('create accont '),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
