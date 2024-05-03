import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/city_request_model.dart';
import '../district/district_screen.dart';
import '../widgets/add_edit_common.dart';

import '../../model_view/city_cubit/city_cubit.dart';
import '../../model_view/city_cubit/city_states.dart';
import '../../../../../core/utils/dialog_manager_overlay.dart';
import '../../../../../core/utils/show_modal_sheet.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../../../../../core/widgets/add_button_navigation_bar.dart';
import '../widgets/title_and_edit_and_delete_item_widget.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});
  static const String routeName = "/city-screen";

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  bool isExecuted = false;
  late String countryId;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!isExecuted) {
      countryId = ModalRoute.of(context)!.settings.arguments as String;
      context.read<CityCubit>().getCities(countryId);
      isExecuted = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Address (City)'),
      ),
      bottomNavigationBar: AddButtonNavigationBarWidget(
        ontap: () {
          showModalSheet(
            context,
            AddEditCommon(
              fn: (enName, trName, arName) async {
                CityRequetsModel cityRequetsModel = CityRequetsModel(
                  arName: arName,
                  enName: enName,
                  trName: trName,
                  countryId: countryId,
                );

                await context.read<CityCubit>().addCity(cityRequetsModel);
              },
            ),
          );
        },
        title: 'Add New City',
      ),
      body: BlocBuilder<CityCubit, CityStates>(
        builder: (context, state) {
          if (state is CityLoadingState) {
            return const LoadingWidget();
          } else if (state is CitySuccessState) {
            return ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              itemBuilder: (context, index) => TitleAndEditAndDeleteItemWidget(
                title: state.cities[index].enName!,
                id: state.cities[index].id,
                deleteOnTap: () async {
                  DialogManagerOverlay.showDialogWithMessage(context);
                  await context
                      .read<CityCubit>()
                      .deleteCity(state.cities[index].id);
                  DialogManagerOverlay.closeDialog();
                },
                editOnTap: () async {
                  showModalSheet(
                    context,
                    AddEditCommon(
                      model: state.cities[index],
                      fn: (enName, trName, arName) async {
                        CityRequetsModel cityRequetsModel = CityRequetsModel(
                          arName: arName,
                          enName: enName,
                          trName: trName,
                          countryId: countryId,
                        );

                        await context.read<CityCubit>().updateCity(
                            state.cities[index].id, cityRequetsModel);
                      },
                    ),
                  );
                },
                onTap: () {
                  Navigator.of(context).pushNamed(DistrictScreen.routeName,
                      arguments: state.cities[index].id);
                },
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: state.cities.length,
            );
          }
          final errorMessage =
              state is CityFailureState ? state.errorMessage : 'Error';
          return Text(errorMessage);
        },
      ),
    );
  }
}
