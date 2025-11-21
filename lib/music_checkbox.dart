
import 'package:flutter/material.dart';

class MusicCheckboxWidget extends StatefulWidget {
  const MusicCheckboxWidget({required this.updateMusic, super.key});

  final Function(bool) updateMusic;

  @override
  State<MusicCheckboxWidget> createState() => _MusicCheckboxWidgetState();
}

class _MusicCheckboxWidgetState extends State<MusicCheckboxWidget> {
  bool addMusic = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Add music"),
        Switch(
          value: addMusic,
          onChanged: (value) {
            setState(() => addMusic = value);
            widget.updateMusic(value);
          },
        )
      ],
    );
  }
}
