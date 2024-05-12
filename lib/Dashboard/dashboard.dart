import 'package:fixtureapp/view/cricket/fixtures_screen.dart';
import 'package:fixtureapp/view/football/fixture_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sports Selection'),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/dashboard.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Select Your Sports',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  onPressed: () {
                    Get.to(() => FootballFixtureScreen());
                  },
                  child: const Text('Football', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  onPressed: () {
                    Get.to(()=> CrickectScreen());
                  },
                  child: const Text('Cricket',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
