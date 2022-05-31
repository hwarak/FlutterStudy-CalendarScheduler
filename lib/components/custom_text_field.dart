import 'package:calendar_schedular/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly, // 말 그대로, 숫자만 쓸 수 있게 해주자.
          ],
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
