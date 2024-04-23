import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/string_constants.dart';
import '../../../../../core/services/shared_preferences_service.dart';
import 'auto_authentication_state.dart';

class AutoAuthenticationCubit extends Cubit<AutoAuthenticationStates> {
  AutoAuthenticationCubit(this.sharedPreferencesService)
      : super(AutoAuthenticationInitialState());
  final SharedPreferencesService sharedPreferencesService;

  Future<void> authenticateUser() async {
    emit(AutoAuthenticationLoadingState());

    final String? token =
        await sharedPreferencesService.getData<String>(StringConstants.token);

    print(token);
    if (token != null && token.isNotEmpty) {
      emit(AutoAuthenticationAuthenticatedState());
    } else {
      emit(AutoAuthenticationUnAuthenticatedState());
    }
  }
}
