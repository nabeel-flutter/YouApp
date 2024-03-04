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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorConstants.primaryColor,
        selectedItemColor: ColorConstants.white,
        currentIndex: context.read<AnimatedDrawerCubit>().currentIndex,
        onTap: (index) {
          context.read<AnimatedDrawerCubit>().updateIndex(
              isOpen: false,
              index: index,
              pageController:
                  context.read<AnimatedDrawerCubit>().pageController,
              advancedDrawerController:
                  context.read<AnimatedDrawerCubit>().advancedDrawerController);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Appointments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
