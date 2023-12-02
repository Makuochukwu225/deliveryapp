import 'dart:ui';

import '../../../../export.dart';

class TrackDetailsScreen extends StatefulWidget {
  const TrackDetailsScreen({super.key});

  @override
  State<TrackDetailsScreen> createState() => _TrackDetailsScreenState();
}

class _TrackDetailsScreenState extends State<TrackDetailsScreen> {
  double _panelHeightOpen = 0;
  final double _panelHeightClosed = 120.0;
  late final ScrollController scrollController;
  late final PanelController panelController;

  @override
  void initState() {
    scrollController = ScrollController();
    panelController = PanelController();
    super.initState();
  }

  double _opacity = 1.0;
  @override
  Widget build(BuildContext context) {
    _panelHeightOpen = MediaQuery.of(context).size.height * .85;

    return Material(
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          buildBody(context),
          buildBlur(context),
          buildTrackingIdWidget(),
          buildAppbar(context),
        ],
      ),
    );
  }

  Widget buildAppbar(BuildContext context) {
    return Positioned(
      top: 52.h,
      left: 0,
      right: 0,
      child: Row(
        children: [
          Expanded(
              child: InkWell(
                  onTap: () => AppRoute.pop(context),
                  child: SvgPicture.asset('assets/icons/back-arrow.svg'))),
          const Expanded(
            flex: 2,
            child: Center(
              child: AppText(
                data: "Tracking Details",
                color: AppColors.blue,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Expanded(child: SizedBox()),
        ],
      ),
    );
  }

  Widget buildTrackingIdWidget() {
    return Positioned(
      top: 152.h,
      child: IgnorePointer(
        child: AnimatedOpacity(
          duration: AppConfigs.kAnimation,
          opacity: _opacity,
          child: Container(
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(46.r),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 87.w, vertical: 16.h),
              decoration: BoxDecoration(
                color: AppColors.primary,
                border: Border.all(),
                borderRadius: BorderRadius.circular(32.r),
              ),
              child: const AppText(
                data: "SCP6653728497",
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBlur(BuildContext context) {
    return Positioned(
        top: 0,
        child: ClipRRect(
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).padding.top,
                  color: Colors.transparent,
                ))));
  }

  Widget buildBody(BuildContext context) {
    return SlidingUpPanel(
      snapPoint: .5,
      disableDraggableOnScrolling: false,
      header: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ForceDraggableWidget(
              child: SizedBox(
                width: 100,
                height: 40,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 12.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 45,
                          height: 5,
                          decoration: const BoxDecoration(
                              color: Color(0xffDBE2E9),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0))),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      maxHeight: _panelHeightOpen,
      minHeight: _panelHeightClosed,
      parallaxEnabled: true,
      backdropEnabled: true,
      parallaxOffset: .8,
      body: _body(),
      controller: panelController,
      scrollController: scrollController,
      panelBuilder: () => buildPanel(),
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(18.0), topRight: Radius.circular(18.0)),
      onPanelSlide: (double pos) => setState(() {
        _opacity = 1 - pos;
      }),
    );
  }

  Widget buildItem({
    required String title,
    required String subtitle,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          data: title,
          color: AppColors.black3,
          fontWeight: FontWeight.w600,
        ),
        AppText(
          data: subtitle,
          color: AppColors.yellow1,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }

  Widget buildPanel() {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          physics: PanelScrollPhysics(controller: panelController),
          controller: scrollController,
          padding: const EdgeInsets.only(
            top: 24,
            right: 24,
            left: 24,
          ),
          children: <Widget>[
            const SizedBox(
              height: 12.0,
            ),
            const SizedBox(
              height: 18.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      data: "Estimate arrives in",
                      color: Color(0xff7A809D),
                      fontSize: 14,
                    ),
                    AppText(
                      data: "2h 40m",
                      color: Color(0xff2E3E5C),
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                const Spacer(),
                SvgPicture.asset("assets/icons/dots.svg"),
              ],
            ),
            verticalGap(30),
            Container(
              width: 327,
              height: 238,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildItem(
                      title: "Sukabumi, Indonesia",
                      subtitle: "No receipt : SCP6653728497"),
                  const Divider(color: AppColors.yellow2),
                  buildItem(title: "2,50 USD", subtitle: "Postal fee"),
                  const Divider(color: AppColors.yellow2),
                  buildItem(title: "Bali, Indonesia", subtitle: "Parcel, 24kg"),
                ],
              ),
            ),
            verticalGap(24),
            buildTransactionHistory(),
          ],
        ));
  }

  Widget buildTransactionHistory() {
    return Consumer(builder: (context, ref, child) {
      AsyncValue<List<OrderModel>> orderHistoryListAsync =
          ref.watch(orderList2Provider);
      return orderHistoryListAsync.when(
        data: (data) {
          return Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: AppText(
                  data: "History",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blueDark1,
                ),
              ),
              verticalGap(24),
              ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var order = data[index];
                    return buildOrderItem(order);
                  },
                  separatorBuilder: (context, index) => Align(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          width: 55,
                          child: Center(
                            child: Container(
                              color: AppColors.lineColor,
                              height: 40,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                  itemCount: data.length),
              verticalGap(40)
            ],
          );
        },
        error: (error, stackTrace) => AppError(data: error.toString()),
        loading: () => const AppProgress(),
      );
    });
  }

  Widget buildOrderItem(OrderModel order) {
    return SizedBox(
      height: 56,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: order.iconColor,
            child: Image.asset(order.icon!),
          ),
          horizontalGap(16),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                data: order.status!,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.blueDark,
              ),
              AppText(
                data: order.location!,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.lightGrey,
              ),
            ],
          ),
          const Spacer(),
          Center(
            child: AppText(
                data: order.time!,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.lightGrey),
          ),
        ],
      ),
    );
  }

  TileLayer get openStreetMapTileLayer => TileLayer(
        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        userAgentPackageName: 'kn.prestmit.deliveryapp',
      );

  Widget _body() {
    return FlutterMap(
      options: MapOptions(
        initialCenter: const LatLng(4.765045, 7.010949),
        onTap: (tapPosition, point) {},
        initialZoom: 19.5,
      ),
      children: [
        openStreetMapTileLayer,
        MarkerLayer(
          markers: [
            Marker(
              point: const LatLng(4.765316, 7.011136),
              // width: 80,
              // height: 80,
              child: Image.asset('assets/icons/end-cap.png'),
            ),
          ],
        ),
        MarkerLayer(
          markers: [
            Marker(
              point: const LatLng(4.764801, 7.0107),
              // width: 80,
              // height: 80,
              child: Image.asset('assets/icons/start-cap.png'),
            ),
          ],
        ),
        PolylineLayer(
          polylines: [
            Polyline(
              strokeWidth: 5,
              strokeJoin: StrokeJoin.round,
              strokeCap: StrokeCap.round,
              points: [
                const LatLng(4.765316, 7.011136),
                const LatLng(4.765265, 7.011123),
                const LatLng(4.765251, 7.011105),
                const LatLng(4.765251, 7.011054),
                const LatLng(4.765213, 7.011044),
                const LatLng(4.765159, 7.011025),
                const LatLng(4.765158, 7.010997),
                const LatLng(4.765163, 7.010942),
                const LatLng(4.765191, 7.010901),
                const LatLng(4.765169, 7.010861),
                const LatLng(4.765108, 7.010808),
                const LatLng(4.765066, 7.010829),
                const LatLng(4.765031, 7.010871),
                const LatLng(4.765004, 7.01088),
                const LatLng(4.764925, 7.010845),
                const LatLng(4.764853, 7.010808),
                const LatLng(4.764816, 7.010805),
                const LatLng(4.764785, 7.010799),
                const LatLng(4.764762, 7.010773),
                const LatLng(4.764801, 7.0107),
              ],
              color: AppColors.primary,
            ),
          ],
        ),
      ],
    );
  }
}
