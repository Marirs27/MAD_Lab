import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.indigo,
    ),
    home: const Shapes(),
  ));
}

class Shapes extends StatelessWidget {
  const Shapes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shapes'),
        centerTitle: true,
      ),
      body: CustomPaint(
        painter: DrawGrapes(),
        child: Container(
          height: 700.0,
        ),
      ),
    );
  }
}

class DrawGrapes extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = Colors.black;
    canvas.drawRect(const Offset(0,0) & const Size(415,605), paint);
    paint.color = Colors.green;
    canvas.drawRect(const Offset(125,90) & const Size(160,30), paint);
    paint.color = Colors.green;
    canvas.drawRect(const Offset(190,90) & const Size(30,160), paint);
    paint.color = Colors.black;
    canvas.drawCircle(const Offset(205,390), 53.0, paint);
    paint.color = Colors.purple;
    canvas.drawCircle(const Offset(205,390), 50.0, paint);
    paint.color = Colors.black;
    canvas.drawCircle(const Offset(240,330), 53.0, paint);
    paint.color = Colors.purple;
    canvas.drawCircle(const Offset(240,330), 50.0, paint);
    paint.color = Colors.black;
    canvas.drawCircle(const Offset(170,330), 53.0, paint);
    paint.color = Colors.purple;
    canvas.drawCircle(const Offset(170,330), 50.0, paint);
    paint.color = Colors.black;
    canvas.drawCircle(const Offset(205,330), 53.0, paint);
    paint.color = Colors.purple;
    canvas.drawCircle(const Offset(205,330), 50.0, paint);
    paint.color = Colors.black;
    canvas.drawCircle(const Offset(130,270), 53.0, paint);
    paint.color = Colors.purple;
    canvas.drawCircle(const Offset(130,270), 50.0, paint);
    paint.color = Colors.black;
    canvas.drawCircle(const Offset(270,270), 53.0, paint);
    paint.color = Colors.purple;
    canvas.drawCircle(const Offset(270,270), 50.0, paint);
    paint.color = Colors.black;
    canvas.drawCircle(const Offset(190,270), 53.0, paint);
    paint.color = Colors.purple;
    canvas.drawCircle(const Offset(190,270), 50.0, paint);
    paint.color = Colors.black;
    canvas.drawCircle(const Offset(220,270), 53.0, paint);
    paint.color = Colors.purple;
    canvas.drawCircle(const Offset(220,270), 50.0, paint);
    paint.color = Colors.black;
    canvas.drawCircle(const Offset(100,200), 53.0, paint);
    paint.color = Colors.purple;
    canvas.drawCircle(const Offset(100,200), 50.0, paint);
    paint.color = Colors.black;
    canvas.drawCircle(const Offset(300,200), 53.0, paint);
    paint.color = Colors.purple;
    canvas.drawCircle(const Offset(300,200), 50.0, paint);
    paint.color = Colors.black;
    canvas.drawCircle(const Offset(140,200), 53.0, paint);
    paint.color = Colors.purple;
    canvas.drawCircle(const Offset(140,200), 50.0, paint);
    paint.color = Colors.black;
    canvas.drawCircle(const Offset(260,200), 53.0, paint);
    paint.color = Colors.purple;
    canvas.drawCircle(const Offset(260,200), 50.0, paint);
    paint.color = Colors.black;
    canvas.drawCircle(const Offset(200,200), 53.0, paint);
    paint.color = Colors.purple;
    canvas.drawCircle(const Offset(200,200), 50.0, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }

}
