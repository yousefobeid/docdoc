import 'package:docdoc/core/helpers/extension.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/features/login/logic/cubit/login_cubit.dart';
import 'package:docdoc/features/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(color: ColorsManger.mainBlue),
              ),
            );
          },
          success: (loginResponse) {
            context.pop();
            context.pushNamed(Routes.homeScreen);
          },
          error: (error) {
            context.pop();
            setUpErrorState(context,error);
          },
        );
      },
      child: SizedBox.shrink(),
    );
  }
}

void setUpErrorState(BuildContext context, String text) {
  showDialog(
    context: context,
    builder: (dialogContext) => AlertDialog(
      icon: Icon(Icons.error, color: Colors.red, size: 32),
      content: Text(text, style: TextStyles.font15DarkBlueMedium),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(dialogContext).pop();
            Navigator.pop(context);
          },
          child: Text("Got it", style: TextStyles.font14BlueSemiBold),
        ),
      ],
    ),
  );
}
