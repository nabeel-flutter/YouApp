import 'package:new_beginnings/src/app/app_export.dart';
import 'package:new_beginnings/src/pages/chatbot/chatbot_screen.dart';
import 'package:new_beginnings/src/pages/my_logs/my_logs.dart';

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
      floatingActionButton: FloatingButton(),
      body: PageView(
        controller: context.read<AnimatedDrawerCubit>().pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomeScreenBody(),
          AppointmentScreen(),
          ProfileScreen(),
          MyLogs()
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

class FloatingButton extends StatelessWidget {
  const FloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: ColorConstants.primaryColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatBotScreen()),
          );
        },
        child: Image.asset(
          "assets/images/robot.png",
          width: 30,
          height: 30,
        ));
  }
}
