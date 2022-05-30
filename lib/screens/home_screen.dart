import 'package:calendar_schedular/components/calendar.dart';
import 'package:calendar_schedular/components/schedule_bottom_sheet.dart';
import 'package:calendar_schedular/components/schedule_card.dart';
import 'package:calendar_schedular/components/today_banner.dart';
import 'package:calendar_schedular/constant/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  DateTime focusedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: renderFloatingActionButton(),
      body: SafeArea(
        child: Column(
          children: [
            Calendar(
              onDaySelected: onDaySelected,
              focusedDay: focusedDay,
              selectedDay: selectedDay,
            ),
            SizedBox(
              height: 8.0,
            ),
            TodayBanner(
              selectedDay: selectedDay,
              scheduleCount: 3,
            ),
            SizedBox(
              height: 8.0,
            ),
            _ScheduleList(),
          ],
        ),
      ),
    );
  }

  FloatingActionButton renderFloatingActionButton() {
    return FloatingActionButton(
      backgroundColor: PRIMARY_COLOR,
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (_) {
            return ScheduleBottom();
          },
        );
      },
      child: Icon(Icons.add),
    );
  }

  onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      this.selectedDay = selectedDay;
      this.focusedDay = selectedDay;
      // 우리가 2/2을 누르면 selectedDay,focusedDay 둘 다 2/2가 됨
      // 근데 우리는 이미 2월을 보고있기 떄문에 캘린더의 변경이 없는거야
      // 근데 우리가 1/31을 누르는 순간 focusedDay가 1/31로 바뀌면서 1월을 바라보게 되는거야
    });
  }
}

class _ScheduleList extends StatelessWidget {
  const _ScheduleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView.separated(
          itemCount: 100, // 리스트에 몇개를 보여줄건지
          separatorBuilder: (context, index) {
            // itemBuilder가 한번 실행이 될 때마다 그 다음에 실행된다.
            return SizedBox(
              height: 8.0,
            );
          },
          itemBuilder: (context, index) {
            return ScheduleCard(
              startTime: 8,
              endTime: 9,
              content: '프로그래밍 공부하기 ${index}',
              color: Colors.red,
            );
          },
        ),
      ),
    );
  }
}
