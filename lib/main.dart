import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: CustomMultiChildLayout(
          delegate: _myDelegate(),
          children: [
            LayoutId(
              id: 'top',
              child: Container(width: 50.0, height: 50.0, color: Colors.blue),
            ),
            LayoutId(
              id: 'bottom',
              child: Container(width: 50.0, height: 50.0, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}

class _myDelegate extends MultiChildLayoutDelegate {
  @override
  void performLayout(Size size) {
    if (hasChild('top')) {
      layoutChild('top', BoxConstraints.loose(size));
      positionChild('top', const Offset(0.0, 0.0));
    }

    //final double topHeight = sizeOf('top').height;
    layoutChild(
        'bottom', BoxConstraints.tight(Size(size.width, size.height - 100)));
    positionChild('bottom', const Offset(0.0, 100));
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    return true;
  }
}
