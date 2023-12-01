import 'package:deliveryapp/features/home/home.dart';
import 'package:deliveryapp/features/home/presentation/screens/track_details.dart';
import 'package:deliveryapp/shared/widgets/app_text.dart';
import 'package:deliveryapp/shared/widgets/app_widget_button.dart';
import 'package:deliveryapp/shared/widgets/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg_flutter.dart';

import '../../../../shared/theme/app_colors.dart';

class Track extends StatefulWidget {
  const Track({Key? key}) : super(key: key);

  @override
  State<Track> createState() => _TrackState();
}

class _TrackState extends State<Track> {
  final List<String> imgList = [
    'assets/images/bicycle.png',
    'assets/images/bicycle.png',
    'assets/images/bicycle.png',
    'assets/images/bicycle.png',
    'assets/images/bicycle.png',
    'assets/images/bicycle.png',
  ];
  final List<String> historyImage = [
    'assets/icons/box.png',
    'assets/icons/lorry.png',
  ];

  final List<String> historyTitle = [
    'SCP9374826473',
    'SCP6653728497',
  ];
  final List<String> historyProgress = [
    'In the process',
    'In delivery',
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const HomeAppBar(),
            Expanded(child: verticalGap(37)),
            buildTrackingWidget(),
            Expanded(child: verticalGap(40)),
            buildTransactionHistory(),
          ],
        ),
      ),
    );
  }

  Widget buildTransactionHistory() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Align(
            alignment: Alignment.centerLeft,
            child: AppText(
              data: "Tracking history",
              color: AppColors.blueDark1,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            shrinkWrap: true,
            itemBuilder: (context, index) => ListTile(
                  title: Text(historyTitle[index]),
                  titleTextStyle: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blueDark,
                  ),
                  subtitleTextStyle: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.lightGrey,
                  ),
                  trailing: const Icon(
                    Icons.arrow_back_ios,
                    textDirection: TextDirection.rtl,
                    size: 15,
                  ),
                  leading: CircleAvatar(
                    radius: 28,
                    backgroundColor: AppColors.blueLight,
                    child: Image.asset(historyImage[index]),
                  ),
                  subtitle: Text(historyProgress[index]),
                ),
            separatorBuilder: (context, index) => verticalGap(),
            itemCount: historyImage.length)
      ],
    );
  }

  Widget buildTrackingWidget() {
    return Hero(
      tag: "order",
      child: Container(
        height: 308.h,
        margin: const EdgeInsets.symmetric(horizontal: 24),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Stack(
          children: [
            Positioned(
                right: 0,
                top: 0,
                child: SvgPicture.asset('assets/icons/1.svg')),
            Positioned(
                right: 0,
                top: 0,
                child: SvgPicture.asset('assets/icons/2.svg')),
            Positioned(
                right: 0,
                top: 0,
                child: SvgPicture.asset('assets/icons/3.svg')),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  verticalGap(30),
                  Align(
                    alignment: Alignment.topLeft,
                    child: AppText(
                      data: "Track Your Package",
                      fontSize: 18,
                      color: AppColors.black2,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  verticalGap(10),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: AppText(
                      data:
                          "Enter the receipt number that has \nbeen given by the officer",
                      fontSize: 14,
                      color: AppColors.yellow1,
                    ),
                  ),
                  verticalGap(29),
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 34.w, vertical: 16.h),
                      hintText: "Enter the recipt number",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                  ),
                  verticalGap(10),
                  AppWidgetButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      FadeTransition(
                                opacity: animation,
                                child: const TrackDetails(),
                              ),
                            ));
                      },
                      data: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 22.w),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                              data: "Track Now",
                              color: AppColors.white,
                              fontSize: 14,
                            ),
                            Icon(
                              Icons.arrow_forward_outlined,
                              color: AppColors.white,
                            )
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
