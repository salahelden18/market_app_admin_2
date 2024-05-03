import 'package:equatable/equatable.dart';

import '../../data/models/banner_model.dart';

abstract class BannerStates extends Equatable {
  const BannerStates();

  @override
  List<Object> get props => [];
}

class BannerInitalState extends BannerStates {}

class BannerLoadingState extends BannerStates {}

class BannerSuccessState extends BannerStates {
  final List<BannerModel> banners;

  const BannerSuccessState(this.banners);

  @override
  List<Object> get props => [banners];
}

class BannerFailureState extends BannerStates {
  final String errorMessage;

  const BannerFailureState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
