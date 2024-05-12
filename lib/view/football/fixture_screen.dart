import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fixtureapp/controller/football_fixture_controller.dart';
import 'package:fixtureapp/view/football/league_table.dart';

class FootballFixtureScreen extends StatelessWidget {
  final FixtureController controller = Get.put(FixtureController());

  FootballFixtureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Football Fixtures'),
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
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: controller.teamController,
                          decoration: const InputDecoration(
                            labelText: 'Enter Team Name', hintStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
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
                        child: const Text('Add Team', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          controller.clearlist();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[100],
                        ),
                        child: const Text('Clear', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Obx(() => ListView.builder(
                    itemCount: controller.teams.length,
                    itemBuilder: (context, index) {
                      // print(controller.teams.length);
                      return Card(
                        color: Colors.white,
                        child: ListTile(
                          title: Center(
                            child: Text(
                              controller.teams[index].teamname ?? '',
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                          trailing: SizedBox(
                            width: 100,
                            child: Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    controller.deleteteam(index);
                                  },
                                ),
                                 IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {
                                    showDialog(context:  context,
                                    builder: (context) {
                                      return AlertDialog(
                                        actions: [
                                          ElevatedButton(onPressed: () async {
                                        if (controller.editingController.text.isNotEmpty){
                            
                                       await controller.editTeam(controller.editingController.text, index);
                                       Get.back();
                                       controller.editingController.clear();
                                        }
                                      }, child: const Text('Save')),
                                      ElevatedButton(onPressed: () {
                                        Get.back();
                                      }, child: const Text('Cancel')),
                        
                                        ],
                                        content: 
                                          TextField(
                                        controller: controller.editingController,
                                        decoration: InputDecoration(
                        
                                          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Colors.grey))
                                        ),
                                      ),
                                      );
                                    },
                                    // children: [
                                      
                            
                                    //   // ElevatedButton(onPressed: () {
                                    //   //   if (controller.editingController.text.isNotEmpty){
                            
                                    //   //   controller.editTeam(controller.editingController.text, index);
                                    //   //   }
                                    //   // }, child: const Text('Save')),
                                    //   // ElevatedButton(onPressed: () {
                                    //   //   Get.back();
                                    //   // }, child: const Text('Cancel')),
                                    // ],
                                    
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          
                        ),
                      );
                    },
                  )),
                ),
                Obx(() => ElevatedButton(
                  onPressed: controller.teams.length < 2 ? null : controller.generateFixtures,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text('Generate Fixtures', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                )),
                const SizedBox(height: 20),
                const Text(
                  'Fixtures:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  flex: 1,
                  child: Obx(() => Card(
                    child: ListView.builder(
                      itemCount: controller.fixtures.length,
                      itemBuilder: (context, index) {
                        return FadeTransition(
                          opacity: controller.animation,
                          child: ListTile(
                            title: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: TextField(
                                      onChanged: (value) {
                                        controller.scores[index * 2] = int.tryParse(value) ?? 0;
                                      },
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                        labelText: 'Score',
                                        hintText: 'Enter score',
                                      ),
                                    ),
                                  ),
                                  Text(
                                    controller.fixtures[index].vs ?? '',
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(width: 80),
                                  Expanded(
                                    child: TextField(
                                      onChanged: (value) {
                                        controller.scores[index * 2 + 1] = int.tryParse(value) ?? 0;
                                      },
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                        labelText: 'Score',
                                        hintText: 'Enter score',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            tileColor: index % 2 == 0 ? Colors.grey[200] : null,
                          ),
                        );
                      },
                    ),
                  )),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.calculateLeagueTable();
                    Get.to(()=>LeagueTableScreen());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  child: const Text('Calculate League Table'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
