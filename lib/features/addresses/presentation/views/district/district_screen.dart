import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app_web_2/features/addresses/data/models/district_request_model.dart';
import 'package:market_app_web_2/features/addresses/presentation/views/widgets/add_edit_common.dart';
import '../subdistrict/subdistrict_screen.dart';
import '../../model_view/districts_cubit/district_cubit.dart';
import '../../model_view/districts_cubit/district_states.dart';

import '../../../../../core/utils/dialog_manager_overlay.dart';
import '../../../../../core/utils/show_modal_sheet.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../widgets/add_button_navigation_bar.dart';
import '../widgets/title_and_edit_and_delete_item_widget.dart';

class DistrictScreen extends StatefulWidget {
  const DistrictScreen({super.key});
  static const String routeName = "/district-screen";

  @override
  State<DistrictScreen> createState() => _DistrictScreenState();
}

class _DistrictScreenState extends State<DistrictScreen> {
  bool isExecuted = false;
  late String cityId;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!isExecuted) {
      cityId = ModalRoute.of(context)!.settings.arguments as String;
      context.read<DistrictCubit>().getDistricts(cityId);
      isExecuted = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Address (District)'),
      ),
      bottomNavigationBar: AddButtonNavigationBarWidget(
        ontap: () {
          showModalSheet(
            context,
            AddEditCommon(
              fn: (enName, trName, arName) async {
                DistrictRequestModel districtRequestModel =
                    DistrictRequestModel(
                  cityId: cityId,
                  arName: arName,
                  enName: enName,
                  trName: trName,
                );
                await context
                    .read<DistrictCubit>()
                    .addDistrict(districtRequestModel);
              },
            ),
          );
        },
        title: 'Add New District',
      ),
      body: BlocBuilder<DistrictCubit, DistrictStates>(
        builder: (context, state) {
          if (state is DistrictLoadingState) {
            return const LoadingWidget();
          } else if (state is DistrictSuccessState) {
            return ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              itemBuilder: (context, index) => TitleAndEditAndDeleteItemWidget(
                title: state.districts[index].enName!,
                id: state.districts[index].id,
                deleteOnTap: () async {
                  DialogManagerOverlay.showDialogWithMessage(context);
                  await context
                      .read<DistrictCubit>()
                      .deleteDistrict(state.districts[index].id);
                  DialogManagerOverlay.closeDialog();
                },
                editOnTap: () async {
                  showModalSheet(
                    context,
                    AddEditCommon(
                      model: state.districts[index],
                      fn: (enName, trName, arName) async {
                        DistrictRequestModel districtRequestModel =
                            DistrictRequestModel(
                          cityId: cityId,
                          arName: arName,
                          enName: enName,
                          trName: trName,
                        );
                        await context.read<DistrictCubit>().updateDistrict(
                            state.districts[index].id, districtRequestModel);
                      },
                    ),
                  );
                },
                onTap: () {
                  Navigator.of(context).pushNamed(SubDistrictScreen.routeName,
                      arguments: state.districts[index].id);
                },
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: state.districts.length,
            );
          }
          final errorMessage =
              state is DistrictFailureState ? state.errorMessage : 'Error';
          return Text(errorMessage);
        },
      ),
    );
  }
}
