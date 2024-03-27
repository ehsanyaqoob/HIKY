import 'package:flutter/material.dart';
import 'package:hiky/Screens/Splash_Screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // landing page would be done later
      backgroundColor: Colors.teal[400],
      body: SingleChildScrollView(
        child: Column(children: [
          
        ],),
      ),
    );
  }
}
