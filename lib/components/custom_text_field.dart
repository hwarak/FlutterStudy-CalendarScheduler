import 'package:calendar_schedular/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool isTime; // true-시간, false-내용
  final FormFieldSetter<String> onSaved;
  const CustomTextField({
    Key? key,
    required this.label,
    required this.isTime,
    required this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: PRIMARY_COLOR,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (isTime) renderTextFormField(),
        if (!isTime) Expanded(child: renderTextFormField()),
      ],
    );
  }

  Widget renderTextFormField() {
    return TextFormField(
      onSaved: onSaved,
      validator: (String? val) {
        if (val == null || val.isEmpty) {
          // 만약 value값이 null이거나 비어있다면
          // 값을 입력해달라고 알려주자!
          return '값을 입력해주세요.';
        }

        if (isTime) {
          int time = int.parse(val);
          if (time < 0) return '0 이상의 숫자를 입력해주세요';
          if (time > 24) return '24 이하의 숫자를 입력해주세요';
        } else {}

        return null;
      },
      expands: !isTime, // ==> isTime ? false : true
      cursorColor: Colors.grey,
      maxLines: isTime ? 1 : null,
      keyboardType: isTime ? TextInputType.number : TextInputType.multiline,
      inputFormatters: isTime
          ? [
              FilteringTextInputFormatter.digitsOnly, // 말 그대로, 숫자만 쓸 수 있게 해주자.
            ]
          : [],
      decoration: InputDecoration(
        border: InputBorder.none, // 텍스트필드 밑에 있는 밑줄 지우기
        filled: true, // 이걸 바꿔줘야지만 색을 변경할 수 있다
        fillColor: Colors.grey[300],
      ),
    );
  }
}
