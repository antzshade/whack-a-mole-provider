import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:whack_a_mole/core/new_game.dart';
import 'package:whack_a_mole/core/settings.dart';
import 'package:whack_a_mole/provider/game_provider.dart';
import 'package:whack_a_mole/provider/theme_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ThemeProvider()),
    ChangeNotifierProvider(create: (_) => GameProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // primarySwatch: context.watch<ThemeProvider>().mainColor,
          ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Provider Demo',
      theme: ThemeData(
        primarySwatch: context.watch<ThemeProvider>().materialMainColor,
        appBarTheme: AppBarTheme(brightness: Brightness.dark),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Whack A Mole"),
          backgroundColor: context.watch<ThemeProvider>().mainColor,
        ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewGameActivity()),
                    );
                  },
                  child: Text("New Games"),
                  style: ElevatedButton.styleFrom(
                    primary: context.watch<ThemeProvider>().mainColor,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<GameProvider>(context, listen: false).resetData();
                    Fluttertoast.showToast(
                        msg: "Score has been reset",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        textColor: Colors.white,
                        backgroundColor: Provider.of<ThemeProvider>(context, listen: false).getColorOpacity(),
                        fontSize: 16.0);
                  },
                  child: Text("Reset Score"),
                  style: ElevatedButton.styleFrom(
                    primary: context.watch<ThemeProvider>().mainColor,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingActivity()),
                    );
                  },
                  child: Text("Settings"),
                  style: ElevatedButton.styleFrom(primary: context.watch<ThemeProvider>().mainColor),
                )
              ],
            )),
      ),
    );
  }
}

Future<void> _showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('AlertDialog Title'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('This is a demo alert dialog.'),
              Text('Would you like to approve of this message?'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Approve'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
