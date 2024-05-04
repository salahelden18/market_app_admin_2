import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app_web_2/core/utils/show_toast.dart';
import 'package:market_app_web_2/features/banners/data/models/banner_request_model.dart';
import 'package:market_app_web_2/main.dart';
import '../../data/repo/banner_repo.dart';
import 'banner_states.dart';

class BannersCubit extends Cubit<BannerStates> {
  BannersCubit(this._bannerRepo) : super(BannerInitalState());

  final BannerRepo _bannerRepo;

  Future getBanners([bool isActive = true]) async {
    emit(BannerLoadingState());

    var result = await _bannerRepo.getBanners('isActive=$isActive');

    result.fold(
      (l) => emit(BannerFailureState(l.message)),
      (r) => emit(
        BannerSuccessState(r!),
      ),
    );
  }

  Future toggleBanner(int id, bool isActive) async {
    var result = await _bannerRepo.toogleBanner(id);

    result.fold(
      (l) {
        showToast(context: navigatorKey.currentState!.context, msg: l.message);
      },
      (r) {
        getBanners(isActive);
      },
    );
  }

  Future<bool?> addBanner(BannerRequestModel bannerRequestModel) async {
    var result = await _bannerRepo.addBanner(bannerRequestModel);

    return result.fold(
      (l) {
        showToast(context: navigatorKey.currentState!.context, msg: l.message);
        return false;
      },
      (r) {
        return r != null;
      },
    );
  }
}
