import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:math';

import 'package:hexcolor/hexcolor.dart';

class Grafo extends StatelessWidget {
  const Grafo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
          child: Scaffold(
              backgroundColor: Colors.white,
              body: Container(
                height: 300,
                width: 300,
                child: Center(
                  child: CustomPaint(
                    size: Size(
                      300,
                      300,
                    ),
                    willChange: false,
                    isComplex: false,
                    painter: MyPainter(),
                  ),
                ),
              ))),
    );
  }
}

class MyPainter extends CustomPainter {
  //         <-- CustomPainter class
  List node = [
    {"id": "(838) 822-3152"},
    {"id": "(507)127-5742x82681"},
    {"id": "790-193-7788"},
    {"id": "8071863828"},
    {"id": "377-382-9014"},
    {"id": "(832)899-5296x5232"},
    {"id": "765-748-5285"},
    {"id": "(657)324-0617x53594"},
    {"id": "174-032-5438x2964"},
    {"infected": true, "id": "(795)831-0785"},
    {"id": "(496)782-6697"},
    {"id": "001-795-860-3430"},
    {"id": "4219415506"},
    {"id": "995.788.5260x28477"},
    {"id": "472.010.3963x1521"},
    {"id": "001-879-125-7247"},
    {"id": "906-188-5942x04580"},
    {"id": "(747)518-1764"},
    {"id": "+1-129-530-5650x28684"}
  ];
  List links = [
    {"weight": 3, "source": "(838) 822-3152", "target": "(507)127-5742x82681"},
    {"weight": 3, "source": "(838) 822-3152", "target": "(795)831-0785"},
    {"weight": 3, "source": "(838) 822-3152", "target": "(496)782-6697"},
    {"weight": 1, "source": "(507)127-5742x82681", "target": "790-193-7788"},
    {"weight": 3, "source": "(507)127-5742x82681", "target": "8071863828"},
    {"weight": 3, "source": "(507)127-5742x82681", "target": "377-382-9014"},
    {
      "weight": 2,
      "source": "(507)127-5742x82681",
      "target": "+1-129-530-5650x28684"
    },
    {"weight": 1, "source": "8071863828", "target": "(832)899-5296x5232"},
    {"weight": 1, "source": "8071863828", "target": "765-748-5285"},
    {"weight": 1, "source": "8071863828", "target": "(657)324-0617x53594"},
    {"weight": 1, "source": "8071863828", "target": "174-032-5438x2964"},
    {"weight": 3, "source": "8071863828", "target": "001-795-860-3430"},
    {"weight": 1, "source": "8071863828", "target": "4219415506"},
    {
      "weight": 1,
      "source": "174-032-5438x2964",
      "target": "995.788.5260x28477"
    },
    {"weight": 3, "source": "174-032-5438x2964", "target": "472.010.3963x1521"},
    {"weight": 1, "source": "174-032-5438x2964", "target": "001-879-125-7247"},
    {"weight": 1, "source": "174-032-5438x2964", "target": "(747)518-1764"},
    {"weight": 3, "source": "4219415506", "target": "906-188-5942x04580"}
  ];
  Map<String, Offset> mapaSource = Map();
   List<Offset> points = List();
  @override
  void paint(Canvas canvas, Size size) {
    Random random = new Random();
    final pointMode = ui.PointMode.points;
   
    if (mapaSource.isEmpty) {
      for (var i = 0; i < node.length; i++) {
        Offset offset = Offset(random.nextDouble() * (size.height - 10) + 10,
            random.nextDouble() * (size.width - 50) + 50);
        points.add(offset);
        mapaSource[node[i]['id']] = offset;
      }
    }

   

    links.forEach((element) {
      var paint2 = Paint()
        ..color = HexColor('#698596')
        ..strokeWidth = 3
        ..strokeCap = StrokeCap.round;
      canvas.drawLine(
          mapaSource[element['source']], mapaSource[element['target']], paint2);
    });
     final paint = Paint()
      ..color = HexColor('#103E68')
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;
    canvas.drawPoints(pointMode, points, paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
