import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model_views/categories_cubit.dart';
import '../model_views/categories_states.dart';
import 'add_edit_category_screen.dart';
import 'widgets/categories_list_section.dart';
import '../../../../core/style/font_style.dart';
import '../../../../core/widgets/text_button_widget.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});
  static const String routeName = '/categores-screen';

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  void initState() {
    super.initState();
    if (context.read<CategoriesCubit>().state is! CategoriesSuccessState) {
      context.read<CategoriesCubit>().getCategories();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Categories'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(10.0),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Categories',
                  style: FontStyle.size22Black600,
                ),
                TextButtonWidget(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(AddEditCategoryScreen.routeName);
                  },
                  title: 'Add New Category',
                ),
              ],
            ),
            const SizedBox(height: 30),
            const CategoriesListSection(),
          ],
        ));
  }
}
