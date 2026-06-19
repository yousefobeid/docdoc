import 'package:docdoc/core/helpers/spaceing.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorListView extends StatelessWidget {
  const DoctorListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            margin: EdgeInsets.only(bottom: 12),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    height: 120.h,
                    width: 110.w,
                    'https://cdn.pixabay.com/photo/2017/03/14/03/20/woman-2141808_1280.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
                horizontalSpace(16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name",
                        style: TextStyles.font18DarkBlueBold,
                        overflow: TextOverflow.ellipsis,
                      ),
                      verticalSpace(5),
                      Text(
                        "Degree | 112121212121",
                        style: TextStyles.font12GreyMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                      verticalSpace(5),
                      Text(
                        "Email@email.com",
                        style: TextStyles.font12GreyMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                      verticalSpace(5),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
