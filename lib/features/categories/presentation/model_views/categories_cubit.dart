import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/category_request_model.dart';
import '../../data/models/category_response_model.dart';
import '../../data/repo/categories_repo.dart';
import 'categories_states.dart';

class CategoriesCubit extends Cubit<CategoriesStates> {
  CategoriesCubit(this._categoriesRepo) : super(CategoriesInitialState());

  final CategoriesRepo _categoriesRepo;
  List<CategoryResponseModel> categories = [];

  Future getCategories() async {
    emit(CategoriesLoadingState());

    final result = await _categoriesRepo.getCategories();

    result.fold(
      (l) => emit(CategoriesFailureState(l.message)),
      (r) {
        categories = r!;
        emit(CategoriesSuccessState(r));
      },
    );
  }

  // adding new category
  Future<String?> addNewCategory(
      CategoryRequestModel categoryRequestModel) async {
    var result = await _categoriesRepo.addCategory(categoryRequestModel);

    return result.fold(
      (l) {
        return l.message;
      },
      (r) {
        if (r != null) {
          categories = List<CategoryResponseModel>.from(categories)..add(r);

          // Emit the new list
          emit(CategoriesSuccessState(categories));
        }

        return null;
      },
    );
  }

  // update category
  Future<String?> updateCategory(
      String categoryId, CategoryRequestModel categoryRequestModel) async {
    var result =
        await _categoriesRepo.updateCategory(categoryId, categoryRequestModel);

    return result.fold(
      (l) {
        return l.message;
      },
      (r) {
        if (r != null) {
          // Update the category in the list
          categories = categories.map((category) {
            return category.id == categoryId ? r : category;
          }).toList();

          emit(CategoriesSuccessState(categories));
        }

        return null;
      },
    );
  }

  // delete category
  Future<String?> deleteCategory(String id) async {
    var result = await _categoriesRepo.deleteCategory(id);

    return result.fold(
      (l) {
        return l.message;
      },
      (r) {
        if (r == null) {
          categories = List<CategoryResponseModel>.from(categories)
            ..removeWhere((category) => category.id == id);

          emit(CategoriesSuccessState(categories));
        }

        return null;
      },
    );
  }
}
