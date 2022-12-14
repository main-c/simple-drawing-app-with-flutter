import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyWidget(),
    ),
  );
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow[50],
      child: CustomPaint(
        painter: MyCustomPainter(),
      ),
    );
  }
}

class MyCustomPainter extends CustomPainter {
  // Method to draw on the canvas
  @override
  void paint(Canvas canvas, Size size) {
    // 1
    Paint paintMountains = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.brown;

    // 2
    Paint paintSun = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.deepOrangeAccent;
    Path path = Path();
    // 3
    path.moveTo(0, 250);
    path.lineTo(100, 200);
    path.lineTo(150, 150);
    path.lineTo(200, 50);
    path.lineTo(250, 150);
    path.lineTo(300, 200);
    path.lineTo(size.width, 250);
    path.lineTo(0, 250);

    canvas.drawPath(path, paintMountains);
    // 4
    path = Path();
    path.moveTo(100, 100);
    path.addOval(Rect.fromCircle(center: Offset(100, 100), radius: 25));

    // 5
    canvas.drawPath(path, paintSun);
  }

  // Method to decide if repainting is necessary on rebuild
  @override
  bool shouldRepaint(MyCustomPainter delegate) {
    return true;
  }
}
