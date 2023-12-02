import '../../../../export.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          wavyLine1(),
          wavyLine2(),
          wavyLine3(),
          Positioned(
              left: 0,
              top: 0,
              child: Image.asset('assets/images/onboading_ellipse.png')),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(child: verticalGap(135)),
                Image.asset("assets/images/onboading_img.png"),
                verticalGap(97),
                const AppText(
                  data: "Welcome to E-Bikes",
                  color: Color(0xFF041C2E),
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
                verticalGap(),
                const AppText(
                  textAlign: TextAlign.center,
                  data:
                      " Buying Electric bikes just got a lot easier, Try us today. ",
                  color: Color(0xFF95823C),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                verticalGap(24),
                AnimatedSmoothIndicator(
                  count: 3,
                  effect: const WormEffect(
                    dotHeight: 6,
                    dotWidth: 6,
                    dotColor: Color(0xffe5f0fc),
                    activeDotColor: Color(0xff02131E),
                  ), // your preferred effect
                  onDotClicked: (index) {}, activeIndex: 0,
                ),
                verticalGap(48),
                AppWidgetButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    FadeTransition(
                              opacity: animation,
                              child: const DashboardScreen(),
                            ),
                          ));
                    },
                    data: Stack(
                      children: [
                        const Positioned.fill(
                          child: Center(
                            child: AppText(
                              data: "Signin with Google",
                              color: AppColors.white,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: 0,
                          bottom: 0,
                          child: CircleAvatar(
                            backgroundColor: AppColors.white,
                            child: Image.asset('assets/icons/icon-google.png'),
                          ),
                        ),
                      ],
                    )),
                verticalGap(48),
                const Text.rich(TextSpan(children: [
                  TextSpan(
                      text: "Don’t have any account?",
                      style: TextStyle(
                        color: Color(0xFF95823C),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.50,
                      )),
                  TextSpan(
                      text: "Sign Up",
                      style: TextStyle(
                        color: Color(0xFF031522),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.50,
                      )),
                ])),
                verticalGap(28),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
