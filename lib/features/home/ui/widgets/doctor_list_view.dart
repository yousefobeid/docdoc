import 'package:docdoc/core/helpers/spaceing.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/features/home/data/model/specializations_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/model/doctors_info_model.dart';
import 'doctors_list_view_item.dart';

class DoctorListView extends StatelessWidget {
final List<Doctors?>? doctorsList;
  const DoctorListView({super.key,this.doctorsList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: doctorsList!.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return DoctorsListViewItem(
            doctorsModel: doctorsList![index],
          );
        },
      ),
    );
  }
}
