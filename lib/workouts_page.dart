import 'package:flutter/material.dart';
import 'workout_detail_page.dart'; // Or wherever your WorkoutDetailPage is
// import 'models.dart'; // If your Workout model is in a separate file

class WorkoutsPage extends StatelessWidget {
  const WorkoutsPage({super.key});

  // Sample data for testing
  final List<Workout> sampleWorkouts = const [
    Workout(
      title: 'Cardio Blast',
      description: 'High-intensity cardio to get your heart pumping!',
      duration: 20,
    ),
    Workout(
      title: 'Yoga Flow',
      description:
          'A calming session focusing on flexibility and breath control.',
      duration: 15,
    ),
    Workout(
      title: 'HIIT Burn',
      description: 'High-Intensity Interval Training for maximum fat burn.',
      duration: 10,
    ),
    Workout(
      title: 'Strength Basics',
      description: 'Full-body strength training with bodyweight exercises.',
      duration: 25,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workouts'),
      ),
      body: ListView.builder(
        // We build a ListTile for each workout item
        itemCount: sampleWorkouts.length,
        itemBuilder: (context, index) {
          final workout = sampleWorkouts[index];
          return ListTile(
            title: Text(workout.title),
            subtitle: Text(
              '${workout.description}\nDuration: ${workout.duration} min',
            ),
            isThreeLine: true,
            leading: const Icon(Icons.fitness_center),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WorkoutDetailPage(workout: workout),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// If you didn’t create a separate file for the Workout model:
class Workout {
  final String title;
  final String description;
  final int duration;

  const Workout({
    required this.title,
    required this.description,
    required this.duration,
  });
}
