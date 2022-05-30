import 'package:flutter/material.dart';

import 'custom_text_field.dart';

class ScheduleBottom extends StatelessWidget {
  const ScheduleBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // viewInsets : 스크린으로 해당되는 부분에서
    // 시스템적인 UI때문에 가려진 만큼의 사이즈를 가져올 수 있다.
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height / 2 + bottomInset,
      child: Padding(
        padding: EdgeInsets.only(bottom: bottomInset),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomTextField(),
                ),
                SizedBox(
                  width: 16.0,
                ),
                Expanded(child: CustomTextField()),
              ],
            ),
            SizedBox(
              height: 16.0,
            ),
            CustomTextField(),
          ],
        ),
      ),
    );
  }
}
