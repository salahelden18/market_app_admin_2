import 'package:equatable/equatable.dart';

class SideMenuModel extends Equatable {
  final int id;
  final String title;
  final String navigationScreen;

  const SideMenuModel(
      {required this.id, required this.navigationScreen, required this.title});

  @override
  List<Object?> get props => [title, navigationScreen];
}
