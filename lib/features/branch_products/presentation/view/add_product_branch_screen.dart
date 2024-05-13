import 'package:flutter/material.dart';
import 'package:market_app_web_2/core/widgets/add_button_navigation_bar.dart';
import 'package:market_app_web_2/core/widgets/text_form_field_widget.dart';
import 'package:market_app_web_2/features/addresses/presentation/views/widgets/dropdown_button_form_field_widget.dart';

class AddProductBranchScreen extends StatefulWidget {
  static const routeName = 'add-products-screen';
  const AddProductBranchScreen({super.key});

  @override
  State<AddProductBranchScreen> createState() => _AddProductBranchScreenState();
}

class _AddProductBranchScreenState extends State<AddProductBranchScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController stockController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController discountValueController = TextEditingController();
  int? discountTypes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Branch Product')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsetsDirectional.all(10),
          children: [
            DropdownButtonFormFieldWidget<int>(
                selectedValue: discountTypes,
                hint: 'Category',
                items: const [
                  DropdownMenuItem<int>(
                    value: 1,
                    child: Text('Persentage %'),
                  ),
                  DropdownMenuItem<int>(
                    value: 0,
                    child: Text('Discount -'),
                  ),
                ],
                onChanged: (value) {}),
            const SizedBox(height: 20),
            DropdownButtonFormFieldWidget<int>(
              
                selectedValue: discountTypes,
                hint: 'Sub Category',
                items: const [
                  DropdownMenuItem<int>(
                    value: 1,
                    child: Text('Persentage %'),
                  ),
                  DropdownMenuItem<int>(
                    value: 0,
                    child: Text('Discount -'),
                  ),
                ],
                onChanged: (value) {}),
            const SizedBox(height: 20),
            TextFormFieldWidget(
              textInputType: TextInputType.number,
              controller: stockController,
              label: 'Stock',
            ),
            const SizedBox(height: 20),
            TextFormFieldWidget(
              textInputType: TextInputType.number,
              controller: priceController,
              label: 'Price',
            ),
            const SizedBox(height: 20),
            DropdownButtonFormFieldWidget<int>(
                selectedValue: discountTypes,
                hint: 'Select Discount Type',
                items: const [
                  DropdownMenuItem<int>(
                    value: 1,
                    child: Text('Persentage %'),
                  ),
                  DropdownMenuItem<int>(
                    value: 0,
                    child: Text('Discount -'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    discountTypes = value;
                  });
                }),
            const SizedBox(height: 20),
            TextFormFieldWidget(
              textInputType: TextInputType.number,
              controller: discountValueController,
              label: 'Discount Value',
            ),
          ],
        ),
      ),
      bottomNavigationBar: Builder(builder: (context) {
        return AddButtonNavigationBarWidget(
          ontap: () async {},
          title: 'Add',
        );
      }),
    );
  }
}
