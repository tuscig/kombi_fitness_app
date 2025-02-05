import 'workouts_page.dart'; // or wherever your Workout class is
// We also need a small class to represent a "CompletedWorkout"

class CompletedWorkout {
  final Workout workout;
  final DateTime completionTime;

  CompletedWorkout({required this.workout, required this.completionTime});
}

class ProgressManager {
  // We'll store completed workouts in a static list for demo purposes.
  static final List<CompletedWorkout> _completedWorkouts = [];

  static void addCompletedWorkout(Workout workout) {
    _completedWorkouts.add(
      CompletedWorkout(
        workout: workout,
        completionTime: DateTime.now(),
      ),
    );
  }

  static List<CompletedWorkout> getCompletedWorkouts() {
    return _completedWorkouts;
  }
}
