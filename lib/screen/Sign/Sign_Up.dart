import 'package:chips_choice/chips_choice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pdf_reader_app/screen/Sign/EmailVerified.dart';
import 'package:pdf_reader_app/screen/Sign/Sign_In.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUP extends StatefulWidget {
  const SignUP({super.key});

  @override
  State<SignUP> createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {
  var tag = 4,tag1 = 4 ,tag2 = 4;
 bool ha = false ;
  List<String> options = [
    '4','3','2','1',
  ];
  List<String> options1 = [
    '3','biology','naural',
  ];
  List<String> options2 = [
    '3','biology','naural',
  ];
  var names,
      emails,
      passwords,
      phones,
      departments,
      levels,
      divisions;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  adduser1()async{

    try{
      UserCredential  userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email:'$emails',
         password: '$passwords',
      );

      users
          .add({
        'name': names,
        'email': emails,
        'phone': phones,
        'level': levels,
        'department': departments,
        'division': divisions,
        'password': passwords,
        'priority': "student",
      });
      //     .then((value) => print('user added') )
      //     .catchError((error) => print("Failed to add user: $error")
      // );
      if(userCredential.user?.emailVerified == false ) {
        User? user = FirebaseAuth.instance.currentUser;
        await user!.sendEmailVerification();

        Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => StatefulBuilder(
            builder: (BuildContext context, setState) =>
            const EmailVerified(),
          ),
        ),
        );
      }
    }
       on FirebaseAuthException catch(e){
         showDialog(context: context, builder: (context){
           return AlertDialog(
             title: const Text('error'),
             content: Text(e.code),
           );
         });
       }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: SingleChildScrollView(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                    radius: 70.0,
                    backgroundImage: AssetImage("images/2022.png"),
                  ),
                ),
              ),
              const Text(
                'Sign up',
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
                    names = value;
                  },
                  decoration: const InputDecoration(
                    hintText: "full name",
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
                    phones = value;
                  },
                  decoration: const InputDecoration(
                    hintText: "phone number",
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
              Container(
                padding: const EdgeInsets.only(
                  left: 20,

                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    ChipsChoice<String>.single(
                      value: levels,
                      onChanged: (val) => setState(() => levels = val ),
                      choiceItems: C2Choice.listFrom<String, String>(
                        source: options,
                        value: (i, v) => options[i],
                        label: (i, v) => v,
                      ),
                    ),
                    const Text(':level',
                    ),

                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 20,

                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    ChipsChoice<String>.single(
                      value: divisions,
                      onChanged: (val) => setState(() => divisions = val ),
                      choiceItems: C2Choice.listFrom<String, String>(
                        source: options2,
                        value: (i, v) => options2[i],
                        label: (i, v) => v,
                      ),
                    ),
                   const Text(':division',
                    ),

                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 20,

                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    ChipsChoice<String>.single(
                      value: departments,
                      onChanged: (val) => setState(() => departments = val ),
                      choiceItems: C2Choice.listFrom<String, String>(
                        source: options2,
                        value: (i, v) => options2[i],
                        label: (i, v) => v,
                      ),
                    ),
                    const Text(':department',
                    ),

                  ],
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
                child: const Text('sign up'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => StatefulBuilder(
                                builder: (BuildContext context, setState) =>
                                    const SignIn(),
                            ),
                        ),
                        );
                      },
                      child: const Text("sign in")),
                  const Text('you have accont')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
