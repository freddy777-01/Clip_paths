import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Clip Path",
      debugShowCheckedModeBanner: false,
      home: CurvedWidgets(),
    );
  }
}

class CurvedWidgets extends StatefulWidget {
  const CurvedWidgets({super.key});

  @override
  State<CurvedWidgets> createState() => _CurvedWidgets();
}

class _CurvedWidgets extends State<CurvedWidgets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Curves'),
        backgroundColor: Colors.grey,
      ),
      body: curvedContainers(context),
    );
  }

  Widget curvedContainers(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Opacity(
            opacity: 0.5,
            child: ClipPath(
              clipper: WaveClipper(),
              child: Container(
                color: Colors.red[200],
                height: 200,
              ),
            ),
          ),
          ClipPath(
            clipper: WaveClipper(),
            child: Container(
              color: Colors.red[500],
              height: 180,
            ),
          ),
        ],
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, size.height);

    var firstStart = Offset(size.width / 5, size.height);

    var firstEnd = Offset(size.width / 2.25, size.height - 50.0);

    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var secondStart =
        Offset(size.width - (size.width / 3.24), size.height - 105);
    var secondEnd = Offset(size.width, size.height - 10);

    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper clipper) {
    return true;
  }
}
