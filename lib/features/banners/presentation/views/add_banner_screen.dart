import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/asset_picker_service.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/utils/dialog_manager_overlay.dart';
import '../../../../core/widgets/add_button_navigation_bar.dart';
import '../../../../core/widgets/text_button_widget.dart';
import '../../data/models/banner_request_model.dart';
import '../model_views/banners_cubit.dart';

class AddBannerScreen extends StatefulWidget {
  const AddBannerScreen({super.key});
  static const String routeName = "/add-banner-screen";

  @override
  State<AddBannerScreen> createState() => _AddBannerScreenState();
}

class _AddBannerScreenState extends State<AddBannerScreen> {
  File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add banner'),
      ),
      bottomNavigationBar: image != null
          ? AddButtonNavigationBarWidget(
              ontap: () async {
                DialogManagerOverlay.showDialogWithMessage(context);
                bool? isSuccess = await context
                    .read<BannersCubit>()
                    .addBanner(BannerRequestModel(image: image!));

                DialogManagerOverlay.closeDialog();
                if (isSuccess == true && context.mounted) {
                  Navigator.pop(context, true);
                }
              },
              title: 'Add Banner',
            )
          : null,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            if (image != null)
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.lightGray),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.file(image!),
              ),
            TextButtonWidget(
              onPressed: () async {
                final selectedImage = await AssetPickerService.pickImage();

                if (selectedImage != null) {
                  setState(() {
                    image = File(selectedImage.path);
                  });
                }
              },
              title: 'Select Image',
            ),
          ],
        ),
      ),
    );
  }
}
