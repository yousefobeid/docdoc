import 'package:docdoc/core/helpers/spaceing.dart';
import 'package:docdoc/core/theming/app_colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/features/home/logic/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../data/model/specialization_data_model.dart';
import '../../../data/model/specializations_response_model.dart';
import 'speciality_list_view_item.dart';

class SpecialityListView extends StatefulWidget {
  final List<SpecializationData?> specializationDataList;
  const SpecialityListView({
    super.key,
    required this.specializationDataList,
  });

  @override
  State<SpecialityListView> createState() =>
      _SpecialityListViewState();
}

class _SpecialityListViewState extends State<SpecialityListView> {
  var selectedSpecializationIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 85.h,
      child: ListView.builder(
        itemCount: widget.specializationDataList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedSpecializationIndex = index;
              });
              context.read<HomeCubit>().getDoctorsList(
                specializationId: widget.specializationDataList[index]?.id,
              );
            },
            child: SpecialityListViewItem(
              itemIndex: index,
              specializationData: widget.specializationDataList[index],
              selectedSpecializationIndex: selectedSpecializationIndex,
            ),
          );
        },
      ),
    );
  }
}
