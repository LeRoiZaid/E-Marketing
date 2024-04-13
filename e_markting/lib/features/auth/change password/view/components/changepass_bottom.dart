import 'package:flutter/material.dart';

class ChangePassBottom extends StatelessWidget {
  const ChangePassBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
  Container(
                    padding: const EdgeInsets.only(top: 0, left: 0, ),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "                       Change Password                   ",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        
                        backgroundColor: Color.fromARGB(255, 3, 32, 112),
                      ),
                    ),
                  )
                  
      
          
        ],
      )
    ;
  }
}