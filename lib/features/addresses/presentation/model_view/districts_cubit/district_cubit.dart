import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/district_request_model.dart';
import '../../../../../core/utils/show_toast.dart';
import '../../../../../main.dart';
import '../../../data/models/common_model.dart';
import '../../../data/repository/countries_repo/address_repo.dart';
import 'district_states.dart';

class DistrictCubit extends Cubit<DistrictStates> {
  DistrictCubit(this._countriesRepo) : super(DistrictInitialState());
  final AddressRepo _countriesRepo;

  List<CommonModel> districts = [];

  Future getDistricts(String cityId) async {
    emit(DistrictLoadingState());
    var result = await _countriesRepo.getDistricts(cityId);

    result.fold(
      (l) => emit(DistrictFailureState(l.message)),
      (r) {
        districts = r!;
        emit(DistrictSuccessState(r));
      },
    );
  }

  Future addDistrict(DistrictRequestModel districtRequestModel) async {
    var result = await _countriesRepo.addDistrict(districtRequestModel);

    result.fold(
      (l) {
        showToast(context: navigatorKey.currentState!.context, msg: l.message);
      },
      (r) {
        if (r != null) {
          districts = List<CommonModel>.from(districts)..add(r);

          emit(DistrictSuccessState(districts));
        }
      },
    );
  }

  Future updateDistrict(
      String districtId, DistrictRequestModel districtRequestModel) async {
    var result =
        await _countriesRepo.updateDistrict(districtId, districtRequestModel);

    result.fold(
      (l) {
        showToast(context: navigatorKey.currentState!.context, msg: l.message);
      },
      (r) {
        if (r != null) {
          districts = districts.map((category) {
            return category.id == districtId ? r : category;
          }).toList();

          emit(DistrictSuccessState(districts));
        }
      },
    );
  }

  Future deleteDistrict(String districtId) async {
    var result = await _countriesRepo.deleteDistrict(districtId);

    result.fold(
      (l) {
        showToast(context: navigatorKey.currentState!.context, msg: l.message);
      },
      (r) {
        districts = List<CommonModel>.from(districts)
          ..removeWhere((element) => element.id == districtId);

        emit(DistrictSuccessState(districts));
      },
    );
  }
}
