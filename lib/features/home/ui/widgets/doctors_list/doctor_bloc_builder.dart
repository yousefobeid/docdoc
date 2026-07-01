import 'package:docdoc/features/home/logic/home_cubit.dart';
import 'package:docdoc/features/home/logic/home_state.dart';
import 'package:docdoc/features/home/ui/widgets/doctors_list/doctors_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'doctor_list_view.dart';

class DoctorBlocBuilder extends StatelessWidget {
  const DoctorBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is DoctorsSuccess || current is DoctorsFailure,
      builder: (context, state) {
        return state.maybeWhen(
          doctorsSuccess: (doctorList) {
            return DoctorListView(doctorsList: doctorList);
          },
          doctorsFailure: (error) {
            return SizedBox.shrink();
          },
          orElse: () {
            return SizedBox.shrink();
          },
        );
      },
    );
  }
}
