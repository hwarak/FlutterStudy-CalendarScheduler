import 'package:calendar_schedular/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  // 초기화가 되었는지 확이하라.
  // 플러터 프레임워크가 준비 될 때까지 기다릴 수 있다
  WidgetsFlutterBinding.ensureInitialized();
  // intl패키지 안에 있는 모든 언어를 사용할 수 있게 됨 (특히 날짜와 관련된것들)
  await initializeDateFormatting();
  runApp(
    MaterialApp(
      theme: ThemeData(fontFamily: 'NotoSanse'),
      home: HomeScreen(),
    ),
  );
}
