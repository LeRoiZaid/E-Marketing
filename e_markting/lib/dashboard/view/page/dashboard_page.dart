import 'package:e_markting/dashboard/controller/dashboard_controller.dart';
import 'package:e_markting/dashboard/controller/dashboard_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class DashbordPage extends StatelessWidget {
  final List<String> titles = const ['Home', 'Categories', 'Add','Services','User'];

  const DashbordPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardController(),
      child: BlocBuilder<DashboardController, DashboardState>(
        builder: (context, state) {
          DashboardController controller = context.read<DashboardController>();
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.yellow,
              title: Text(
                titles[controller.selectedTapIndex],
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'registration');
                    },
                    icon: Icon(CupertinoIcons.add))
              ],
            ),
            body: PageView(
              controller: controller.pageController,
              onPageChanged: controller.onChangeTabIndex,
              children: const [
                Text('Home'),
                Text('Categories'),
                Text('Add'),
                Text('Services'),
              //  UserPage(),
                Text('User'),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: controller.selectedTapIndex,
              onTap: controller.onChangeTabIndex,
              unselectedItemColor: Colors.black,
              showUnselectedLabels: true,
              unselectedLabelStyle: const TextStyle(fontSize: 15, color: Colors.red),
              items: const [
                BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: 'home'),
                BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Categories'),
                BottomNavigationBarItem(icon: Icon(CupertinoIcons.add), label: 'Add'),
                
                BottomNavigationBarItem(icon: Icon(Icons.room_service), label: 'Services'),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: 'users'),
              ],
            ),
          );
        },
      ),
    );
  }
}
