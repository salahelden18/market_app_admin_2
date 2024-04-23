import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app_web_2/core/constants/string_constants.dart';
import 'package:market_app_web_2/core/services/shared_preferences_service.dart';
import '../../../data/models/authentication_request_model.dart';
import '../../../data/repos/authentication_repo.dart';
import 'signin_states.dart';

class SiginCubit extends Cubit<SiginStates> {
  SiginCubit(this._authenticatioRepo, this._sharedPreferencesService)
      : super(SiginInitialState());

  final AuthenticatioRepo _authenticatioRepo;
  final SharedPreferencesService _sharedPreferencesService;

  Future siginIn(AuthenticationRequestModel authenticationRequestModel) async {
    emit(SiginLoadingState());

    final result = await _authenticatioRepo.sigin(authenticationRequestModel);

    result.fold(
      (l) => emit(SiginFailureState(l.message)),
      (r) async {
        // setting the token in the shared preferences
        await _sharedPreferencesService.setData<String>(
            StringConstants.token, r!.token);
        emit(SiginSuccessState(r));
      },
    );
  }
}
