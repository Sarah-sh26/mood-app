import 'package:flutter/material.dart';

class MoodDropdownWidget extends StatefulWidget {
  const MoodDropdownWidget({required this.updateMood, super.key});

  final Function(String) updateMood;

  @override
  State<MoodDropdownWidget> createState() => _MoodDropdownWidgetState();
}

class _MoodDropdownWidgetState extends State<MoodDropdownWidget> {
  String selectedMood = "Happy";

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedMood,
      isExpanded: true,
      underline: Container(),
      items: const [
        DropdownMenuItem(value: "Happy", child: Text("Happy")),
        DropdownMenuItem(value: "Sad", child: Text("Sad")),
        DropdownMenuItem(value: "Stressed", child: Text("Stressed")),
        DropdownMenuItem(value: "Bored", child: Text("Bored")),
        DropdownMenuItem(value: "Tired", child: Text("Tired")),
      ],
      onChanged: (value) {
        setState(() => selectedMood = value!);
        widget.updateMood(value!);
      },
    );
  }
}
