import '../../export.dart';

class AppProgress extends StatelessWidget {
  const AppProgress({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
