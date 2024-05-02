import 'package:e_markting/dashboard/controller/dashboard_state.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardController extends Cubit<DashboardState> {
  DashboardController() : super(DashboardChangeState());

  int selectedTapIndex = 0;
  final PageController pageController = PageController();

  void onChangeTabIndex(int index) {
  /*  if (index == 5) {
      throw 'dummy exception from mobile';
    }*/
    selectedTapIndex = index;
    pageController.jumpToPage(selectedTapIndex);
    emit(DashboardChangeState());
  }
}
