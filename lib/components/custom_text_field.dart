import 'package:calendar_schedular/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool isTime; // true-시간, false-내용
  const CustomTextField({
    Key? key,
    required this.label,
    required this.isTime,
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
        if (isTime) renderTextField(),
        if (!isTime) Expanded(child: renderTextField()),
      ],
    );
  }

  Widget renderTextField() {
    return TextField(
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
