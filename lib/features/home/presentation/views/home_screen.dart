import 'package:flutter/material.dart';
import '../../../../core/widgets/drawer_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = '/dashBoard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      drawer: const DrawerWidget(),
      body: const Center(
        child: Text('Home'),
      ),
    );
  }
}
