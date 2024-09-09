// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onpress;
  final bool isHome;
  const CustomButton({
    super.key,
    required this.text,
    required this.onpress,
    this.isHome = false,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ElevatedButton(
      onPressed: onpress,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(!isHome ? size.width : (size.width) / 5, 50),
        backgroundColor: const Color.fromARGB(255, 255, 234, 78),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, color: Colors.black),
      ),
    );
  }
}
