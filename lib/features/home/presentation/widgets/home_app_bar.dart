import '../../../../export.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 28.r,
                backgroundImage: const AssetImage('assets/images/biker.png'),
              ),
              const Spacer(),
              Container(
                  height: 40.sp,
                  width: 40.sp,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xffF1F6FB),
                  ),
                  child: SvgPicture.asset('assets/icons/notification.svg')),
            ],
          ),
          verticalGap(28),
          const Align(
              alignment: Alignment.topLeft,
              child: AppText(
                data: "Hello good Morning!",
                fontSize: 18,
                fontWeight: FontWeight.w700,
              )),
        ],
      ),
    );
  }
}
