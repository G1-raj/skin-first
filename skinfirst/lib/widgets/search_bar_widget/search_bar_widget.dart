import 'package:flutter/material.dart';
import 'package:skinfirst/constants.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        filled: true,
        fillColor: subTheme,
        hintText: "Search..",
        hintStyle: TextStyle(color: appTheme),
        contentPadding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 12.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: subTheme)
        ),
        suffixIcon: Icon(Icons.search_outlined),
        suffixIconColor: appTheme
      ),
    );
  }
}