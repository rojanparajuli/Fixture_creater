import 'package:flutter/material.dart';
import 'package:fixtureapp/controller/football_fixture_controller.dart';
import 'package:get/get.dart';

class LeagueTableScreen extends StatelessWidget {
  final FixtureController fixtureController = Get.find();

  LeagueTableScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('League Table'),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset("assets/green.jpg"),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Obx(
                () => ListView.builder(
                  itemCount: fixtureController.teams.length,
                  itemBuilder: (context, index) {
                    final team = fixtureController.teams[index];
                    final teamFixture = fixtureController.fixtures
                        .where((fixture) =>
                            fixture.vs!.contains(team.teamname ?? ''))
                        .toList();
                    int matchesPlayed = teamFixture.length;
                    // int goalsScored =
                    //     teamFixture.fold(0, (sum, fixture) => sum + fixture!);
                    int points = teamFixture.fold(
                        0, (sum, fixture) => sum + fixture.points!);

                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ListTile(
                          leading: Image.asset('assets/team.png'),
                          title: Text(
                            team.teamname ?? '',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Matches Played: $matchesPlayed'),
                              // Text('Goals Scored: $goalsScored'),
                              Text('Points: $points'),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
