import 'package:calendar_schedular/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  const CustomTextField({Key? key, required this.label}) : super(key: key);

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
        TextField(
          cursorColor: Colors.grey,
          decoration: InputDecoration(
            border: InputBorder.none, // 텍스트필드 밑에 있는 밑줄 지우기
            filled: true, // 이걸 바꿔줘야지만 색을 변경할 수 있다
            fillColor: Colors.grey[300],
          ),
        ),
      ],
    );
  }
}
