import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/login.dart';
import 'package:login/signup.dart';

class home_details extends StatefulWidget {
  const home_details({Key? key}) : super(key: key);

  @override
  State<home_details> createState() => _home_detailsState();
}

class _home_detailsState extends State<home_details> {
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
                    padding: const EdgeInsets.only(top: 174.0),
                    child: Text(
                      ' YOU ARE\nLOGGED IN',
                      style: GoogleFonts.ptMono(
                          color: Colors.black,
                          fontSize: 36.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Image.asset(
                    'images/ok.png',
                    height: 300,
                    width: 300,
                  ),
                  SizedBox(
                    height: 132,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 28.0, right: 28.0),
                    child: TextButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut();
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: ((context) => login_details())));
                      },
                      child: SizedBox(
                        height: 63,
                        width: 181,
                        child: Card(
                          elevation: 0,
                          color: Color(0xFF078CD6),
                          child: Center(
                            child: Text(
                              'LOG OUT',
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
                    height: 61,
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
