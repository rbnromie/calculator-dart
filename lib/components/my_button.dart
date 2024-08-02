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
            backgroundColor: Colors.grey[300],
            elevation: 20,
            textStyle: const TextStyle(fontSize: 20),
            foregroundColor: Colors.black87,
          ),
          child: Text(name),
        ),
      ),
    );
  }
}
