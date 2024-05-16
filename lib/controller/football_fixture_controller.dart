import 'package:fixtureapp/model/football_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FixtureController extends GetxController with GetTickerProviderStateMixin {
  final TextEditingController teamController = TextEditingController();
  final RxList<TeamModel> teams = <TeamModel>[].obs;
  RxList<FixtureModel> fixtures = <FixtureModel>[].obs;
  RxList<int> scores = <int>[].obs;
  late AnimationController _controller;
  late Animation<double> _animation;

  final TextEditingController editingController = TextEditingController();
  String team1 ='';
  String team2 ='';

  @override
  void onInit() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    super.onInit();
    calculateLeagueTable();
  }

  @override
  void onClose() {
    _controller.dispose();
    super.onClose();
  }

  void addTeam(String team) {
    teams.add(TeamModel(teamname: team));
    teams.refresh();
    teamController.clear();
    Get.snackbar('Team Added', 'Team $team added successfully');
  }

  void generateFixtures() {
    RxList<FixtureModel> generatedFixtures = <FixtureModel>[].obs;
    for (int i = 0; i < teams.length - 1; i++) {
      for (int j = i + 1; j < teams.length; j++) {
        generatedFixtures.add(FixtureModel(
          vs: '${teams[i].teamname} vs ${teams[j].teamname}',
        ));
        scores.add(0);
      }
    }
    print(generatedFixtures);
    fixtures.value = generatedFixtures;
    _controller.forward(from: 0);
    update();
  }

  void calculateLeagueTable() {
    for (int i = 0; i < fixtures.length-1; i++) {
      int score1 = fixtures[i].team1Score ?? 0;
      int score2 = fixtures[i].team2Score ?? 0;

      if (score1 > score2) {
        // Team 1 wins....................................................................
        fixtures[i].win = (fixtures[i].win ?? 0) + 1;
        fixtures[i + 1].loss = (fixtures[i + 1].loss ?? 0) + 1;
      } else if (score1 < score2) {
        // Team 2 wins........................................................................
        fixtures[i].loss = (fixtures[i].loss ?? 0) + 1;
        fixtures[i + 1].win = (fixtures[i + 1].win ?? 0) + 1;
      } else {
        // Draw...............................................................................
        fixtures[i].draw = (fixtures[i].draw ?? 0) + 1;
        fixtures[i + 1].draw = (fixtures[i + 1].draw ?? 0) + 1;
      }
    }

    for (int i = 0; i < teams.length; i++) {
      fixtures[i].points = calculatePoints(fixtures[i].win ?? 0, fixtures[i].draw ?? 0, fixtures[i].loss ?? 0);
    }
  }

  int calculatePoints(int win, int draw, int loss) {
    int points = (win * 3) + (draw * 1) + (loss * 0);
    return points;
  }

  Animation<double> get animation => _animation;

  void clearlist() {
    teams.clear();
    fixtures.clear();
    scores.clear();
  }

  void deleteteam(int index){
    teams.removeAt(index);
  }

  Future<void> editTeam(String text, int index) async {
    teams.replaceRange(index, index+1, [TeamModel(teamname: text)]);
  }
}
