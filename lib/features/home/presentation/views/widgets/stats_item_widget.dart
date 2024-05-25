import 'package:flutter/material.dart';
import '../../../../../core/style/app_colors.dart';
import '../../../../../core/style/font_style.dart';
import '../../../data/models/statistics_model.dart';

class StatsItemWidget extends StatelessWidget {
  const StatsItemWidget({super.key, required this.statisticsModel});
  final StatisticsModel statisticsModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (statisticsModel.screenName != null) {
          Navigator.of(context).pushNamed(statisticsModel.screenName!);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 1),
              blurRadius: 3,
              spreadRadius: 3,
              color: Colors.black12,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FittedBox(
              child: Text(
                statisticsModel.name,
                style: FontStyle.size22Black600.copyWith(color: Colors.white),
                maxLines: 1,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              statisticsModel.count.toString(),
              style: FontStyle.size22Black600.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
