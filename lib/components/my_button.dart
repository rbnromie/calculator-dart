import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String name;
  final VoidCallback onTap;

  const MyButton({super.key, required this.name, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 223, 223, 223),
            elevation: 20,
            textStyle: const TextStyle(fontSize: 20),
            foregroundColor: Color.fromARGB(221, 0, 0, 0),
          ),
          child: Text(name),
        ),
      ),
    );
  }
}
