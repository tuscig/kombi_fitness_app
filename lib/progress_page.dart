import 'package:flutter/material.dart';
import 'progress_manager.dart'; // Access completed workouts

class ProgressPage extends StatelessWidget {
  const ProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    final completedWorkouts = ProgressManager.getCompletedWorkouts();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Progress'),
      ),
      body: completedWorkouts.isEmpty
          ? const Center(
              child: Text(
                'No completed workouts yet.\nKeep going!',
                textAlign: TextAlign.center,
              ),
            )
          : ListView.builder(
              itemCount: completedWorkouts.length,
              itemBuilder: (context, index) {
                final entry = completedWorkouts[index];
                final formattedDate =
                    '${entry.completionTime.year}-${entry.completionTime.month.toString().padLeft(2, '0')}-${entry.completionTime.day.toString().padLeft(2, '0')} '
                    '${entry.completionTime.hour.toString().padLeft(2, '0')}:${entry.completionTime.minute.toString().padLeft(2, '0')}';

                return ListTile(
                  title: Text(entry.workout.title),
                  subtitle: Text('Completed on: $formattedDate'),
                  trailing: Text('${entry.workout.duration} min'),
                );
              },
            ),
    );
  }
}
