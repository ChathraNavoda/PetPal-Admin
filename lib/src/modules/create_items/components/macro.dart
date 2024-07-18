import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyMacro extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final TextEditingController controller;

  const MyMacro(
      {super.key,
      required this.title,
      required this.value,
      required this.icon,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              offset: const Offset(2, 2),
              blurRadius: 5,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              FaIcon(
                icon,
                color: const Color(0xFFD97946),
              ),
              const SizedBox(height: 4),
              TextField(
                controller: controller,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12),
                decoration: InputDecoration(
                  isDense: true,
                  suffixText: title == "Weight"
                      ? "g"
                      : title == "Width"
                          ? "cm"
                          : title == "Length"
                              ? "cm"
                              : "",
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                title,
                style: const TextStyle(fontSize: 10),
              )
            ],
          ),
        ),
      ),
    );
  }
}
