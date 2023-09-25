import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_shop_app/images/my_images.dart';
import 'package:grocery_shop_app/pages/home_page.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(  
        children: [
          //logo
          Padding(
            padding: const EdgeInsets.only(left:80, right: 80, bottom: 40,top: 120),
            child: Image.asset(MyImages.avocado),
          ),

          //large text
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text('We deliver groceries at your doorstep',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(  
                fontSize: 40,
                fontWeight: FontWeight.bold
              ),
            ),
          ),

          const SizedBox(height: 24,),

          //small text
          Text('Fresh items everyday',
            style: TextStyle(color: Colors.grey[600]),
          ),

          const Spacer(),

          //get started button
          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage())),
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(  
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text('Get Started',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),

          const Spacer(),

        ],
      ),
    );
  }
}