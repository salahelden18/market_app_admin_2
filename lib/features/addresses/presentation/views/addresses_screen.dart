import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app_web_2/core/widgets/loading_shape.dart';
import 'package:market_app_web_2/core/widgets/loading_widget.dart';
import 'package:market_app_web_2/core/widgets/text_button_widget.dart';
import 'package:market_app_web_2/features/addresses/presentation/model_view/countries_cubit/countries_cubit.dart';
import 'package:market_app_web_2/features/addresses/presentation/views/countries/add_new_country_screen.dart';
import 'package:market_app_web_2/features/addresses/presentation/views/widgets/title_and_edit_and_delete_item_widget.dart';
import 'package:market_app_web_2/service_locator.dart';

class AddressesScreen extends StatefulWidget {
  static const routeName = 'countries-screen';
  const AddressesScreen({super.key});

  @override
  State<AddressesScreen> createState() => _AddressesScreenState();
}

class _AddressesScreenState extends State<AddressesScreen> {
  @override
  void initState() {
    sl<CountriesCubit>().getCountries();
  }

  @override
  Widget build(BuildContext context) {
    // final cubit = context.watch<CountriesCubit>();
    bool isLoading = false;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Addresses (Countries)'),
      ),
      body: BlocBuilder<CountriesCubit, CountriesStates>(
        builder: (context, state) {
          if (state is GetCountriesLoadingState) {
            return const LoadingWidget();
          } else if (state is GetCountriesSuccessState) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  // Add a new country text button
                  TextButtonWidget(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(AddEditCountry.routeName);
                      },
                      title: 'Add new country'),
                  // A space
                  const SizedBox(height: 15),
                  // The list of cities
                  ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) =>
                        TitleAndEditAndDeleteItemWidget(
                      title: state.countries[index].enName!,
                      id: state.countries[index].id!,
                    ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    itemCount: state.countries.length,
                  ),
                ],
              ),
            );
          }
          return const Text('sdflksjdfdsj');
        },
      ),
    );
  }
}
