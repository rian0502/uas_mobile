import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'One Data Unila',
                style: GoogleFonts.poppins(fontSize: 40, color: Colors.white),
              ),
            ),
            const SizedBox(height: 60),
            SizedBox(
              height: 200,
              width: 200,
              child: Image.asset('assets/images/logo-unila.png'),
            )
          ],
        ),
      ),
    );
  }
}
