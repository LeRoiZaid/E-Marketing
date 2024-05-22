import 'package:bloc/bloc.dart';
import 'package:e_markting/features/dashboard/modules/product/controller/product_cubit.dart';
import 'package:e_markting/features/dashboard/modules/product/model/entity_model/product_model.dart';
import 'package:e_markting/features/dashboard/modules/product/model/repo/database_repo.dart';

import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartStateLoading()) {
    init();
  }

  List<ProductModel> products = [];

  DatabaseRepo repo = DatabaseRepo();

  Future<void> init() async {
    emit(CartStateLoading());
    await repo.initDB();

    products = await repo.fetchCartProducts();
    if (products.isEmpty) {
      emit(CartStateEmpty());
    } else {
      emit(CartStateLoaded());
    }
  }

  Future<void> addItemToCart(int id, int value, int? qunt) async {
    repo.updateCart(value, id, qunt);
    await init();
    await ProductCubit.instance.init();
    emit(CartStateLoaded());
  }

  double calculateTotalPrice() {
    double totalPrice = 0;
    for (var product in products) {
    //  if(product.cart==1) {
        totalPrice +=product.price!;
      //}
    }
    return totalPrice;
  }
}
