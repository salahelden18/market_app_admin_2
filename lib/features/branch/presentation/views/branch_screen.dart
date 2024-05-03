import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'add_edit_branch_screen.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../model_views/branch_cubit/branch_cubit.dart';
import '../model_views/branch_cubit/branch_states.dart';
import 'widgets/branch_item_widget.dart';

class BranchScreen extends StatelessWidget {
  const BranchScreen({super.key});
  static const String routeName = '/branch-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Branches'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddEditBranchScreen.routeName);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: BlocBuilder<BranchCubit, BranchStates>(
        builder: (context, state) {
          if (state is BranchLoadingState) {
            return const LoadingWidget();
          } else if (state is BranchSuccessState) {
            return ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: state.branches.length,
              itemBuilder: (ctx, index) => BranchItemWidget(
                branchModel: state.branches[index],
              ),
            );
          } else {
            final errorMessage =
                state is BranchFailureState ? state.errorMessage : 'Error';
            return Center(
              child: Text(errorMessage),
            );
          }
        },
      ),
    );
  }
}
