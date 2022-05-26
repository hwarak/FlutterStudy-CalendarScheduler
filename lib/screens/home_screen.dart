import 'package:calendar_schedular/components/calendar.dart';
import 'package:calendar_schedular/components/today_banner.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Calendar(),
            SizedBox(
              height: 8.0,
            ),
            TodayBanner(
              selectedDay: DateTime.now(),
              scheduleCount: 3,
            )
          ],
        ),
      ),
    );
  }
}
