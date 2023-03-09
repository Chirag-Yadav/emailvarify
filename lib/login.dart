import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/homepage.dart';
import 'package:login/reset_password.dart';
import 'package:login/signup.dart';

class login_details extends StatefulWidget {
  const login_details({Key? key}) : super(key: key);

  @override
  State<login_details> createState() => _login_detailsState();
}

class _login_detailsState extends State<login_details> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  Future signIn({email, password}) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
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
                      'LOG IN',
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
                    child: Container(
                      height: 63,
                      color: Color(0xFFEFEFEF),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: TextField(
                            controller: _passController,
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
                        await signIn(
                            email: _emailController.text,
                            password: _passController.text);
                        print('Login email: ' +
                            _emailController.text +
                            '\nLogin password: ' +
                            _passController.text);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => home_details()));
                      },
                      child: SizedBox(
                        height: 63,
                        child: Card(
                          elevation: 0,
                          color: Color(0xFF078CD6),
                          child: Center(
                            child: Text(
                              'LOG IN',
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
                    height: 22,
                  ),
                  SizedBox(
                    height: 45,
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => reset()));
                        },
                        child: Text(
                          'Forgot password?',
                          style: GoogleFonts.ptMono(
                              color: Colors.black, fontSize: 16.0),
                        )),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  SizedBox(
                    height: 63,
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => signup_details()));
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
                              'Sign up',
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
