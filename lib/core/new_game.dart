import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import 'package:whack_a_mole/core/settings_function.dart';
import 'package:whack_a_mole/provider/game_provider.dart';
import 'package:whack_a_mole/provider/theme_provider.dart';

class NewGameActivity extends StatefulWidget {
  NewGameActivity({Key? key, Color? color}) : super(key: key);
  Color color = Colors.red;

  @override
  State<NewGameActivity> createState() => _NewGameActivity(color: color);
}

class _NewGameActivity extends State<NewGameActivity> {
  _NewGameActivity({required this.color});
  Color color = Colors.black;
  int score = 0;

  void checkData(int index) {
    bool data = Provider.of<GameProvider>(context, listen: false).checkData(index);
    print(data);
  }

  @override
  void initState() {
    Provider.of<GameProvider>(context, listen: false).generateRandom();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ThemeProvider()), ChangeNotifierProvider(create: (_) => GameProvider())],
      child: Scaffold(
          appBar: AppBar(
            title: Text("Game"),
            backgroundColor: context.watch<ThemeProvider>().mainColor,
          ),
          body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 50),
                    child: Text(
                      "Score : ${(context.watch<GameProvider>().score).toString()}",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      imageData(context.watch<GameProvider>().listData[0], 0, checkData),
                      imageData(context.watch<GameProvider>().listData[1], 1, checkData),
                      imageData(context.watch<GameProvider>().listData[2], 2, checkData)
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      imageData(context.watch<GameProvider>().listData[3], 3, checkData),
                      imageData(context.watch<GameProvider>().listData[4], 4, checkData),
                      imageData(context.watch<GameProvider>().listData[5], 5, checkData)
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      imageData(context.watch<GameProvider>().listData[6], 6, checkData),
                      imageData(context.watch<GameProvider>().listData[7], 7, checkData),
                      imageData(context.watch<GameProvider>().listData[8], 8, checkData)
                    ],
                  ),
                ],
              ))),
    );
  }

  Widget imageData(bool imageBool, int index, Function someFunction) {
    return imageBool == true
        ? GestureDetector(
            onTap: () {
              someFunction(index);
            },
            child: Container(
              margin: EdgeInsets.all(20),
              child: Image.asset('lib/assets/mole.png'),
              height: 60,
              width: 60,
            ),
          )
        : GestureDetector(
            onTap: () {
              someFunction(index);
            },
            child: Container(
              margin: EdgeInsets.all(20),
              child: Image.asset('lib/assets/hole.png'),
              height: 60,
              width: 60,
            ));
  }
}
