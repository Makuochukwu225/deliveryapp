import 'dart:ui';

import '../../../../export.dart';


class TrackDetails extends StatefulWidget {
  const TrackDetails({super.key});

  @override
  _TrackDetailsState createState() => _TrackDetailsState();
}

class _TrackDetailsState extends State<TrackDetails> {
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

  @override
  Widget build(BuildContext context) {
    _panelHeightOpen = MediaQuery.of(context).size.height * .80;

    return Material(
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          SlidingUpPanel(
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
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(12.0))),
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
            panelBuilder: () => _panel(),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(18.0),
                topRight: Radius.circular(18.0)),
            onPanelSlide: (double pos) => setState(() {}),
          ),

          Positioned(
              top: 0,
              child: ClipRRect(
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).padding.top,
                        color: Colors.transparent,
                      )))),

          //the SlidingUpPanel Title
          Positioned(
            top: 52.0,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(46),
              ),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 87, vertical: 16),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(32.0),
                ),
                child: const AppText(
                  data: "SCP6653728497",
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _item({
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

  Widget _panel() {
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
                      data: "Estimate arrives",
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
                  _item(
                      title: "Sukabumi, Indonesia",
                      subtitle: "No receipt : SCP6653728497"),
                  const Divider(color: AppColors.yellow2),
                  _item(title: "2,50 USD", subtitle: "Postal fee"),
                  const Divider(color: AppColors.yellow2),
                  _item(title: "Bali, Indonesia", subtitle: "Parcel, 24kg"),
                ],
              ),
            ),
            verticalGap(24),
            buildTransactionHistory(),
          ],
        ));
  }

  final List<String> historyImage = [
    'assets/icons/lorry.png',
    'assets/icons/transit.png',
    'assets/icons/box.png',
  ];

  final List<String> historyTitle = [
    'In Delivery',
    'STransit - Sending City',
    'Send Form Sukabumi',
  ];
  final List<String> historyProgress = [
    'Bali, Indonesia',
    'Jakarta, Indonesia',
    'Sukabumi, Indonesia',
  ];

  final List<String> historyTime = [
    '00.00 PM',
    '21.00 PM',
    '19.00 PM',
  ];
  final List<Color> historyColor = [
    AppColors.primary,
    AppColors.blueLight,
    AppColors.blueLight,
  ];

  Widget buildTransactionHistory() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Align(
            alignment: Alignment.centerLeft,
            child: AppText(data: "History"),
          ),
        ),
        ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => ListTile(
                  title: Text(historyTitle[index]),
                  trailing: AppText(data: historyTime[index]),
                  leading: CircleAvatar(
                    backgroundColor: historyColor[index],
                    radius: 28,
                    child: Image.asset(historyImage[index]),
                  ),
                  subtitle: Text(historyProgress[index]),
                ),
            separatorBuilder: (context, index) => verticalGap(),
            itemCount: historyImage.length)
      ],
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
        onTap: (tapPosition, point) {
          print(point);
        },
        initialZoom: 19.5,
        // cameraConstraint: CameraConstraint.contain(
        //   bounds: LatLngBounds(
        //     const LatLng(-4.765045, -7.010949),
        //     const LatLng(4.765045, 7.010949),
        //   ),
        // ),
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
