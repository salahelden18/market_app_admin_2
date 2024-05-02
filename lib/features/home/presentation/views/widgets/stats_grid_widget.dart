import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model_views/stats/stats_cubit.dart';
import '../../model_views/stats/stats_states.dart';

import 'stats_item_widget.dart';

class StatsGridWidget extends StatelessWidget {
  const StatsGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.read<StatsCubit>().state;
    return state is StatsSuccessState
        ? SliverPadding(
            padding: const EdgeInsets.all(10),
            sliver: SliverGrid.builder(
              itemCount: state.stats.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemBuilder: (ctx, index) => StatsItemWidget(
                statisticsModel: state.stats[index],
              ),
            ),
          )
        : const SizedBox();
  }
}
