import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/branch_module_drawer_widget.dart';
import '../../../../branch/presentation/model_views/selected_branch/selected_branch_cubit.dart';

class BranchModuleScreen extends StatelessWidget {
  const BranchModuleScreen({super.key});
  static const String routeName = '/branch-module-screen';

  @override
  Widget build(BuildContext context) {
    final branch = context.read<SelectedBranchCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text(branch.state?.enName ?? 'Branch'),
      ),
      drawer: const BranchModuleDrawerWidget(),
      body: const Center(
        child: Text('Display Orders Here'),
      ),
    );
  }
}
