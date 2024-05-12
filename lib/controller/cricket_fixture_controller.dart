import 'package:fixtureapp/model/cricket_model.dart';
import 'package:get/get.dart';

class TeamController extends GetxController {
  RxList<Team> teams = <Team>[].obs;

  void addTeam(String name) {
    teams.add(Team(name));
  }

  void removeTeam(int index) {
    teams.removeAt(index);
  }
}