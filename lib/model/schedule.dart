import 'package:drift/drift.dart';

class Schedules extends Table {
  // 테이블 이름을 넣어주자

  // PRIMARY KEY
  IntColumn get id => integer().autoIncrement()();

  // 내용
  TextColumn get content => text()();

  // 일정 날짜
  DateTimeColumn get date => dateTime()();

  // 시작 시간
  IntColumn get startTime => integer()();

  // 끝 시간
  IntColumn get endTime => integer()();

  // Category Color Table ID
  IntColumn get colorId => integer()();

  // 생성 날짜, 각각의 row가 생성되는 날짜
  DateTimeColumn get createdDate => dateTime().clientDefault(
        () => DateTime.now(), // 어떤 값을 리턴해줄건지 써줌
      )();
}
