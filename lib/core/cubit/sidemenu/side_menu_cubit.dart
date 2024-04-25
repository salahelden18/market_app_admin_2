import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app_web_2/core/constants/list_constants.dart';
import 'package:market_app_web_2/core/cubit/sidemenu/side_menu_state.dart';

class SideMenuCubit extends Cubit<SideMenuState> {
  SideMenuCubit() : super(const SideMenuState());

  void init() {
    emit(
      state.copyWith(
        sideMenuList: ListConstants.adminSideMenuList,
        selectedItem: ListConstants.adminSideMenuList[0],
      ),
    );
  }

  void selectItem(int id) {
    final index = state.sideMenuList.indexWhere((element) => element.id == id);
    final item = state.sideMenuList[index];

    emit(state.copyWith(selectedItem: item));
  }
}
