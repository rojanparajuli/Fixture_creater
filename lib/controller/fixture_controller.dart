import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FixtureController extends GetxController with GetTickerProviderStateMixin {
  final TextEditingController teamController = TextEditingController();
  final RxList<String> teams = <String>[].obs;
  RxList<String> fixtures = <String>[].obs;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void onInit() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    super.onInit();
  }

  @override
  void onClose() {
    _controller.dispose();
    super.onClose();
  }

  void addTeam(String team) {
    teams.add(team);
    print(teams);
    teams.refresh();
    teamController.clear();
    Get.snackbar('Team Added', 'Team $team added successfully');
    
  }

  void generateFixtures() {
    RxList<String> generatedFixtures = <String>[].obs;
    for (int i = 0; i < teams.length - 1; i++) {
      for (int j = i + 1; j < teams.length; j++) {
        generatedFixtures.add('${teams[i]} vs ${teams[j]}');
      }
    }
    fixtures.value = generatedFixtures;
    _controller.forward(from: 0);
    update();
  }

  Animation<double> get animation => _animation;
}
