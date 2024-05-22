import 'package:e_markting/features/dashboard/modules/users/model/user_model.dart';
import 'package:flutter/material.dart';

class UserItemWidget extends StatelessWidget {
  const UserItemWidget({super.key, required this.userModel});
  final UserModel userModel;

  final TextStyle x = const TextStyle(
    fontSize: 20,
    color: Colors.blue,
  );

  final TextStyle y = const TextStyle(
    fontSize: 20,
    color: Color.fromARGB(255, 2, 41, 86),
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      color: Color.fromARGB(255, 97, 88, 88),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(70.0),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: SingleChildScrollView(
          child: ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "User ID           :   ",
                    style: y,
                  ),
                  Expanded(
                    child: Text(
                      userModel.id ?? 'XXX',
                      style: x,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  Text(
                    "User Name     :   ",
                    style: y,
                  ),
                  Expanded(
                    child: Text(
                      userModel.name ?? 'XXX',
                      style: x,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  Text(
                    "User Email      :   ",
                    style: y,
                  ),
                  Expanded(
                    child: Text(
                      userModel.email ?? 'XXX',
                      style: x,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  Text(
                    "User Address :   ",
                    style: y,
                  ),
                  Expanded(
                    child: Text(
                      userModel.address ?? 'XXX',
                      style: x,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  Text(
                    "User Age         :   ",
                    style: y,
                  ),
                  Expanded(
                    child: Text(
                      userModel.age?.toString() ?? '0',
                      style: x,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
