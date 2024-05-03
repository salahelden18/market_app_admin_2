import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repo/banner_repo.dart';
import 'banner_states.dart';

class BannersCubit extends Cubit<BannerStates> {
  BannersCubit(this._bannerRepo) : super(BannerInitalState());

  final BannerRepo _bannerRepo;

  Future getBanners() async {
    emit(BannerLoadingState());

    var result = await _bannerRepo.getBanners();

    result.fold(
      (l) => emit(BannerFailureState(l.message)),
      (r) => emit(
        BannerSuccessState(r!),
      ),
    );
  }
}
