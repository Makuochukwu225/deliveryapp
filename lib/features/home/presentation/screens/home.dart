import '../../../../export.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  final List<String> imgList = [
    'assets/images/bicycle.png',
    'assets/images/bicycle.png',
    'assets/images/bicycle.png',
    'assets/images/bicycle.png',
    'assets/images/bicycle.png',
    'assets/images/bicycle.png',
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const HomeAppBar(),
            Expanded(
              child: Column(
                children: [
                  Expanded(child: verticalGap(40)),
                  buildCarouselWidget(),
                  Expanded(child: verticalGap(25)),
                  buildOrderWidget(),
                  Expanded(child: verticalGap(46)),
                  buildBikerWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCarouselWidget() {
    return Container(
      constraints: BoxConstraints(
        minHeight: 265.h,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Consumer(
        builder: (context, ref, child) {
          AsyncValue<List<ImageModel>> imgListAsync =
              ref.watch(fakeImageListProvider);

          return imgListAsync.when(
            data: (imgList) {
              return Column(
                children: [
                  CarouselSlider.builder(
                    itemCount: imgList.length,
                    options: CarouselOptions(
                      onPageChanged: (i, reason) {
                        setState(() {
                          index = i;
                        });
                      },
                      height: 265.h,
                      aspectRatio: 1 / 1,
                      viewportFraction: 0.7,
                      padEnds: false,
                      disableCenter: true,
                      enableInfiniteScroll: false,
                    ),
                    itemBuilder: (BuildContext context, int i, int realIndex) {
                      double opacity = i == index ? 1.0 : 0.3;

                      return Container(
                        padding: const EdgeInsets.all(24),
                        margin: const EdgeInsets.only(
                          left: 10,
                        ),
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: const Color(0xffF1F6FB),
                        ),
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 300),
                          opacity: opacity,
                          child: Image.asset(
                            imgList[i].imagePath,
                            fit: BoxFit.contain,
                            height: 265.h,
                          ),
                        ),
                      );
                    },
                  ),
                  verticalGap(30),
                  AnimatedSmoothIndicator(
                    count: imgList.length,
                    effect: const WormEffect(
                      dotHeight: 6,
                      dotWidth: 6,
                      dotColor: Color(0xffe5f0fc),
                      activeDotColor: Color(0xff02131E),
                    ), // your preferred effect
                    onDotClicked: (index) {}, activeIndex: index,
                  )
                ],
              );
            },
            error: (error, stackTrace) => const Text("Error loading"),
            loading: () => const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }

  Widget buildBikerWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: SizedBox(
            height: 130,
            // width: 100,
            child: Lottie.asset(
              "assets/animations/biker.json",
              // height: 100,
              // width: 100,
              fit: BoxFit.contain,
            ),
          ),
        ),
        Expanded(
          child: AppText(
            data: "You too can join our\nElite squad of E-bikers",
            fontSize: 14,
            color: AppColors.black1,
          ),
        )
      ],
    );
  }

  Widget buildOrderWidget() {
    return Hero(
      tag: "",
      child: Container(
        height: 109.h,
        padding: const EdgeInsets.only(left: 32, right: 27),
        width: double.infinity,
        color: AppColors.primary,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AppText(
              data: "Gotten your\nElite yet?",
              fontSize: 14,
              color: AppColors.yellow1,
            ),
            const Spacer(),
            SizedBox(
              width: 183.w,
              height: 56.h,
              child: Consumer(
                builder: (context, ref, child) {
                  return AppWidgetButton(
                      onPressed: () {
                        ref.read(selectedNavItemProvider.notifier).state = 4;
                      },
                      data: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const AppText(
                            data: "Your Orders",
                            color: AppColors.white,
                            fontSize: 14,
                          ),
                          horizontalGap(21),
                          const Icon(
                            Icons.arrow_forward_outlined,
                            color: AppColors.white,
                          )
                        ],
                      ));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}