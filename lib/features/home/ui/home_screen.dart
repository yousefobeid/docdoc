import 'package:docdoc/features/home/ui/widgets/doctors_list/doctor_bloc_builder.dart';
import 'package:docdoc/features/home/ui/widgets/doctor_speciality_see_all.dart';
import 'package:docdoc/features/home/ui/widgets/doctors_blue_containers.dart';
import 'package:docdoc/features/home/ui/widgets/home_top_bar.dart';
import 'package:docdoc/features/home/ui/widgets/speciality_list/specialization_bloc_builder.dart';
import 'package:flutter/material.dart';
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
              verticalSpace(16),
              DoctorSpecialitySeeAll(
                text: 'Doctor Specialities',
                subText: 'See All',
              ),
              verticalSpace(10),
              SpecializationBlocBuilder(),
              verticalSpace(10),
              DoctorBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
