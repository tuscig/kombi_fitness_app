import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'workouts_page.dart';
import 'progress_page.dart';
import 'package:firebase_core/firebase_core.dart';

// TODO: 1) Confirm these values match your Firebase project.
//       2) Or optionally use the FlutterFire CLI to generate firebase_options.dart.

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDIviuJPV7jO4vmTqi5N5CX8GMucTpkZOk",
            authDomain: "kombi-b9eb4.firebaseapp.com",
            projectId: "kombi-b9eb4",
            storageBucket: "kombi-b9eb4.appspot.com",
            messagingSenderId: "49640517641",
            appId: "1:49640517641:web:f001e68fa25874727448d8",
            measurementId: "G-7MNBP878CR"));
  } else {
    await Firebase.initializeApp();
  }

  // This function is the starting point of your Flutter app.
  runApp(const KombiFitnessApp());
}

class KombiFitnessApp extends StatelessWidget {
  const KombiFitnessApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp is a predefined class in Flutter that sets up
    // basic app structure, navigation, theming, etc.
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kombi Fitness App',
      theme: ThemeData(
        // You can customize your app’s theme here (colors, font, etc.).
        primarySwatch: Colors.deepPurple,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kombi Fitness'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Kombi Fitness!',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WorkoutsPage(),
                  ),
                );
              },
              child: const Text('Get Started'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProgressPage(),
                  ),
                );
              },
              child: const Text('View My Progress'),
            ),
          ],
        ),
      ),
    );
  }
}
