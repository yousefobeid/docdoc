import 'package:docdoc/features/home/ui/widgets/doctor_speciality_see_all.dart';
import 'package:docdoc/features/home/ui/widgets/doctors_blue_containers.dart';
import 'package:docdoc/features/home/ui/widgets/home_top_bar.dart';
import 'package:docdoc/features/home/ui/widgets/set_up_specialization_and_doctors_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/helpers/spaceing.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Column(
            children: [
              HomeTopBar(),
              DoctorsBlueContainer(),
              verticalSpace(16.h),
              DoctorSpecialitySeeAll(
                text: 'Doctor Specialities',
                subText: 'See All',
              ),
              verticalSpace(10.h),
              SetUpSpecializationAndDoctorsBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
