import 'package:docdoc/features/home/data/model/specializations_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/spaceing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/styles.dart';
import '../../data/model/specialization_data_model.dart';

class SpecialityListViewItem extends StatelessWidget {
  final SpecializationData? specializationData;
  final int itemIndex;
  final int selectedSpecializationIndex;
  const SpecialityListViewItem({
    super.key,
    this.specializationData,
    required this.itemIndex,
    required this.selectedSpecializationIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: itemIndex == 0 ? 0 : 17),
      child: Column(
        children: [
          itemIndex == selectedSpecializationIndex
              ? Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ColorsManger.darkBlue,
                      // width: 1.w,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    radius: 28,
                    backgroundColor: ColorsManger.lightBlue,
                    child: SvgPicture.asset(
                      'assets/svgs/general_speciality.svg',
                      height: 42.h,
                      width: 42.w,
                    ),
                  ),
                )
              : CircleAvatar(
                  radius: 28,
                  backgroundColor: ColorsManger.lightBlue,
                  child: SvgPicture.asset(
                    'assets/svgs/general_speciality.svg',
                    height: 40.h,
                    width: 40.w,
                  ),
                ),
          verticalSpace(10),
          Text(
            specializationData?.name ?? 'specialization',
            style: itemIndex == selectedSpecializationIndex
                ? TextStyles.font14DarkBlueBold
                : TextStyles.font12DarkBlueRegular,
          ),
        ],
      ),
    );
  }
}
