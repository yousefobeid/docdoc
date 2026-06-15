import 'package:docdoc/core/networking/api_result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:docdoc/features/sign_up/logic/cubit/sign_up_state.dart';

import '../../data/model/sign_up_request_body.dart';
import '../../repo/sign_up_repo.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo _signUpRepo;
  SignUpCubit(this._signUpRepo) : super(SignUpState.initial());
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();
  int gender = 0;
  final formKey = GlobalKey<FormState>();
  void emitSignUpStates()async{
    emit(SignUpState.signUpLoading());
    final response = await _signUpRepo.signUp(
      SignUpRequestBody(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text,
        gender: gender,
      ),
    );
    response.when(
      success: (data) {
        emit(SignUpState.signUpSuccess(data));
      },
      failure: (error) {
        emit(SignUpState.signUpError(error: error));
      },
    );
  }
}

