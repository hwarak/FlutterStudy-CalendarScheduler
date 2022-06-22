import 'package:calendar_schedular/constant/colors.dart';
import 'package:flutter/material.dart';

import 'custom_text_field.dart';

class ScheduleBottom extends StatefulWidget {
  const ScheduleBottom({Key? key}) : super(key: key);

  @override
  State<ScheduleBottom> createState() => _ScheduleBottomState();
}

class _ScheduleBottomState extends State<ScheduleBottom> {
  // form의 상태를 갖고있는 GlobalKey
  final GlobalKey<FormState> formKey = GlobalKey();

  int? startTime;
  int? endTime;
  String? content;

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
      child: SafeArea(
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
              child: Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _Time(
                      onStartSaved: (String? val) {
                        startTime = int.parse(val!);
                      },
                      onEndSaved: (String? val) {
                        endTime = int.parse(val!);
                      },
                    ),
                    SizedBox(height: 16.0),
                    _Contents(
                      onSaved: (String? val) {
                        content = val;
                      },
                    ),
                    SizedBox(width: 16.0),
                    _ColorPicker(),
                    SizedBox(width: 16.0),
                    _SaveButton(onPressed: onSavePressed),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onSavePressed() {
    if (formKey.currentState == null) {
      // 현재의 상태가 null이면 return 해줄겁니다
      // formKey는 생성을 했지만 form위젯과 결합을 하지 않은 경우!
      return;
    }

    if (formKey.currentState!.validate()) {
      // 모든 textFormfield들을 검증을 하고,
      // 전부 null이 return이 되면(에러가 없으면) true가 나옵니다.
      print('에러가 없습니다.');
      formKey.currentState!.save();

      print("------------");
      print("startTime: $startTime");
      print("startTime: $endTime");
      print("startTime: $content");
    } else {
      // 어떤 텍스트필드 하나라도
      // string값이 return이 돼서
      // 에러가 있다고 인식을 하게되면 false가 리턴됩니다
      print('에러가 있습니다.');
    }
  }
}

class _Time extends StatelessWidget {
  final FormFieldSetter<String> onStartSaved;
  final FormFieldSetter<String> onEndSaved;

  const _Time({Key? key, required this.onStartSaved, required this.onEndSaved})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            label: '시작 시간',
            isTime: true,
            onSaved: onStartSaved,
          ),
        ),
        SizedBox(
          width: 16.0,
        ),
        Expanded(
          child: CustomTextField(
            label: '마감 시간',
            isTime: true,
            onSaved: onEndSaved,
          ),
        ),
      ],
    );
  }
}

class _Contents extends StatelessWidget {
  final FormFieldSetter<String> onSaved;
  const _Contents({Key? key, required this.onSaved}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomTextField(
        label: '내용',
        isTime: false,
        onSaved: onSaved,
      ),
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
  final VoidCallback onPressed;
  const _SaveButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onPressed,
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
