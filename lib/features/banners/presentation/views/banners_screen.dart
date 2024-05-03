import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app_web_2/core/style/app_colors.dart';
import 'package:market_app_web_2/core/widgets/loading_widget.dart';
import 'package:market_app_web_2/features/banners/presentation/model_views/banner_states.dart';
import 'package:market_app_web_2/features/banners/presentation/model_views/banners_cubit.dart';

class BannersScreen extends StatefulWidget {
  const BannersScreen({super.key});
  static const String routeName = '/banners-screen';

  @override
  State<BannersScreen> createState() => _BannersScreenState();
}

class _BannersScreenState extends State<BannersScreen> {
  @override
  void initState() {
    super.initState();
    if (context.read<BannersCubit>().state is! BannerSuccessState) {
      context.read<BannersCubit>().getBanners();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Banners'),
      ),
      body: BlocBuilder<BannersCubit, BannerStates>(
        builder: (context, state) {
          if (state is BannerLoadingState) {
            return const LoadingWidget();
          } else if (state is BannerSuccessState) {
            return ListView.separated(
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index) => Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColors.lightGray,
                  ),
                ),
                child: Image.network(
                  state.banners[index].imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 15),
              itemCount: state.banners.length,
            );
          } else {
            final errorMessage =
                state is BannerFailureState ? state.errorMessage : 'Error';
            return Center(
              child: Text(errorMessage),
            );
          }
        },
      ),
    );
  }
}
