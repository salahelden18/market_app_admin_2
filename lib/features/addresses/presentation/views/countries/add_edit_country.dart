import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/country_model.dart';
import '../../../../../core/utils/dialog_manager_overlay.dart';
import '../../../../../core/widgets/filled_button_widget.dart';
import '../../../../../core/widgets/text_form_field_widget.dart';
import '../../model_view/countries_cubit/countries_cubit.dart';
import '../widgets/address_fields_names_widget.dart';
import '../widgets/common_bottom_sheet_widget.dart';

import '../../../data/models/country_request_model.dart';

class AddEditCountry extends StatefulWidget {
  const AddEditCountry({super.key, this.country});
  final CountryModel? country;

  @override
  State<AddEditCountry> createState() => _AddEditCountryState();
}

class _AddEditCountryState extends State<AddEditCountry> {
  final TextEditingController enNameController = TextEditingController();
  final TextEditingController trNameController = TextEditingController();
  final TextEditingController arNameController = TextEditingController();
  final TextEditingController countryCodeController = TextEditingController();
  final TextEditingController countryIsoCodeController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    enNameController.text = widget.country?.enName ?? '';
    trNameController.text = widget.country?.trName ?? '';
    arNameController.text = widget.country?.arName ?? '';
    countryCodeController.text = widget.country?.countryCode ?? '';
    countryIsoCodeController.text = widget.country?.countryIsoCode ?? '';
  }

  @override
  void dispose() {
    super.dispose();
    enNameController.dispose();
    trNameController.dispose();
    arNameController.dispose();
    countryCodeController.dispose();
    countryIsoCodeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommonBottomSheetWidget(
      formKey: _formKey,
      widget: Column(
        children: [
          AddressFieldsNamesWidget(
            arNameController: arNameController,
            enNameController: enNameController,
            trNameController: trNameController,
          ),
          const SizedBox(height: 10),
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
          const SizedBox(height: 10),
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
          const SizedBox(height: 15),
          FilledButtonWidget(
            onPress: () async {
              final isValid = _formKey.currentState!.validate();
              if (isValid) {
                DialogManagerOverlay.showDialogWithMessage(context);
                CountryRequestModel addAddressModel = CountryRequestModel(
                  enName: enNameController.text,
                  arName: arNameController.text,
                  trName: trNameController.text,
                  countryIsoCode: countryIsoCodeController.text,
                  countryCode: countryCodeController.text,
                );
                if (widget.country == null) {
                  await context
                      .read<CountriesCubit>()
                      .addCountry(addAddressModel: addAddressModel);
                } else {
                  await context
                      .read<CountriesCubit>()
                      .updateAddress(widget.country!.id!, addAddressModel);
                }

                DialogManagerOverlay.closeDialog();
                if (context.mounted) {
                  Navigator.of(context).pop();
                }
              }
            },
            widget: Text('${widget.country == null ? 'Add' : 'Edit'} Address'),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
