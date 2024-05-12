import 'package:fixtureapp/controller/cricket_fixture_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CrickectScreen
 extends StatelessWidget {
  final TeamController teamController = Get.put(TeamController());

   CrickectScreen
   ({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text('Cricket Fixture Maker'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onSubmitted: (value) {
                  teamController.addTeam(value);
                },
                decoration: const InputDecoration(
                  labelText: 'Enter Team Name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  itemCount: teamController.teams.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(teamController.teams[index].name),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          teamController.removeTeam(index);
                        },
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      );
  }
}
