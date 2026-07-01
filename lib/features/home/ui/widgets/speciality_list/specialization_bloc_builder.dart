import 'package:docdoc/features/home/ui/widgets/speciality_list/speciality_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/helpers/spaceing.dart';
import '../../../logic/home_cubit.dart';
import '../../../logic/home_state.dart';
import '../doctors_list/doctors_shimmer_loading.dart';
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
    return Expanded(
      child: Column(
        children: [
          const SpecialityShimmerLoading(),
          verticalSpace(16),
          const DoctorsShimmerLoading(),
        ],
      ),
    );
  }

  Widget setUpSuccess(specializationList) {
    return SpecialityListView(
      specializationDataList: specializationList ?? [],
    );
  }

  Widget setUpFailure() {
    return SizedBox.shrink();
  }
}
