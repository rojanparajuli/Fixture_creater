import 'package:fixtureapp/model/team_model.dart';
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
    teams.add(TeamModel(teamname: team

    ));
    teams.refresh();
    teamController.clear();
    Get.snackbar('Team Added', 'Team $team added successfully');
  }

  void generateFixtures() {
    RxList<FixtureModel> generatedFixtures = <FixtureModel>[].obs;
    for (int i = 0; i < teams.length - 1; i++) {
      for (int j = i + 1; j < teams.length; j++) {
        // generatedFixtures.add('${teams[i].teamname} vs ${teams[j].teamname}');
        generatedFixtures.add(FixtureModel(vs: '${teams[i].teamname} vs ${teams[j].teamname}'));
        scores.add(0);
      }
    }
    print(generatedFixtures);
    fixtures.value = generatedFixtures;
    // fixtures.add(FixtureModel(vs: generatedFixtures.toString()));
    _controller.forward(from: 0);
    update();
  }

  void calculateLeagueTable() {
   
    // for (int i = 0; i < teams.length; i++) {
    //   teamData[teams[i]] = {'goals': 0, 'points': 0, 'matchesPlayed': 0};
    // }

    for (int i = 0; i < fixtures.length; i++) {
      for (int j = i; j < fixtures.length; j++){

      int score1 = fixtures[i].goals ?? 0;
      int score2 = fixtures[j].goals ?? 0;

      print(score1);
      print(score2);
      }
      // String team1 = fixtures[i].split(' vs ')[0];
      // String team2 = fixtures[i].split(' vs ')[1];
      // int goal = teamData[team1]!['goals'] ?? 0;
      // int matchedPlayed = teamData[team2]!['matchesPlayed'] ?? 0;

      
        // goal = (goal! + score1);
        // teamData[team2]!['goals'] = (teamData[team2]!['goals']! +score2);
      

     
      // goal ++;
    


      // matchedPlayed ++;

        // if (score1 > score2) {
        //   teamData[team1]!['points'] = (teamData[team1]!['points']! + 3);
        // } else if (score1 < score2) {
        //   teamData[team2]!['points'] = (teamData[team2]!['points']! + 3);
        // } else {
        //   teamData[team1]!['points'] = 1;
        //   teamData[team2]!['points'] = 1;
        // }
    }

    // var sortedTeams = teamData.entries.toList();
    // sortedTeams.sort((a, b) => b.value['points']!.compareTo(a.value['points']!));

    // for (var entry in sortedTeams) {
    //   print('${entry.key}: ${entry.value}');
    // }
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

Future<void> editTeam(String text, int index)async{
  teams.replaceRange(index, index+1, [TeamModel(teamname: text)]);
      
}

}