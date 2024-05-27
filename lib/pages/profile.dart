import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: const Color.fromARGB(255, 99, 99, 99),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Picture and Basic Info
            Container(
              color: const Color.fromARGB(255, 139, 139, 139).withOpacity(0.3),
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/profile.jpg'), // Example image
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Hashaam',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '"Stay Strong"',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[700],
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Fitness Statistics
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Fitness Statistics',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  Divider(),
                  Card(
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Icon(Icons.fitness_center, color: Color.fromARGB(255, 0, 0, 0)),
                      title: Text('Weight'),
                      subtitle: Text('70 kg'),
                    ),
                  ),
                  Card(
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Icon(Icons.height, color: Color.fromARGB(255, 0, 0, 0)),
                      title: Text('Height'),
                      subtitle: Text('175 cm'),
                    ),
                  ),
                  Card(
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Icon(Icons.calculate, color: Color.fromARGB(255, 0, 0, 0)),
                      title: Text('BMI'),
                      subtitle: Text('22.9'),
                    ),
                  ),
                ],
              ),
            ),
            // Workout History
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Workout History',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  Divider(),
                  // Example workout item
                  Card(
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Icon(Icons.check_circle_outline, color: Color.fromARGB(255, 0, 0, 0)),
                      title: Text('5 km Run'),
                      subtitle: Text('Duration: 30 min, Calories burned: 300 kcal'),
                    ),
                  ),
                ],
              ),
            ),
            // Progress Tracking
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Progress Tracking',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  Divider(),
                  // Example progress item
                  Card(
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Icon(Icons.photo, color: Color.fromARGB(255, 0, 0, 0)),
                      title: Text('Progress Photos'),
                      subtitle: Text('View and compare your progress photos'),
                    ),
                  ),
                ],
              ),
            ),
            // More sections can be added here following the same structure
          ],
        ),
      ),
    );
  }
}
