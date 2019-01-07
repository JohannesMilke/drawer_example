import 'package:flutter/material.dart';
import 'package:january3_drawer/widget/drawer_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String appTitle = 'Drawer';
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: appTitle,
        theme: ThemeData(
          primaryColor: Colors.red,
          textTheme: TextTheme(
            subhead: TextStyle(
              color: Colors.black.withOpacity(0.4),
            ),
          ),
          dividerColor: Colors.black.withOpacity(0.4),
        ),
        home: MainPage(appTitle: appTitle),
      );
}

class MainPage extends StatefulWidget {
  final String appTitle;

  const MainPage({this.appTitle});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.appTitle),
        ),
        drawer: DrawerWidget(),
        body: Container(),
      );
}
