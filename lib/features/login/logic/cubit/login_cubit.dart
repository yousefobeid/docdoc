import 'package:docdoc/core/networking/api_result.dart';
import 'package:docdoc/features/login/data/model/login_request_body.dart';
import 'package:docdoc/features/login/logic/cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repo/login_repo.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(LoginState.initial());
  void emitLoginState(LoginRequestBody loginRequestBody) async {
    emit(LoginState.loading());
    final response = await _loginRepo.login(loginRequestBody);
    response.when(
      success: (loginResponse) {
        emit(LoginState.success(loginResponse));
      },
      failure: (error) {
        emit(LoginState.error(error: error));
      },
    );
  }
}
