import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        border: InputBorder.none, // 텍스트필드 밑에 있는 밑줄 지우기
        filled: true, // 이걸 바꿔줘야지만 색을 변경할 수 있다
        fillColor: Colors.grey[300],
      ),
    );
  }
}
