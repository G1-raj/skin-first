import 'package:flutter/material.dart';
import 'package:skinfirst/constants.dart';

class ChipsSelector extends StatefulWidget {
  final List<String> options;
  final Function(String) onSelected;

  const ChipsSelector({super.key, required this.options, required this.onSelected});

  @override
  State<ChipsSelector> createState() => _ChipsSelectorState();
}

class _ChipsSelectorState extends State<ChipsSelector> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      children: widget.options.map((option) {
        return ChoiceChip(
          label: Text(option),
          selected: selectedOption == option,
          onSelected: (bool selected) {
            setState(() {
              selectedOption = selected ? option : null;
            });
            widget.onSelected(option);
          },
          selectedColor: appTheme, // Color for selected chip
          backgroundColor: subTheme, // Color for unselected chips
          labelStyle: TextStyle(
            color: selectedOption == option ? Colors.white : Colors.black,
          ),
        );
      }).toList(),
    );
  }
}
