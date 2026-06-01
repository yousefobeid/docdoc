import 'package:docdoc/core/helpers/spaceing.dart';
import 'package:docdoc/core/theming/app_colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:flutter/material.dart';

class PasswordValidation extends StatelessWidget {
  final bool hasLowercase;
  final bool hasUppercase;
  final bool hasNumber;
  final bool hasSpecialCharacter;
  final bool hasMinLength;
  const PasswordValidation({
    super.key,
    required this.hasLowercase,
    required this.hasUppercase,
    required this.hasNumber,
    required this.hasSpecialCharacter,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow('At least 1 LowerCase letter', hasLowercase),
        verticalSpace(2),
        buildValidationRow('At least 1 UpperCase letter', hasUppercase),
        verticalSpace(2),
        buildValidationRow('At least 1 Number', hasNumber),
        verticalSpace(2),
        buildValidationRow('At least 1 Special Character', hasSpecialCharacter),
        verticalSpace(2),
        buildValidationRow('At least 8 characters long', hasMinLength),
        verticalSpace(2),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        CircleAvatar(radius: 2.5, backgroundColor: ColorsManger.grey),
        horizontalSpace(6),
        Text(
          text,
          style: TextStyles.font13DarkBlueRegular.copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: Colors.green,
            decorationThickness: 2,
            color: hasValidated ? ColorsManger.grey : ColorsManger.darkBlue,
          ),
        ),
      ],
    );
  }
}
