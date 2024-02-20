import 'package:new_beginnings/src/app/app_export.dart';
import 'package:new_beginnings/src/pages/profile/health_profile_list_args.dart';

List<HealthProfileList> healthProfile = [
  HealthProfileList(
      text: StringConstants.physicalHealth,
      route: RouteConstants.physicalHealthRoute),
  HealthProfileList(
      text: StringConstants.socialHealth,
      route: RouteConstants.socialHealthRoute),
  HealthProfileList(
      text: StringConstants.mentalHealth,
      route: RouteConstants.mentalHealthRoute),
];
