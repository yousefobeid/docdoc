import 'package:docdoc/features/home/ui/widgets/doctors_blue_containers.dart';
import 'package:docdoc/features/home/ui/widgets/home_top_bar.dart';
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
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [HomeTopBar(), DoctorsBlueContainer()],
          ),
        ),
      ),
    );
  }
}
