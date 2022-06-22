import 'package:calendar_schedular/screens/home_screen.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:calendar_schedular/database/drift_database.dart';

const DEFAULT_COLORS = [
  // 빨강
  'F44336',
  // 주황
  'FF9800',
  // 노랑
  'FFEB3B',
  // 초록
  'FCAF50',
  // 파랑
  '2196F3',
  // 남색
  '3F51B5',
  // 보라
  '9C27B0'
];

void main() async {
  // 초기화가 되었는지 확이하라.
  // 플러터 프레임워크가 준비 될 때까지 기다릴 수 있다
  WidgetsFlutterBinding.ensureInitialized();
  // intl패키지 안에 있는 모든 언어를 사용할 수 있게 됨 (특히 날짜와 관련된것들)
  await initializeDateFormatting();

  final database = LocalDatabase();

  final colors = await database.getCategoryColors();
  if (colors.isEmpty) {
    for (String hexCode in DEFAULT_COLORS) {
      await database.createCategoryColor(CategoryColorsCompanion(
        hexCode: Value(hexCode),
      ));
    }
  }

  runApp(
    MaterialApp(
      theme: ThemeData(fontFamily: 'NotoSanse'),
      home: HomeScreen(),
    ),
  );
}
