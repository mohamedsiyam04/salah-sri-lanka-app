import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';

void main() {
  runApp(const SalahApp());
}

/// GLOBAL COLORS (Professional Islamic Theme)
const primaryColor = Color(0xFF1B5E20);
const secondaryColor = Color(0xFF4CAF50);
const bgColor = Color(0xFFF4F6F8);

class SalahApp extends StatelessWidget {
  const SalahApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Salah Sri Lanka',
      theme: ThemeData(
        scaffoldBackgroundColor: bgColor,
        primaryColor: primaryColor,
        fontFamily: 'Roboto', // default safe font
        appBarTheme: const AppBarTheme(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  /// Gregorian Date
  String getTodayDate() {
    final now = DateTime.now();
    return "${now.day.toString().padLeft(2, '0')}-"
        "${now.month.toString().padLeft(2, '0')}-"
        "${now.year}";
  }

  /// Hijri Date
  String getHijriDate() {
    final hijri = HijriCalendar.now();
    return "${hijri.hDay} ${hijri.longMonthName} ${hijri.hYear} AH";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Salah Sri Lanka"),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {}, // future
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            /// CITY + DATE CARD
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text(
                      "Colombo, Sri Lanka",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text("Today: ${getTodayDate()}"),
                    Text("Hijri: ${getHijriDate()}"),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// NEXT SALAH (HERO SECTION)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [primaryColor, secondaryColor],
                ),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                children: const [
                  Text(
                    "Next Salah",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Fajr",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "05:12 AM",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// SALAH TIMES LIST
            Expanded(
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: const [
                    _PrayerTile(name: "Fajr", time: "05:12 AM", active: true),
                    Divider(),
                    _PrayerTile(name: "Dhuhr", time: "12:15 PM"),
                    Divider(),
                    _PrayerTile(name: "Asr", time: "03:45 PM"),
                    Divider(),
                    _PrayerTile(name: "Maghrib", time: "06:10 PM"),
                    Divider(),
                    _PrayerTile(name: "Isha", time: "07:25 PM"),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 10),

            /// ACTION BUTTONS
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.location_city),
                    label: const Text("Change City"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.edit),
                    label: const Text("Manual Edit"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: secondaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// SINGLE PRAYER TILE (Reusable – Pro Style)
class _PrayerTile extends StatelessWidget {
  final String name;
  final String time;
  final bool active;

  const _PrayerTile({
    required this.name,
    required this.time,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.access_time,
        color: active ? primaryColor : Colors.grey,
      ),
      title: Text(
        name,
        style: TextStyle(
          fontWeight: active ? FontWeight.bold : FontWeight.normal,
          color: active ? primaryColor : Colors.black,
        ),
      ),
      trailing: Text(
        time,
        style: TextStyle(
          fontWeight: active ? FontWeight.bold : FontWeight.normal,
          color: active ? primaryColor : Colors.black,
        ),
      ),
    );
  }
}
