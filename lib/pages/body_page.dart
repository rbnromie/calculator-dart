import 'package:calculator/components/my_button.dart';
import 'package:flutter/material.dart';

class BodyPage extends StatefulWidget {
  const BodyPage({super.key});

  @override
  State<BodyPage> createState() => _BodyPageState();
}

class _BodyPageState extends State<BodyPage> {
  final firstController = TextEditingController();
  final secondController = TextEditingController();

  Widget _input(String hint, TextEditingController controller) {
    return TextField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: hint,
        labelStyle: TextStyle(color: Color.fromARGB(255, 170, 170, 170)),
      ),
      style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      controller: controller,
    );
  }

  double result = 0;

  @override
  void dispose() {
    firstController.dispose();
    secondController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(221, 255, 255, 255),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
          child: Column(
            children: [
              // result
              Center(
                child: Text(
                  "$result",
                  style: const TextStyle(
                      fontSize: 30, color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),

              // spacing
              const SizedBox(
                height: 20,
              ),

              // text input 1
              _input("First Number", firstController),

              // spacing
              const SizedBox(
                height: 20,
              ),

              // text input 2
              _input("Second Number", secondController),

              // spacing
              const SizedBox(
                height: 50,
              ),

              // add button
              MyButton(
                name: "Addition",
                onTap: () {
                  add(firstController.text, secondController.text);
                },
              ),

              // subtract button
              MyButton(
                  name: "Subtraction",
                  onTap: () {
                    subtract(firstController.text, secondController.text);
                  }),

              // multiply button
              MyButton(
                  name: "Multiplication",
                  onTap: () {
                    multiply(firstController.text, secondController.text);
                  }),

              // divide button
              MyButton(
                  name: "Division",
                  onTap: () {
                    divide(firstController.text, secondController.text);
                  }),
            ],
          ),
        ),
      ),
    );
  }

  // button functions

  void add(String text1, String text2) {
    if (parseDouble(text1) && parseDouble(text2)) {
      double num1 = double.parse(text1);
      double num2 = double.parse(text2);

      setState(() {
        result = num1 + num2;
      });

      firstController.clear();
      secondController.clear();
    } else {
      mySnackBar("Invalid Input");
    }
  }

  void subtract(String text1, String text2) {
    if (parseDouble(text1) && parseDouble(text2)) {
      double num1 = double.parse(text1);
      double num2 = double.parse(text2);

      setState(() {
        result = num1 - num2;
      });

      firstController.clear();
      secondController.clear();
    } else {
      mySnackBar("Invalid Input");
    }
  }

  void multiply(String text1, String text2) {
    if (parseDouble(text1) && parseDouble(text2)) {
      double num1 = double.parse(text1);
      double num2 = double.parse(text2);

      setState(() {
        result = num1 * num2;
      });

      firstController.clear();
      secondController.clear();
    } else {
      mySnackBar("Invalid Input");
    }
  }

  void divide(String text1, String text2) {
    if (parseDouble(text1) && parseDouble(text2)) {
      double num1 = double.parse(text1);
      double num2 = double.parse(text2);

      if (num2 == 0) {
        mySnackBar("Cannot divide by zero");
        return;
      }

      setState(() {
        result = num1 / num2;
      });

      firstController.clear();
      secondController.clear();
    } else {
      mySnackBar("Invalid Input");
    }
  }

  // utilities
  void mySnackBar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(child: Text(text)),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  bool parseDouble(String text) {
    if (text.isEmpty) return false;

    double? value = double.tryParse(text);
    return value != null;
  }
}
