import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skinfirst/constants.dart';

class SettingsSwitch extends StatefulWidget {
  final String title;
  final bool initialValue;
  final ValueChanged<bool> onChanged;
  const SettingsSwitch({super.key, required this.title, this.initialValue = false, required this.onChanged});

  @override
  State<SettingsSwitch> createState() => _SettingsSwitchState();
}

class _SettingsSwitchState extends State<SettingsSwitch> {

  late bool switchValue;

  @override
  void initState() {
    super.initState();
    switchValue = widget.initialValue;
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.title, style: TextStyle(
            color: Colors.black,
            // fontWeight: FontWeight.bold,
            fontSize: 18
          ),),
          CupertinoSwitch(
            value: switchValue, 
            onChanged: (bool value) {
              setState(() {
                switchValue = value;
              });
              widget.onChanged(value);
            },
            activeTrackColor: subTheme,
            inactiveTrackColor: appTheme,
          )
        ],
      ),
    );
  }
}