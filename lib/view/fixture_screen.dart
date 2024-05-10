import 'package:fixtureapp/controller/fixture_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class FixtureScreen extends StatelessWidget {
  final FixtureController controller = Get.put(FixtureController());
   FixtureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Football Fixtures'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller.teamController,
                    decoration: const InputDecoration(
                      labelText: 'Enter Team Name',
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    if (controller.teamController.text.isNotEmpty) {
                      controller.addTeam(controller.teamController.text);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text('Add Team'),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(()=> ListView.builder(
              itemCount: controller.teams.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Center(
                    child: Text(
                      controller.teams[index],
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  tileColor: index % 2 == 0 ? Colors.grey[200] : null,
                );
              },
            ),
            ),
          ),
          Obx(()=> ElevatedButton(
              onPressed: controller.teams.length < 2 ? null : controller.generateFixtures,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: const Text('Generate Fixtures'),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Fixtures:',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Obx(() => ListView.builder(
              itemCount: controller.fixtures.length,
              itemBuilder: (context, index) {
                return FadeTransition(
                  opacity: controller.animation,
                  child: ListTile(
                    title: Center(
                      child: Text(
                        controller.fixtures[index],
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    tileColor: index % 2 == 0 ? Colors.grey[200] : null,
                  ),
                );
              },
            )),
          ),
        ],
      ),
    );
  }
}