import 'package:docdoc/features/home/ui/widgets/doctor_list_view.dart';
import 'package:docdoc/features/home/ui/widgets/doctor_speciality_see_all.dart';
import 'package:docdoc/features/home/ui/widgets/doctors_blue_containers.dart';
import 'package:docdoc/features/home/ui/widgets/doctors_speciality_list_view.dart';
import 'package:docdoc/features/home/ui/widgets/home_top_bar.dart';
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
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeTopBar(),
              DoctorsBlueContainer(),
              verticalSpace(16.h),
              DoctorSpecialitySeeAll(
                text: 'Doctor Specialities',
                subText: 'See All',
              ),
              verticalSpace(10.h),
              DoctorsSpecialityListView(),
              verticalSpace(10.h),
              DoctorSpecialitySeeAll(
                text: 'Recommendation Doctor',
                subText: 'See All',
              ),
              verticalSpace(10.h),
              DoctorListView(),
            ],
          ),
        ),
      ),
    );
  }
}
