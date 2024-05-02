import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/subdistrict_request_model.dart';
import '../../../../../core/utils/show_toast.dart';
import '../../../../../main.dart';
import '../../../data/models/common_model.dart';
import '../../../data/repository/countries_repo/address_repo.dart';
import 'subdistrict_states.dart';

class SubDistrictCubit extends Cubit<SubDistrictStates> {
  SubDistrictCubit(this._countriesRepo) : super(SubDistrictInitialState());
  final AddressRepo _countriesRepo;

  List<CommonModel> subdistricts = [];

  Future getSubDistricts(String districtId) async {
    emit(SubDistrictLoadingState());
    var result = await _countriesRepo.getSubDistrict(districtId);

    result.fold(
      (l) => emit(SubDistrictFailureState(l.message)),
      (r) {
        subdistricts = r!;
        emit(SubDistrictSuccessState(r));
      },
    );
  }

  Future addSubDistrict(SubDistrictRequestModel subDistrictRequestModel) async {
    var result = await _countriesRepo.addSubDistrict(subDistrictRequestModel);

    result.fold(
      (l) {
        showToast(context: navigatorKey.currentState!.context, msg: l.message);
      },
      (r) {
        if (r != null) {
          subdistricts = List<CommonModel>.from(subdistricts)..add(r);

          emit(SubDistrictSuccessState(subdistricts));
        }
      },
    );
  }

  Future updateSubDistrict(String subdistrictId,
      SubDistrictRequestModel subDistrictRequestModel) async {
    var result = await _countriesRepo.updateSubDistrict(
        subdistrictId, subDistrictRequestModel);

    result.fold(
      (l) {
        showToast(context: navigatorKey.currentState!.context, msg: l.message);
      },
      (r) {
        if (r != null) {
          subdistricts = subdistricts.map((category) {
            return category.id == subdistrictId ? r : category;
          }).toList();

          emit(SubDistrictSuccessState(subdistricts));
        }
      },
    );
  }

  Future deleteSubDistrict(String subdistrictId) async {
    var result = await _countriesRepo.deleteSubDistrict(subdistrictId);

    result.fold(
      (l) {
        showToast(context: navigatorKey.currentState!.context, msg: l.message);
      },
      (r) {
        subdistricts = List<CommonModel>.from(subdistricts)
          ..removeWhere((element) => element.id == subdistrictId);

        emit(SubDistrictSuccessState(subdistricts));
      },
    );
  }
}
