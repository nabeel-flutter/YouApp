import 'package:new_beginnings/src/pages/family_health_profile/family_health_inner_pages/health_profile/model/family_members.dart';

class DiseaseFamilyMembers {
  final String diseaseTitle;
  final List<FamilyMember> familyMembers;

  DiseaseFamilyMembers(
      {required this.diseaseTitle, required this.familyMembers});
}
