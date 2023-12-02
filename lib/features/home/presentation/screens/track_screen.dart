import '../../../../export.dart';

class TrackScreen extends StatefulWidget {
  const TrackScreen({Key? key}) : super(key: key);

  @override
  State<TrackScreen> createState() => _TrackScreenState();
}

class _TrackScreenState extends State<TrackScreen> {
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
    return Consumer(
      builder: (context, ref, child) {
        AsyncValue<List<OrderModel>> orderHistoryListAsync =
            ref.watch(orderList1Provider);
        return orderHistoryListAsync.when(
            data: (data) {
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
                            title: Text(data[index].trackingId!),
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
                              child: Image.asset(data[index].icon!),
                            ),
                            subtitle: Text(data[index].status!),
                          ),
                      separatorBuilder: (context, index) => verticalGap(),
                      itemCount: data.length)
                ],
              ).animate().slideY(begin: 1, end: 0);
            },
            error: (error, stackTrace) => AppError(data: error.toString()),
            loading: () => const AppProgress());
      },
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
                                child: const TrackDetailsScreen(),
                              ),
                            ));
                      },
                      data: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 22.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const AppText(
                              data: "Track Now",
                              color: AppColors.white,
                              fontSize: 14,
                            ),
                            SvgPicture.asset('assets/icons/arrow.svg'),
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
