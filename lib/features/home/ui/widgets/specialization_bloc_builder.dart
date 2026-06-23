import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/home_cubit.dart';
import '../../logic/home_state.dart';
import 'speciality_list_view.dart';

class SpecializationBlocBuilder extends StatelessWidget {
  const SpecializationBlocBuilder({super.key});

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
          specializationSuccess: (specializationsDataList) {
            var specializationList = specializationsDataList;
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
    return DoctorsSpecialityListView(
      specializationDataList: specializationList ?? [],
    );
  }

  Widget setUpFailure() {
    return SizedBox.shrink();
  }
}
