import '../../../../export.dart';


class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({Key? key}) : super(key: key);
  @override
  Widget build(context, ref) {
    final selectedIndex = ref.watch(selectedNavItemProvider);

    const pages = [
      Home(),
      Bookmark(),
      Send(),
      Settings(),
      Track(),
    ];

    Future<bool> onWillPop() async {
      if (selectedIndex != 0) {
        ref.watch(selectedNavItemProvider.notifier).state = 0;
        return false;
      } else {
        return true;
      }
    }

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        bottomNavigationBar: SizedBox(
          height: 80.h,
          child: BottomNavigationBar(
            backgroundColor: AppColors.blueLight,
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/icons/home.svg",
                  ),
                  label: "home"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/icons/markey.svg",
                  ),
                  label: "j"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/icons/cart.svg",
                  ),
                  label: "b"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/icons/heart.svg",
                  ),
                  label: "setting"),
            ],
            currentIndex: selectedIndex >= 4 ? 0 : selectedIndex,
            onTap: (index) =>
                ref.watch(selectedNavItemProvider.notifier).state = index,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
          ),
        ),
        // body: pages[selectedIndex],
        body: IndexedStack(
          index: selectedIndex,
          children: pages,
        ),
      ),
    );
  }
}
