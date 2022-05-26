import 'package:calendar_schedular/constant/colors.dart';
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

  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final defaultBoxDeco = BoxDecoration(
      //  날짜들의 박스 decoration을 지정할 수 있다
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(6.0),
    );
    final defaultTextStyle = TextStyle(
      color: Colors.grey[600],
      fontWeight: FontWeight.w700,
    );
    return TableCalendar(
      locale: 'ko_KR',
      focusedDay: focusedDay,
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
      calendarStyle: CalendarStyle(
        isTodayHighlighted: false, //  오늘 날짜에 Highlighted 표시 할건지 안할건지 설정
        defaultDecoration: defaultBoxDeco,
        weekendDecoration: defaultBoxDeco,
        selectedDecoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.0),
          border: Border.all(
            color: PRIMARY_COLOR,
            width: 1.0,
          ),
        ),
        outsideDecoration: BoxDecoration(
          shape: BoxShape.rectangle,
        ),
        defaultTextStyle: defaultTextStyle,
        weekendTextStyle: defaultTextStyle,
        selectedTextStyle: defaultTextStyle.copyWith(
          color: PRIMARY_COLOR,
        ),
      ),
      onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
        setState(() {
          this.selectedDay = selectedDay;
          this.focusedDay = selectedDay;
          // 우리가 2/2을 누르면 selectedDay,focusedDay 둘 다 2/2가 됨
          // 근데 우리는 이미 2월을 보고있기 떄문에 캘린더의 변경이 없는거야
          // 근데 우리가 1/31을 누르는 순간 focusedDay가 1/31로 바뀌면서 1월을 바라보게 되는거야
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
