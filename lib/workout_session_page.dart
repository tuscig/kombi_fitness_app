import 'dart:async';
import 'package:flutter/material.dart';
import 'workouts_page.dart';
import 'progress_manager.dart'; // or wherever you defined the Workout model

class WorkoutSessionPage extends StatefulWidget {
  final Workout workout;

  const WorkoutSessionPage({super.key, required this.workout});

  @override
  State<WorkoutSessionPage> createState() => _WorkoutSessionPageState();
}

class _WorkoutSessionPageState extends State<WorkoutSessionPage> {
  late int _remainingSeconds;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Convert minutes to seconds
    _remainingSeconds = widget.workout.duration * 60;
  }

  void _startTimer() {
    // If there's already a timer running, do nothing
    if (_timer != null && _timer!.isActive) return;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        // Timer done
        timer.cancel();
        _showWorkoutCompleteDialog();
      }
    });
  }

  // Optionally allow user to pause
  void _pauseTimer() {
    _timer?.cancel();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final minutes = _remainingSeconds ~/ 60;
    final seconds = _remainingSeconds % 60;

    return Scaffold(
      appBar: AppBar(
        title: Text('In Progress: ${widget.workout.title}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Time Remaining',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            Text(
              // Format the countdown as MM:SS
              '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 40),
            Text(
              'Stay focused, keep breathing!',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _startTimer,
                  child: const Text('Start'),
                ),
                ElevatedButton(
                  onPressed: _pauseTimer,
                  child: const Text('Pause'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Show a simple pop-up when the timer hits 0.
  void _showWorkoutCompleteDialog() {
    // Mark this workout as completed.
    ProgressManager.addCompletedWorkout(widget.workout);

    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: const Text('Workout Complete!'),
          content: Text(
            'You’ve finished the ${widget.workout.title} workout.\nGreat job!',
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop(); // close dialog
                Navigator.of(context).pop(); // go back to previous screen
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
