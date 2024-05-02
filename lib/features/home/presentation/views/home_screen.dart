import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app_web_2/core/widgets/loading_widget.dart';
import 'package:market_app_web_2/features/home/presentation/model_views/stats/stats_cubit.dart';
import 'package:market_app_web_2/features/home/presentation/views/widgets/home_layout_widget.dart';
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
      body: FutureBuilder(
        future: getData(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingWidget();
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          return const HomeLayoutWidget();
        },
      ),
    );
  }

  Future getData(BuildContext context) async {
    await Future.wait([context.read<StatsCubit>().getStats()]);
  }
}
