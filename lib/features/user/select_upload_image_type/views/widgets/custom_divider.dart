import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Divider(thickness: 1, color: Colors.grey.shade300));
  }
}
