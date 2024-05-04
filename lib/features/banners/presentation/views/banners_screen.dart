import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app_web_2/core/utils/dialog_manager_overlay.dart';
import 'package:market_app_web_2/features/banners/presentation/views/add_banner_screen.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../model_views/banner_states.dart';
import '../model_views/banners_cubit.dart';

class BannersScreen extends StatefulWidget {
  const BannersScreen({super.key});
  static const String routeName = '/banners-screen';

  @override
  State<BannersScreen> createState() => _BannersScreenState();
}

class _BannersScreenState extends State<BannersScreen> {
  bool isActive = true;

  @override
  void initState() {
    super.initState();
    context.read<BannersCubit>().getBanners();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Banners'),
        actions: [
          IconButton(
            onPressed: () async {
              var result = await Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => BlocProvider.value(
                    value: context.read<BannersCubit>(),
                    child: const AddBannerScreen()),
              ));

              if (result == true && context.mounted) {
                context.read<BannersCubit>().getBanners(isActive);
              }
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: SwitchListTile(
              title: const Text('Active Banners'),
              value: isActive,
              onChanged: (value) {
                setState(() {
                  isActive = value;
                });
                context.read<BannersCubit>().getBanners(isActive);
              },
            ),
          ),
          BlocBuilder<BannersCubit, BannerStates>(
            builder: (context, state) {
              if (state is BannerLoadingState) {
                return const LoadingWidget();
              } else if (state is BannerSuccessState) {
                return Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(10),
                    itemBuilder: (context, index) => Stack(
                      children: [
                        Container(
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
                        Positioned(
                          top: 10,
                          right: 10,
                          child: InkWell(
                            onTap: () async {
                              DialogManagerOverlay.showDialogWithMessage(
                                  context);
                              await context.read<BannersCubit>().toggleBanner(
                                  state.banners[index].id, isActive);
                              DialogManagerOverlay.closeDialog();
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Icon(
                                isActive ? Icons.toggle_off : Icons.toggle_on,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 15),
                    itemCount: state.banners.length,
                  ),
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
        ],
      ),
    );
  }
}
