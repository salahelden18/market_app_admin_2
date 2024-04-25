import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app_web_2/features/categories/data/models/subcategory_request.dart';
import '../../../data/models/subcategory_response.dart';
import '../../../data/repo/categories_repo.dart';
import 'subcategory_states.dart';

class SubCategoryCubit extends Cubit<SubCategoryStates> {
  SubCategoryCubit(this._categoriesRepo) : super(SubCategoryInitialState());
  List<SubCategoryResponseModel> subCategories = [];

  final CategoriesRepo _categoriesRepo;

  Future getSubCategories(String categoryId) async {
    emit(SubCategoryLoadingState());

    var result = await _categoriesRepo.getsubCategories(categoryId);

    result.fold(
      (l) => emit(SubCategoryFailureState(l.message)),
      (r) {
        subCategories = r!;

        emit(SubCategorySuccessState(subCategories));
      },
    );
  }

  Future<String?> addSubCategory(SubCategoryRequest subCategoryRequest) async {
    var result = await _categoriesRepo.addSubcategory(subCategoryRequest);

    return result.fold((l) {
      return l.message;
    }, (r) {
      subCategories = List<SubCategoryResponseModel>.from(subCategories)
        ..add(r!);

      emit(SubCategorySuccessState(subCategories));

      return null;
    });
  }

  Future<String?> updateSubCategory(
      String id, SubCategoryRequest subCategoryRequest) async {
    var result =
        await _categoriesRepo.updateSubcategory(id, subCategoryRequest);

    return result.fold((l) {
      return l.message;
    }, (r) {
      subCategories = subCategories
          .map((subcategory) => subcategory.id == id ? r! : subcategory)
          .toList();

      emit(SubCategorySuccessState(subCategories));

      return null;
    });
  }

  // delete category
  Future<String?> deleteSubCategory(String id) async {
    var result = await _categoriesRepo.deleteSubcategory(id);

    return result.fold(
      (l) {
        return l.message;
      },
      (r) {
        if (r == null) {
          subCategories = List<SubCategoryResponseModel>.from(subCategories)
            ..removeWhere((subCategory) => subCategory.id == id);

          emit(SubCategorySuccessState(subCategories));
        }

        return null;
      },
    );
  }
}
