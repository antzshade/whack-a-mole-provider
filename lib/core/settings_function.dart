import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import 'package:whack_a_mole/provider/theme_provider.dart';

void showColorPicker(BuildContext context) {
  ThemeProvider themeProvider = Provider.of<ThemeProvider>(context, listen: false);
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      titlePadding: const EdgeInsets.all(0.0),
      contentPadding: const EdgeInsets.all(0.0),
      content: Wrap(
        children: [
          ColorPicker(
            pickerColor: themeProvider.mainColor,
            onColorChanged: (color) => themeProvider.changeThemeColor(color),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Close'),
        )
      ],
    ),
  );
}
