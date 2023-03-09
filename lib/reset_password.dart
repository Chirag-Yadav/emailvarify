import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/login.dart';
import 'package:login/signup.dart';

class reset extends StatefulWidget {
  const reset({Key? key}) : super(key: key);

  @override
  State<reset> createState() => _resetState();
}

class _resetState extends State<reset> {
  final _emailController = TextEditingController();
  Future resetPassword({email}) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 174.0, bottom: 150.0),
                    child: Text(
                      'RESET PASSWORD',
                      style: GoogleFonts.ptMono(
                          color: Colors.black,
                          fontSize: 36.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 28.0, right: 28.0),
                    child: Container(
                      height: 63,
                      color: Color(0xFFEFEFEF),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: TextField(
                            controller: _emailController,
                            decoration: InputDecoration.collapsed(
                              hintText: 'name@email.com',
                              hintStyle: GoogleFonts.ptMono(
                                  color: Colors.black, fontSize: 18.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 28.0, right: 28.0),
                    child: TextButton(
                      onPressed: () async {
                        await resetPassword(email: _emailController.text);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => login_details()));
                      },
                      child: SizedBox(
                        height: 63,
                        child: Card(
                          elevation: 0,
                          color: Color(0xFF078CD6),
                          child: Center(
                            child: Text(
                              'GET RESET EMAIL',
                              style: GoogleFonts.ptMono(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 291,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
