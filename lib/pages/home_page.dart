import 'package:calculator/pages/body_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          child: Text(
            "Calculator",
            style: TextStyle(fontSize: 26, color: Colors.white),
          ),
        ),
      ),
      body: const BodyPage(),
    );
  }
}
