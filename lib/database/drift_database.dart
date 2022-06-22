import 'dart:io';

import 'package:calendar_schedular/model/category_color.dart';
import 'package:calendar_schedular/model/schedule.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'drift_database.g.dart';

@DriftDatabase(
  tables: [
    // 생성해놓은 테이블을 import 해주자
    // 대신 불러올땐 인스턴스처럼 불러오지 말고 타입선언하듯이! () 없이 가져와야함.
    // drift한테 우리 이거 테이블로 쓸거야 ~ 하고 알려주는거야
    Schedules,
    CategoryColors,
  ],
)
class LocalDatabase extends _$LocalDatabase {
  LocalDatabase() : super(_openConnection());

  // into(테이블이름).insert(insert할 데이터)
  // Future<int> : insert를 하면 자동으로 id값(primary key 값)을 리턴 받을 수 있음!
  Future<int> createSchedule(SchedulesCompanion data) =>
      into(schedules).insert(data);

  Future<int> createCategoryColor(CategoryColorsCompanion data) =>
      into(categoryColors).insert(data);

  Future<List<CategoryColor>> getCategoryColors() =>
      select(categoryColors).get();

  @override
  // 데이터베이스에 설정한 테이블들의 상태 버전임
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  // 실제 우리가 데이터베이스 파일을 어떤 위치에 생성시킬건지 설정
  // sql은 보조기억장치에다 저장을하는데 연결을 해줌
  // 보조기억장치, 즉 하드드라이브에(HDD) 어떤 위치에 저장할건지 정해주자
  return LazyDatabase(() async {
    // 데이터베이스를 저장할 폴더 dbFolder
    // 일반적으로 앱을 설치하게되면 OS에서 하드드라이브에
    // 앱별로 각각 사용할 수 있는 위치를 지정해줌
    // 배정받은 위치를 가져올 수 있는 방법 : getApplicationDocumentsDirectory()
    final dbFolder = await getApplicationDocumentsDirectory();
    // 이제 이 폴더 위치에 데이터베이스 정보를 저장하면 된다.
    // 이제 이 위치에 데이터베이스 정보를 저장할 파일을 만들어줘야한다.
    final file = File(p.join(dbFolder.path, 'db.sqlite')); // import 'dart:io';
    // p.join : 경로
    // dbFolder.path 앱에 배정된 위치 경로 + 'db.sqlite'
    return NativeDatabase(file); // 데이터 베이스 생성 끝
  });
}
