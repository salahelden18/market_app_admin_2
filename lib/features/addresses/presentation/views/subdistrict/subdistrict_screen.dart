import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/subdistrict_request_model.dart';
import '../../model_view/sub_districts_cubit/subdistrict_cubit.dart';
import '../../model_view/sub_districts_cubit/subdistrict_states.dart';
import '../../../../../core/utils/dialog_manager_overlay.dart';
import '../../../../../core/utils/show_modal_sheet.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../../../../../core/widgets/add_button_navigation_bar.dart';
import '../widgets/add_edit_common.dart';
import '../widgets/title_and_edit_and_delete_item_widget.dart';

class SubDistrictScreen extends StatefulWidget {
  const SubDistrictScreen({super.key});
  static const String routeName = '/subdistrict_screen';

  @override
  State<SubDistrictScreen> createState() => _SubDistrictScreenState();
}

class _SubDistrictScreenState extends State<SubDistrictScreen> {
  bool isExecuted = false;
  late String districtId;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!isExecuted) {
      districtId = ModalRoute.of(context)!.settings.arguments as String;
      context.read<SubDistrictCubit>().getSubDistricts(districtId);
      isExecuted = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Address (Sub District)'),
      ),
      bottomNavigationBar: AddButtonNavigationBarWidget(
        ontap: () {
          showModalSheet(
            context,
            AddEditCommon(
              fn: (enName, trName, arName) async {
                SubDistrictRequestModel districtRequestModel =
                    SubDistrictRequestModel(
                  districtId: districtId,
                  arName: arName,
                  enName: enName,
                  trName: trName,
                );
                await context
                    .read<SubDistrictCubit>()
                    .addSubDistrict(districtRequestModel);
              },
            ),
          );
        },
        title: 'Add New Sub District',
      ),
      body: BlocBuilder<SubDistrictCubit, SubDistrictStates>(
        builder: (context, state) {
          if (state is SubDistrictLoadingState) {
            return const LoadingWidget();
          } else if (state is SubDistrictSuccessState) {
            return ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              itemBuilder: (context, index) => TitleAndEditAndDeleteItemWidget(
                title: state.subdistricts[index].enName!,
                id: state.subdistricts[index].id,
                deleteOnTap: () async {
                  DialogManagerOverlay.showDialogWithMessage(context);
                  await context
                      .read<SubDistrictCubit>()
                      .deleteSubDistrict(state.subdistricts[index].id);
                  DialogManagerOverlay.closeDialog();
                },
                editOnTap: () async {
                  showModalSheet(
                    context,
                    AddEditCommon(
                      model: state.subdistricts[index],
                      fn: (enName, trName, arName) async {
                        SubDistrictRequestModel subDistrictRequestModel =
                            SubDistrictRequestModel(
                          districtId: districtId,
                          arName: arName,
                          enName: enName,
                          trName: trName,
                        );
                        await context
                            .read<SubDistrictCubit>()
                            .updateSubDistrict(state.subdistricts[index].id,
                                subDistrictRequestModel);
                      },
                    ),
                  );
                },
                onTap: () {},
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: state.subdistricts.length,
            );
          }
          final errorMessage =
              state is SubDistrictFailureState ? state.errorMessage : 'Error';
          return Text(errorMessage);
        },
      ),
    );
  }
}
