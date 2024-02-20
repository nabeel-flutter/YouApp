part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class AppCheckButtonState extends AppState {
  final bool isOpen;

  AppCheckButtonState(this.isOpen);
}

class AppUpdateUser extends AppState {
  final UserModel? user;

  AppUpdateUser(this.user);
}

class AppUpdateSetOfScreensUser extends AppState {
  final NavigationWrapper? navigationWrapper;

  AppUpdateSetOfScreensUser(this.navigationWrapper);
}
