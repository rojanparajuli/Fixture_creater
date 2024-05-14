import 'package:flutter/material.dart';
import 'package:fixtureapp/controller/football_fixture_controller.dart';
import 'package:get/get.dart';

class LeagueTableScreen extends StatelessWidget {
  final FixtureController fixtureController = Get.find();

  LeagueTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    fixtureController.calculateLeagueTable();

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
              // color: Colors.yellow,
              child: Image.asset("assets/green.jpg"),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Obx(
                () => ListView.builder(
                  itemCount: fixtureController.teams.length,
                  itemBuilder: (context, index) {
                    final team = fixtureController.teams[index];
                    // final teamData = fixtureController.getTeamData(team);

                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ListTile(
                          leading: Image.asset('assets/team.png'),
                          title: const Text(
                            "Team",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          subtitle: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Matches Played'),
                              Text('Goals Scored'),
                              Text('Points'),
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
