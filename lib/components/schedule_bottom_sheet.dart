import 'package:calendar_schedular/constant/colors.dart';
import 'package:flutter/material.dart';

import 'custom_text_field.dart';

class ScheduleBottom extends StatelessWidget {
  const ScheduleBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // viewInsets : 스크린으로 해당되는 부분에서
    // 시스템적인 UI때문에 가려진 만큼의 사이즈를 가져올 수 있다.
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        // 현재 focus가 되어있는 textField에서 focus를 없앨 수 있다.
        // 맨 뒤에 들어가는 FocusNode()에 실제 textField와 연결이 되어있는 focusNode를 넣어주면
        //  해당되는 textField로 focus를 옮길 수 있다.
      },
      child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height / 2 + bottomInset,
        child: Padding(
          padding: EdgeInsets.only(bottom: bottomInset),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
              top: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Time(),
                SizedBox(height: 16.0),
                _Contents(),
                SizedBox(width: 16.0),
                _ColorPicker(),
                SizedBox(width: 16.0),
                _SaveButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Time extends StatelessWidget {
  const _Time({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            label: '시작 시간',
          ),
        ),
        SizedBox(
          width: 16.0,
        ),
        Expanded(
          child: CustomTextField(
            label: '마감 시간',
          ),
        ),
      ],
    );
  }
}

class _Contents extends StatelessWidget {
  const _Contents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      label: '내용',
    );
  }
}

class _ColorPicker extends StatelessWidget {
  const _ColorPicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 10.0,
      children: [
        renderColor(Colors.red),
        renderColor(Colors.orange),
        renderColor(Colors.yellow),
        renderColor(Colors.green),
        renderColor(Colors.blue),
        renderColor(Colors.indigo),
        renderColor(Colors.purple),
      ],
    );
  }

  Widget renderColor(Color color) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      width: 32.0,
      height: 32.0,
    );
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: PRIMARY_COLOR,
            ),
            child: Text('저장'),
          ),
        ),
      ],
    );
  }
}
