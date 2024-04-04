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
      floatingActionButton: const FloatingButton(),
      body: PageView(
        controller: context.read<AnimatedDrawerCubit>().pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomeScreenBody(),
          AppointmentScreen(),
          MyLogs(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        height: 77,
        child: BlocConsumer<AnimatedDrawerCubit, AnimatedDrawerState>(
          listener: (context, state) {},
          builder: (context, state) {
            return BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: ColorConstants.primaryColor,
              selectedItemColor: ColorConstants.white,
              unselectedItemColor: ColorConstants.white,
              selectedLabelStyle: const TextStyle(
                fontSize: 12,
                height: 1.8,
              ),
              unselectedLabelStyle: const TextStyle(height: 1.8, fontSize: 12),
              currentIndex:
                  context.read<AnimatedDrawerCubit>().getBottomNavIndex,
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
                    context.read<AnimatedDrawerCubit>().getBottomNavIndex == 0
                        ? AssetsConstants.homefilledIcon
                        : AssetsConstants.homeIcon,
                    color: ColorConstants.white,
                    height: 24,
                    width: 24,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    context.read<AnimatedDrawerCubit>().getBottomNavIndex == 1
                        ? AssetsConstants.appoinmentfilledIcon
                        : AssetsConstants.appointmentIcon,
                    color: ColorConstants.white,
                    height: 24,
                    width: 24,
                  ),
                  label: 'Appointment',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    context.read<AnimatedDrawerCubit>().getBottomNavIndex == 2
                        ? AssetsConstants.logfilledIcon
                        : AssetsConstants.logIcon,
                    color: ColorConstants.white,
                    height: 24,
                    width: 24,
                  ),
                  label: 'My Logs',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    context.read<AnimatedDrawerCubit>().getBottomNavIndex == 3
                        ? AssetsConstants.profilefilledIcon
                        : AssetsConstants.profileIcon,
                    color: ColorConstants.white,
                    height: 24,
                    width: 24,
                  ),
                  label: 'Profile',
                ),
              ],
            );
          },
        ),
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
            MaterialPageRoute(builder: (context) => const ChatBotScreen()),
          );
        },
        child: Image.asset(
          "assets/images/robot.png",
          width: 30,
          height: 30,
        ));
  }
}
