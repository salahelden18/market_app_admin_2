import 'package:equatable/equatable.dart';

import '../../models/side_menu_model.dart';

class SideMenuState extends Equatable {
  final List<SideMenuModel> sideMenuList;
  final SideMenuModel? selectedItem;

  const SideMenuState({this.sideMenuList = const [], this.selectedItem});

  SideMenuState copyWith({
    List<SideMenuModel>? sideMenuList,
    SideMenuModel? selectedItem,
  }) {
    return SideMenuState(
        selectedItem: selectedItem ?? this.selectedItem,
        sideMenuList: sideMenuList ?? this.sideMenuList);
  }

  @override
  List<Object?> get props => [sideMenuList, selectedItem];
}
