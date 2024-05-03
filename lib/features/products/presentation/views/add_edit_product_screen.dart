import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/product_model.dart';
import '../../../../core/utils/show_toast.dart';
import 'widgets/product_categories_section.dart';
import '../../../../core/widgets/description_fields.dart';
import '../../../../core/widgets/names_fields.dart';
import '../../../categories/presentation/model_views/categories_cubit.dart';
import '../../../categories/presentation/model_views/categories_states.dart';
import '../../../../core/services/asset_picker_service.dart';
import '../../../../core/utils/dialog_manager_overlay.dart';
import '../../../../core/widgets/text_button_widget.dart';
import '../../data/models/product_request_model.dart';
import '../model_views/products_cubit.dart';
import 'widgets/product_images_container_widget.dart';
import '../../../../core/widgets/add_button_navigation_bar.dart';
import '../../../../core/widgets/text_form_field_widget.dart';

class AddEditProductScreen extends StatefulWidget {
  const AddEditProductScreen({super.key});
  static const String routeName = 'add-edit-product-screen';

  @override
  State<AddEditProductScreen> createState() => _AddEditProductScreenState();
}

class _AddEditProductScreenState extends State<AddEditProductScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController enNameController = TextEditingController();
  final TextEditingController trNameController = TextEditingController();
  final TextEditingController arNameController = TextEditingController();
  final TextEditingController enDescriptionController = TextEditingController();
  final TextEditingController trDescriptionController = TextEditingController();
  final TextEditingController arDescriptionController = TextEditingController();
  final TextEditingController manufacturerController = TextEditingController();
  String? subCategoryId;
  List<File> images = [];
  late ProductModel? productModel;

  @override
  void initState() {
    super.initState();
    if (context.read<CategoriesCubit>().state is! CategoriesSuccessState) {
      context.read<CategoriesCubit>().getCategories();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    productModel = ModalRoute.of(context)?.settings.arguments as ProductModel?;
  }

  selectSubCategory(String id) {
    subCategoryId = id;
  }

  @override
  void dispose() {
    // Dispose controllers when not needed to prevent memory leaks
    enNameController.dispose();
    trNameController.dispose();
    arNameController.dispose();
    enDescriptionController.dispose();
    trDescriptionController.dispose();
    arDescriptionController.dispose();
    manufacturerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${productModel == null ? 'Add' : 'Edit'} Product'),
        actions: productModel != null
            ? [
                IconButton(
                  onPressed: () async {
                    DialogManagerOverlay.showDialogWithMessage(context);

                    await context
                        .read<ProductsCubit>()
                        .deleteProduct(productModel!.id);

                    DialogManagerOverlay.closeDialog();
                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.delete),
                ),
              ]
            : null,
      ),
      bottomNavigationBar: AddButtonNavigationBarWidget(
        ontap: () async {
          final isValid = _formKey.currentState!.validate();
          if (isValid) {
            if (images.isEmpty) {
              showToast(
                  context: context,
                  msg: 'you should at least choose one image');
              return;
            }

            if (subCategoryId == null) {
              showToast(
                  context: context,
                  msg: 'you should select sub category for this product');
              return;
            }

            DialogManagerOverlay.showDialogWithMessage(context);
            ProductRequsetModel productRequsetModel = ProductRequsetModel(
              arDescription: arDescriptionController.text.isEmpty
                  ? null
                  : arDescriptionController.text,
              arName:
                  arNameController.text.isEmpty ? null : arNameController.text,
              enDescription: enDescriptionController.text.isEmpty
                  ? null
                  : enDescriptionController.text,
              enName: enNameController.text,
              images: images,
              manufacturer: manufacturerController.text.isEmpty
                  ? null
                  : manufacturerController.text,
              trDescription: trDescriptionController.text.isEmpty
                  ? null
                  : trDescriptionController.text,
              trName:
                  trNameController.text.isEmpty ? null : trNameController.text,
              subCategoryId: subCategoryId ?? '',
            );

            await context.read<ProductsCubit>().addProduct(productRequsetModel);

            DialogManagerOverlay.closeDialog();
            // ignore: use_build_context_synchronously
            Navigator.pop(context);
          }
        },
        title: '${productModel == null ? 'Add' : 'Edit'} Product',
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            NamesFields(
              arNameController: arNameController,
              enNameController: enNameController,
              trNameController: trNameController,
              enValidator: (value) {
                if (value!.isEmpty) {
                  return 'please enter a value';
                }

                return null;
              },
            ),
            const SizedBox(height: 10),
            DescriptionFields(
              arDescriptionController: arDescriptionController,
              enDescriptionController: enDescriptionController,
              trDescriptionController: trDescriptionController,
            ),
            const SizedBox(height: 10),
            TextFormFieldWidget(
              label: 'Manufacturer',
              controller: manufacturerController,
            ),
            ProductCategorySection(
              selectSubCategory: selectSubCategory,
            ),
            const SizedBox(height: 10),
            if (images.isNotEmpty) ProductImagesContainerWidget(images: images),
            const SizedBox(height: 10),
            TextButtonWidget(
              onPressed: () async {
                var pickedImages = await AssetPickerService.pickImages();

                if (pickedImages != null) {
                  setState(() {
                    images = pickedImages;
                  });
                }
              },
              title: 'Select Images',
            ),
          ],
        ),
      ),
    );
  }
}
