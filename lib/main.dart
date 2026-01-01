import 'package:flutter/material.dart';

void main() {
  runApp(const SalahApp());
}

class SalahApp extends StatelessWidget {
  const SalahApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Salah Sri Lanka',
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Gregorian Date
  String getTodayDate() {
    final now = DateTime.now();
    return "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";
  }

  // Hijri Date (Approx – Package இல்லாம)
  String getHijriDate() {
    final now = DateTime.now();

    final hijriStart = DateTime(622, 7, 16);
    final daysPassed = now.difference(hijriStart).inDays;

    final hijriYear = (daysPassed / 354.367).floor();
    final remainingDays = daysPassed % 354.367;

    final hijriMonth = (remainingDays / 29.53).floor() + 1;
    final hijriDay = (remainingDays % 29.53).floor() + 1;

    return "$hijriDay / $hijriMonth / $hijriYear AH";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Salah Sri Lanka'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'City: Colombo',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              'Today: ${getTodayDate()}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'Hijri: ${getHijriDate()}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            const Text(
              'Next Salah: Fajr - 05:12 AM',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
