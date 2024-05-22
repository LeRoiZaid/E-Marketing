//import 'dart:js_util';

import 'package:e_markting/features/auth/Registration/view/page/index.dart';
import 'package:e_markting/features/auth/login/controller/cubit/login_cubit.dart';
import 'package:e_markting/features/auth/login/view/page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:e_markting/features/dashboard/controller/dashboard_cubit.dart';
import 'package:e_markting/features/dashboard/modules/cart/view/page/cart_page.dart';
import 'package:e_markting/features/dashboard/modules/favorite/view/page/favorite_page.dart';
import 'package:e_markting/features/dashboard/modules/new_product/view/page/new_product_page.dart';
import 'package:e_markting/features/dashboard/modules/product/view/page/product_page.dart';
import 'package:e_markting/features/dashboard/modules/users/view/page/user_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardCubit(),
      child: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          DashboardCubit cubit = context.read<DashboardCubit>();
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue[700],
               actions: [ 
    IconButton(
      onPressed: () {
        Navigator.pushNamed(context, 'new_product');
       },
       icon: const Icon(CupertinoIcons.plus),
        ),
       ],
            ),
        drawer: Drawer(
  child: ListView(
    padding: EdgeInsets.zero,
    children: <Widget>[
      DrawerHeader(
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter:ColorFilter.mode(Color.fromARGB(255, 150, 118, 118),BlendMode.dstATop),
            image: AssetImage('assets/images/8.jpg'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue,
        ),
        child: Text(
          '',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
      ListTile(
        leading: Icon(CupertinoIcons.home),
        title: Text('الصفحة الرئيسية'),
        onTap: () {
          Navigator.pushNamed(context, 'dashboard');
        },
      ),
      ListTile(
        leading: Icon(Icons.add_circle),
        title: Text('منتج جديد'),
        onTap: () {
          Navigator.pushNamed(context, 'new_product');
        },
      ),
      ListTile(
        leading: Icon(Icons.person_add),
        title: Text('اضافة حساب جديد'),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RegistrationPage()));
        },
      ),
      ListTile(
        leading: Icon(Icons.login),
        title: Text('تسجيل الدخول'),
        onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginPage()));
        },
      ),
    ],
  ),
),

            body: PageView(
              dragStartBehavior: DragStartBehavior.down,
              controller: cubit.pageController,
              onPageChanged: cubit.onChangeTab,
              children: [
                ProductPage(),
                FavoritePage(),
            //    NewProductPage(),
                UserPage(),
                CartPage(),
              ],
            ),
          bottomNavigationBar: BottomNavigationBar(
  selectedItemColor: Color.fromARGB(255, 9, 2, 90),
  unselectedItemColor: const Color.fromARGB(255, 121, 98, 98),
  backgroundColor: Color.fromARGB(255, 157, 51, 79), // Background color for bottom navigation bar
  currentIndex: cubit.currentIndex,
  onTap: cubit.onChangeTab,
  items: [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.collections),
      label: 'product',
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.heart),
      label: 'favorite',
    ),
    
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.person),
      label: 'user',
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.cart),
      label: 'cart',
    ),
  ],
),

          );
        },
      ),
    );
  }
}
