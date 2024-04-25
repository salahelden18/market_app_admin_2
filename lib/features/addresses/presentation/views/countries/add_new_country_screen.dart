import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app_web_2/core/widgets/loading_shape.dart';
import 'package:market_app_web_2/core/widgets/my_main_button.dart';
import 'package:market_app_web_2/core/widgets/text_form_field_widget.dart';
import 'package:market_app_web_2/features/addresses/data/models/add_address_model.dart';
import 'package:market_app_web_2/features/addresses/presentation/model_view/countries_cubit/countries_cubit.dart';
import 'package:market_app_web_2/service_locator.dart';

class AddEditCountry extends StatelessWidget {
  static const String routeName = 'add-edit-country-screen';
  final TextEditingController enNameController = TextEditingController();
  final TextEditingController trNameController = TextEditingController();
  final TextEditingController arNameController = TextEditingController();
  final TextEditingController countryCodeController = TextEditingController();
  final TextEditingController countryIsoCodeController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  AddEditCountry({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return BlocConsumer<CountriesCubit, CountriesStates>(
      listener: (context, state) {
        if (state is AddCountryLoadingState) {
          isLoading = true;
        }
        if (state is GetCountriesSuccessState) {
          Navigator.pop(context);
        }
        isLoading = false;
      },
      builder: (context, state) {
        return LoadingShapeFullScreen(
          condition: isLoading,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Add Country'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(15),
              child: Form(
                key: formKey,
                child: ListView(
                  children: [
                    TextFormFieldWidget(
                      label: 'English Name ',
                      controller: enNameController,
                      validator: (v) {
                        if (v!.isEmpty) {
                          return 'Must not be empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    TextFormFieldWidget(
                      label: 'Turkish Name ',
                      controller: trNameController,
                      validator: (v) {
                        if (v!.isEmpty) {
                          return 'Must not be empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    TextFormFieldWidget(
                      label: 'Arabic Name ',
                      controller: arNameController,
                      validator: (v) {
                        if (v!.isEmpty) {
                          return 'Must not be empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    TextFormFieldWidget(
                      label: 'Country Code',
                      controller: countryCodeController,
                      validator: (v) {
                        if (v!.isEmpty) {
                          return 'Must not be empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    TextFormFieldWidget(
                      label: 'Country Iso Code',
                      controller: countryIsoCodeController,
                      validator: (v) {
                        if (v!.isEmpty) {
                          return 'Must not be empty';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(10),
              child: MyMainButton(
                context: context,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    AddAddressModel addAddressModel = AddAddressModel(
                      enName: enNameController.text,
                      arName: arNameController.text,
                      trName: trNameController.text,
                      countryIsoCode: countryIsoCodeController.text,
                      countryCode: countryCodeController.text,
                    );

                    sl<CountriesCubit>()
                        .addCountry(addAddressModel: addAddressModel);
                  }
                },
                title: 'Add',
              ),
            ),
          ),
        );
      },
    );
  }
}
