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
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: const [HomeScreenBody(), ProfileScreen()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorConstants.primaryColor,
        selectedItemColor: ColorConstants.white,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
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
