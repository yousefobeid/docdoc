import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/spaceing.dart';
import '../../logic/home_cubit.dart';
import '../../logic/home_state.dart';
import 'doctor_list_view.dart';
import 'doctor_speciality_see_all.dart';
import 'doctors_speciality_list_view.dart';

class SetUpSpecializationAndDoctorsBlocBuilder extends StatelessWidget {
  const SetUpSpecializationAndDoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is SpecializationLoading ||
          current is SpecializationSuccess ||
          current is SpecializationFailure,
      builder: (context, state) {
        return state.maybeWhen(
          specializationLoading: () {
            return setUploading();
          },
          specializationSuccess: (specializationsResponseModel) {
            var specializationList =
                specializationsResponseModel.specializationDataList;
            return setUpSuccess(specializationList);
          },
          specializationFailure: (err) {
            return setUpFailure();
          },
          orElse: () {
            return SizedBox.shrink();
          },
        );
      },
    );
  }

  Widget setUploading() {
    return SizedBox(
      height: 100.h,
      child: const Center(child: CircularProgressIndicator()),
    );
  }

  Widget setUpSuccess(specializationList) {
    return Expanded(
      child: Column(
        children: [
          DoctorsSpecialityListView(
            specializationDataList: specializationList ?? [],
          ),
          verticalSpace(10.h),
          DoctorSpecialitySeeAll(
            text: 'Recommendation Doctor',
            subText: 'See All',
          ),
          verticalSpace(10.h),
          DoctorListView(doctorsList: specializationList?[0]?.doctorsList),
        ],
      ),
    );
  }

  Widget setUpFailure() {
    return SizedBox.shrink();
  }
}
