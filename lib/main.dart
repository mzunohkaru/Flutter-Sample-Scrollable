import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State createState() => _MyHomePageState();
}

class _MyHomePageState extends State {
  List dayKeys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scroll"),
      ),
      body: SingleChildScrollView(
        child: Column(
          // days and in-between widgets
          children: [
            buildFiller(),
            buildFiller(),
            buildDayWidget(day: 'Monday', key: dayKeys[0]),
            buildFiller(),
            // buildFiller(),
            buildDayWidget(day: 'Tuesday', key: dayKeys[1]),
            buildFiller(),
            buildFiller(),
            buildDayWidget(day: 'Wednesday', key: dayKeys[2]),
            buildFiller(),
            buildFiller(),
            buildDayWidget(day: 'Thursday', key: dayKeys[3]),
            buildFiller(),
            buildFiller(),
            buildDayWidget(day: 'Friday', key: dayKeys[4]),
            buildFiller(),
            buildFiller(),
            buildDayWidget(day: 'Saturday', key: dayKeys[5]),
            buildFiller(),
            buildFiller(),
            buildDayWidget(day: 'Sunday', key: dayKeys[6]),
            buildFiller(),
            buildFiller(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: SpeedDial(
        // animatedIcon: AnimatedIcons.menu_close,
        // animatedIconTheme: IconThemeData(size: 22.0),
        // / This is ignored if animatedIcon is non null
        // child: Text("open"),
        // activeChild: Text("close"),
        icon: Icons.add,
        activeIcon: Icons.close,
        spacing: 3,
        mini: false,
        openCloseDial: ValueNotifier<bool>(false),
        childPadding: const EdgeInsets.all(5),
        spaceBetweenChildren: 4,
        buttonSize: const Size(56.0, 56.0),
        label: const Text("Open"),
        activeLabel: const Text("Close"),
        childrenButtonSize: const Size(56.0, 56.0),
        visible: true,
        direction: SpeedDialDirection.up,
        switchLabelPosition: false,
        closeManually: false,
        renderOverlay: true,
        // overlayColor: Colors.black,
        // overlayOpacity: 0.5,
        onOpen: () => debugPrint('OPENING DIAL'),
        onClose: () => debugPrint('DIAL CLOSED'),
        useRotationAnimation: true,
        tooltip: 'Open Speed Dial',
        heroTag: 'speed-dial-hero-tag',
        // foregroundColor: Colors.black,
        // backgroundColor: Colors.white,
        // activeForegroundColor: Colors.red,
        // activeBackgroundColor: Colors.blue,
        elevation: 8.0,
        animationCurve: Curves.elasticInOut,
        isOpenOnStart: false,
        shape: const StadiumBorder(),
        // childMargin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        children: [
          SpeedDialChild(
            child: const Icon(Icons.accessibility),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            label: '1',
            onTap: () => _scrollToDay(0),
          ),
          SpeedDialChild(
            child: const Icon(Icons.brush),
            backgroundColor: Colors.deepOrange,
            foregroundColor: Colors.white,
            label: '2',
            onTap: () => _scrollToDay(1),
          ),
          SpeedDialChild(
            child: const Icon(Icons.margin),
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
            label: '3',
            visible: true,
            onTap: () => _scrollToDay(2),
          ),
          SpeedDialChild(
            child: const Icon(Icons.accessibility),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            label: '4',
            onTap: () => _scrollToDay(3),
          ),
          SpeedDialChild(
            child: const Icon(Icons.brush),
            backgroundColor: Colors.deepOrange,
            foregroundColor: Colors.white,
            label: '5',
            onTap: () => _scrollToDay(4),
          ),
          SpeedDialChild(
            child: const Icon(Icons.margin),
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
            label: '6',
            visible: true,
            onTap: () => _scrollToDay(5),
          ),
          SpeedDialChild(
            child: const Icon(Icons.margin),
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
            label: '7',
            visible: true,
            onTap: () => _scrollToDay(6),
          ),
        ],
      ),
    );
  }

  void _scrollToDay(int day) {
    Scrollable.ensureVisible(dayKeys[day].currentContext!);
  }

  Widget buildDayWidget({required String day, required GlobalKey key}) {
    return ListTile(
      key: key,
      title: Text(day),
      subtitle: Text(
        'This is a widget giving you an overview of the different tasks of $day',
        softWrap: true,
      ),
    );
  }

  Widget buildFiller() {
    return Container(
      color: Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255),
          Random().nextInt(255)),
      width: double.maxFinite,
      height: 200,
    );
  }
}
