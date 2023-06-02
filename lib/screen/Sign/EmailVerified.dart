import 'package:flutter/material.dart';
import 'package:pdf_reader_app/screen/Sign/Sign_In.dart';

class EmailVerified extends StatefulWidget {
  const EmailVerified({super.key});

  @override
  State<EmailVerified> createState() => _EmailVerifiedState();
}

class _EmailVerifiedState extends State<EmailVerified> {
  var emails, passwords;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('go to app gmail because verified email '),
              ElevatedButton(
                onPressed: () async {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => StatefulBuilder(
                        builder: (BuildContext context, setState) =>
                            const SignIn(),
                      ),
                    ),
                  );
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
            ],
          ),
        ),
      ),
    );
  }
}
