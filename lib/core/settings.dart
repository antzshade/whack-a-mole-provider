import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import 'package:whack_a_mole/core/settings_function.dart';
import 'package:whack_a_mole/provider/theme_provider.dart';

// class SettingActivity extends StatefulWidget {
//   const SettingActivity({Key? key}) : super(key: key);

//   @override
//   State<SettingActivity> createState() => _SettingActivityState();
// }

class SettingActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: context.watch<ThemeProvider>().mainColor,
        title: Text("Settings"),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  showColorPicker(context);
                },
                child: Text("Color Application"),
                style: ElevatedButton.styleFrom(primary: context.watch<ThemeProvider>().mainColor),
              )
            ],
          )),
    );
  }
}
