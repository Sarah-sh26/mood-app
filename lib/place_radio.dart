import 'package:flutter/material.dart';

class PlaceRadioWidget extends StatefulWidget {
  const PlaceRadioWidget({required this.updatePlace, super.key});

  final Function(String) updatePlace;

  @override
  State<PlaceRadioWidget> createState() => _PlaceRadioWidgetState();
}

class _PlaceRadioWidgetState extends State<PlaceRadioWidget> {
  String selectedPlace = "Indoor";

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Radio(
          value: "Indoor",
          groupValue: selectedPlace,
          onChanged: (value) {
            setState(() => selectedPlace = value!);
            widget.updatePlace(value!);
          },
        ),
        const Text("Indoor"),
        const SizedBox(width: 20),
        Radio(
          value: "Outdoor",
          groupValue: selectedPlace,
          onChanged: (value) {
            setState(() => selectedPlace = value!);
            widget.updatePlace(value!);
          },
        ),
        const Text("Outdoor"),
      ],
    );
  }
}

