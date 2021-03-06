import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  const ClockView({Key? key}) : super(key: key);

  @override
  State<ClockView> createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {

  Timer? timer;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    var timeData = DateTime.now();
    var timeHours = ('${timeData.hour % 12}').padLeft(2, '0');
    var timeMinutes = ('${timeData.minute}').toString().padLeft(2, '0');
    var timeSeconds = ('${timeData.second}').toString().padLeft(2, '0');
    var timePeriod = timeData.hour > 12 ? 'PM' : 'AM';
    var timeMessage = timeHours +
        " : " +
        timeMinutes +
        " : " +
        timeSeconds +
        " " +
        timePeriod;
    return Container(
            alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 50),

      child: Tooltip(
        message: timeMessage,
        child: Transform.rotate(
          angle: -pi / 2,
          child: SizedBox(
            width: 300,
            height: 300,
            child: CustomPaint(
              painter: ClockPainter(),
            ),
          ),
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  DateTime timeData = DateTime.now();

  @override
  void paint(Canvas canvas, Size size) async {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = centerX;

    var clockCirclePaint = Paint()..color = Colors.cyan.shade900;

    var clockOutterStrokeRingPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16;

    var clockCenterDotPaint = Paint()..color = Colors.white;

    var clockSecondsHandPaint = Paint()
      ..shader =
          const RadialGradient(colors: [Colors.amber, Colors.amberAccent])
              .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4;

    var clockMinutesHandPaint = Paint()
      ..shader = const RadialGradient(colors: [Colors.blue, Colors.lightBlue])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 8;

    var clockHoursHandPaint = Paint()
      ..shader =
          RadialGradient(colors: [Colors.pink.shade300, Colors.pink.shade100])
              .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 12;

    // bottom Layer
    canvas.drawCircle(center, radius - 40, clockCirclePaint);
    canvas.drawCircle(center, radius - 40, clockOutterStrokeRingPaint);

    double hourHandX = centerX +
        40 * cos((timeData.hour * 30 + timeData.minute * 0.5) * pi / 180);
    double hourHandY = centerX +
        40 * sin((timeData.hour * 30 + timeData.minute * 0.5) * pi / 180);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), clockHoursHandPaint);

    double minHandX = centerX + 65 * cos(timeData.minute * 6 * pi / 180);
    double minHandY = centerX + 65 * sin(timeData.minute * 6 * pi / 180);
    canvas.drawLine(center, Offset(minHandX, minHandY), clockMinutesHandPaint);

    double secHandX = centerX + 90 * cos(timeData.second * 6 * pi / 180);
    double secHandY = centerX + 90 * sin(timeData.second * 6 * pi / 180);
    canvas.drawLine(center, Offset(secHandX, secHandY), clockSecondsHandPaint);
    // top most
    canvas.drawCircle(center, 15, clockCenterDotPaint);
    // Top Layer

    var outterCircleRadius = radius;
    var innerCircleRadius = radius - 14;
    var dashBrush = Paint()
      ..color = Colors.white
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1;
    for (double i = 0; i < 360; i += 12) {
      var x1 = centerX + innerCircleRadius * cos(i * pi / 180);
      var y1 = centerX + innerCircleRadius * sin(i * pi / 180);

      var x2 = centerX + outterCircleRadius * cos(i * pi / 180);
      var y2 = centerX + outterCircleRadius * sin(i * pi / 180);
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    }
    for (double i = 6; i < 360; i += 12) {
      var x1 = centerX + (innerCircleRadius - 7) * cos(i * pi / 180);
      var y1 = centerX + (innerCircleRadius - 7) * sin(i * pi / 180);

      var x2 = centerX + outterCircleRadius * cos(i * pi / 180);
      var y2 = centerX + outterCircleRadius * sin(i * pi / 180);
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
