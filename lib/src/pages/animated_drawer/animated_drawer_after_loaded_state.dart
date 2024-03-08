import 'package:new_beginnings/src/app/app_export.dart';

class AnimatedDrawerAfterLoadedState extends StatefulWidget {
  const AnimatedDrawerAfterLoadedState({
    Key? key,
    required this.color,
  }) : super(key: key);

  final Color color;

  @override
  State<AnimatedDrawerAfterLoadedState> createState() =>
      _AnimatedDrawerAfterLoadedStateState();
}

class _AnimatedDrawerAfterLoadedStateState
    extends State<AnimatedDrawerAfterLoadedState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: context.read<AnimatedDrawerCubit>().pageController,
        children: const [
          HomeScreenBody(),
          AppointmentScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar:
          BlocConsumer<AnimatedDrawerCubit, AnimatedDrawerState>(
        listener: (context, state) {},
        builder: (context, state) {
          return BottomNavigationBar(
            backgroundColor: ColorConstants.primaryColor,
            selectedItemColor: ColorConstants.white,
            currentIndex: context.read<AnimatedDrawerCubit>().getBottomNavIndex,
            onTap: (index) {
              context.read<AnimatedDrawerCubit>().updateIndex(
                  isOpen: false,
                  index: index,
                  pageController:
                      context.read<AnimatedDrawerCubit>().pageController,
                  advancedDrawerController: context
                      .read<AnimatedDrawerCubit>()
                      .advancedDrawerController);
            },
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  AssetsConstants.homeIcon,
                  color:
                      context.read<AnimatedDrawerCubit>().getBottomNavIndex == 0
                          ? ColorConstants.white
                          : ColorConstants.primaryTextColor,
                  height: 24,
                  width: 24,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  AssetsConstants.appointmentIcon,
                  color:
                      context.read<AnimatedDrawerCubit>().getBottomNavIndex == 1
                          ? ColorConstants.white
                          : ColorConstants.primaryTextColor,
                  height: 24,
                  width: 24,
                ),
                label: 'Appointments',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  AssetsConstants.profileIcon,
                  color:
                      context.read<AnimatedDrawerCubit>().getBottomNavIndex == 2
                          ? ColorConstants.white
                          : ColorConstants.primaryTextColor,
                  height: 24,
                  width: 24,
                ),
                label: 'Profile',
              ),
            ],
          );
        },
      ),
    );
  }
}
