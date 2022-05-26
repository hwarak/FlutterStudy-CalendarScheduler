import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime? selectedDay;
  // 기본적으로 선택되지 않은 상태라고 해두자.
  // 오늘을 기준으로 하고싶으면 = DateTime.now()를 해주면 됨

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: DateTime.now(),
      firstDay: DateTime(1800),
      lastDay: DateTime(3000),
      headerStyle: HeaderStyle(
        formatButtonVisible: false, // 2weeks 버튼 숨기기
        titleCentered: true, // 연, 월 가운데 정렬
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 16.0,
        ),
      ),
      onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
        setState(() {
          this.selectedDay = selectedDay;
        });
      },
      selectedDayPredicate: (DateTime date) {
        // 이 화면에서 보이는 모든 날짜를 테이블 캘린더가 selectedDayPredicate를 실행해볼거야.

        if (selectedDay == null) return false;

        // 시, 분, 초는 같을 필요 없고, 년, 월, 일만 같으면 같은 날짜라고 보자
        return date.year == selectedDay!.year &&
            date.month == selectedDay!.month &&
            date.day == selectedDay!.day;
      },
    );
  }
}
