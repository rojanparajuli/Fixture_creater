// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class FixtureScreen extends StatelessWidget {
//   final TextEditingController teamController = TextEditingController();
//   final List<String> teams = [];

//   void addTeam(String team) {
//     teams.add(team);
//     teamController.clear();
//     Get.snackbar('Team Added', 'Team $team added successfully');
//   }

//   void generateFixtures() {
//     print('Fixtures Generated:');
//     for (int i = 0; i < teams.length - 1; i++) {
//       for (int j = i + 1; j < teams.length; j++) {
//         print('${teams[i]} vs ${teams[j]}');
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Football Fixtures'),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: teamController,
//                     decoration: const InputDecoration(
//                       labelText: 'Enter Team Name',
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 ElevatedButton(
//                   onPressed: () {
//                     if (teamController.text.isNotEmpty) {
//                       addTeam(teamController.text);
//                     }
//                   },
//                   child: const Text('Add Team'),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: teams.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(teams[index]),
//                 );
//               },
//             ),
//           ),
//           ElevatedButton(
//             onPressed: teams.length < 2 ? null : generateFixtures,
//             child: const Text('Generate Fixtures'),
//           ),
//         ],
//       ),
//     );
//   }
// }