import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/homepage.dart';
import 'package:login/login.dart';

class signup_details extends StatefulWidget {
  const signup_details({Key? key}) : super(key: key);

  @override
  State<signup_details> createState() => _signup_detailsState();
}

class _signup_detailsState extends State<signup_details> {
  final _emailsignupController = TextEditingController();
  final _passsignupController = TextEditingController();
  Future createUser({email, password}) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 174.0, bottom: 150.0),
                    child: Text(
                      'SIGN UP',
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
                            controller: _emailsignupController,
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
                    child: Container(
                      height: 63,
                      color: Color(0xFFEFEFEF),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: TextField(
                            controller: _passsignupController,
                            obscureText: true,
                            decoration: InputDecoration.collapsed(
                              hintText: 'password',
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
                        await createUser(
                            email: _emailsignupController.text,
                            password: _passsignupController.text);
                        print('email: ' +
                            _emailsignupController.text +
                            '\npassword: ' +
                            _passsignupController.text);
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
                              'SIGN UP',
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
                    height: 127,
                  ),
                  SizedBox(
                    height: 63,
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => login_details()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don’t have an account?',
                              style: GoogleFonts.ptMono(
                                  color: Colors.black, fontSize: 16.0),
                            ),
                            Text(
                              'Log in',
                              style: GoogleFonts.ptMono(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),
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
