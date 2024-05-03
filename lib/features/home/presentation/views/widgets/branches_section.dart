import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../branch/presentation/model_views/branch_cubit/branch_cubit.dart';
import '../../../../branch/presentation/model_views/branch_cubit/branch_states.dart';
import '../../../../branch/presentation/views/widgets/branch_item_widget.dart';

class BranchesSection extends StatelessWidget {
  const BranchesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<BranchCubit>().state;
    return state is BranchSuccessState
        ? SliverPadding(
            padding: const EdgeInsets.all(10),
            sliver: SliverList.builder(
              itemCount: state.branches.length,
              itemBuilder: (ctx, index) =>
                  BranchItemWidget(branchModel: state.branches[index]),
            ),
          )
        : const SliverToBoxAdapter();
  }
}
