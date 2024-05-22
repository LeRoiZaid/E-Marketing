import 'package:e_markting/features/dashboard/modules/cart/controller/cart_cubit.dart';
import 'package:e_markting/features/dashboard/modules/cart/view/component/cart_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  Future<void> _launchURL(BuildContext context, String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch $url')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          final CartCubit controller = context.read<CartCubit>();
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/3.jpg'),
                fit: BoxFit.fill,
              ),
            ),
            child: Scaffold(
              body: state is CartStateLoading
                  ? const Center(child: CircularProgressIndicator())
                  : state is CartStateEmpty
                      ? const Center(
                          child: Icon(
                            CupertinoIcons.delete,
                            size: 100,
                            color: Colors.blue,
                          ),
                        )
                      : ListView.builder(
                          itemBuilder: (_, int index) => CartItemWidget(
                            productModel: controller.products[index],
                            controller: controller,
                          ),
                          itemCount: controller.products.length,
                        ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Total Price'),
                        content: Text('Total Price: \$${controller.calculateTotalPrice()}'),
                        actions: <Widget>[
                          TextButton(
                            child: Text('Cancel'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: Text('Ok'),
                            onPressed: () async {
                              const url = 'https://web.vodafone.com.eg/ar/vodafone-cash-online-payment-service';  
                              await _launchURL(context, url);
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Icon(
                  Icons.shopping_bag,
                  color: Colors.white,
                ),
                backgroundColor: Colors.blue,
              ),
            ),
          );
        },
      ),
    );
  }
}
