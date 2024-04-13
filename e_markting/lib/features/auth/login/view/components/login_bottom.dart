import 'package:flutter/material.dart';

class LoginBottom extends StatelessWidget {
  const LoginBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
                    padding: const EdgeInsets.only(top: 0, left: 0, ),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "                    Sign In                     ",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        
                        backgroundColor: Color.fromARGB(255, 3, 32, 112),
                      ),
                    ),
                  ),const SizedBox(height: 10),
      const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("have no account ? ",style: TextStyle(
              fontWeight: FontWeight.bold,
            fontSize: 20,)),
          Text(
            "Registration",
           style: TextStyle(
            fontSize: 20,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              decorationThickness: 3,
              decorationColor: Color.fromARGB(255, 4, 204, 54)))]),
              const SizedBox(height: 10),
              const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Forget Password ? ",style: TextStyle(
              fontWeight: FontWeight.bold,
            fontSize: 20,)),
          Text(
            "Change Password",
           style: TextStyle(
            fontSize: 20,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              decorationThickness: 3,
              decorationColor: Color.fromARGB(255, 4, 228, 42)


  ),
          )
        ],
      )
    ]);
  }
}