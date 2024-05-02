import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app_web_2/features/addresses/presentation/views/city/city_screen.dart';
import '../../../../../core/utils/dialog_manager_overlay.dart';
import '../../../../../core/utils/show_modal_sheet.dart';
import 'add_edit_country.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../../model_view/countries_cubit/countries_cubit.dart';
import '../widgets/add_button_navigation_bar.dart';
import '../widgets/title_and_edit_and_delete_item_widget.dart';
import '../../model_view/countries_cubit/countries_state.dart';

class CountryScreen extends StatefulWidget {
  static const routeName = 'countries-screen';
  const CountryScreen({super.key});

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  @override
  void initState() {
    super.initState();
    if (context.read<CountriesCubit>().state is! CountriesSuccessState) {
      context.read<CountriesCubit>().getCountries();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Addresses (Countries)'),
      ),
      bottomNavigationBar: AddButtonNavigationBarWidget(
        ontap: () {
          showModalSheet(
            context,
            const AddEditCountry(),
          );
        },
        title: 'Add New Country',
      ),
      body: BlocBuilder<CountriesCubit, CountriesStates>(
        builder: (context, state) {
          if (state is CountriesLoadingState) {
            return const LoadingWidget();
          } else if (state is CountriesSuccessState) {
            return ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              itemBuilder: (context, index) => TitleAndEditAndDeleteItemWidget(
                title: state.countries[index].enName!,
                id: state.countries[index].id!,
                deleteOnTap: () async {
                  DialogManagerOverlay.showDialogWithMessage(context);
                  await context
                      .read<CountriesCubit>()
                      .deleteCountry(state.countries[index].id!);
                  DialogManagerOverlay.closeDialog();
                },
                editOnTap: () async {
                  showModalSheet(
                    context,
                    AddEditCountry(country: state.countries[index]),
                  );
                },
                onTap: () {
                  Navigator.of(context).pushNamed(CityScreen.routeName,
                      arguments: state.countries[index].id);
                },
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: state.countries.length,
            );
          }
          final errorMessage =
              state is CountriesFailureState ? state.errorMessage : 'Error';
          return Text(errorMessage);
        },
      ),
    );
  }
}
