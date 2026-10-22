import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen()));
}

class CorrectClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    double r = 22;
    Path path = Path();
    path.moveTo(w / 2, 0);
    path.cubicTo(w * 0.70, h * 0.05, w * 0.88, h * 0.12, w * 0.76, h * 0.37);
    path.lineTo(w * 0.86, h * 0.37);
    path.lineTo(w * 0.86, h * 0.45);
    path.lineTo(w * 0.84, h * 0.45);
    path.lineTo(w * 0.84, h - r);
    path.quadraticBezierTo(w * 0.84, h, w * 0.84 - r, h);
    path.lineTo(w * 0.16 + r, h);
    path.quadraticBezierTo(w * 0.16, h, w * 0.16, h - r);
    path.lineTo(w * 0.16, h * 0.45);
    path.lineTo(w * 0.14, h * 0.45);
    path.lineTo(w * 0.14, h * 0.37);
    path.lineTo(w * 0.24, h * 0.37);
    path.cubicTo(w * 0.12, h * 0.12, w * 0.30, h * 0.05, w / 2, 0);
    path.close();
    return path;
  }
  @override bool shouldReclip(covariant CustomClipper<Path> old) => false;
}

class CorrectPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double w = size.width;
    double h = size.height;
    double r = 22;
    Path path = Path();
    path.moveTo(w / 2, 0);
    path.cubicTo(w * 0.70, h * 0.05, w * 0.88, h * 0.12, w * 0.76, h * 0.37);
    path.lineTo(w * 0.86, h * 0.37);
    path.lineTo(w * 0.86, h * 0.45);
    path.lineTo(w * 0.84, h * 0.45);
    path.lineTo(w * 0.84, h - r);
    path.quadraticBezierTo(w * 0.84, h, w * 0.84 - r, h);
    path.lineTo(w * 0.16 + r, h);
    path.quadraticBezierTo(w * 0.16, h, w * 0.16, h - r);
    path.lineTo(w * 0.16, h * 0.45);
    path.lineTo(w * 0.14, h * 0.45);
    path.lineTo(w * 0.14, h * 0.37);
    path.lineTo(w * 0.24, h * 0.37);
    path.cubicTo(w * 0.12, h * 0.12, w * 0.30, h * 0.05, w / 2, 0);
    path.close();

    canvas.drawShadow(path, Colors.black26, 8.0, true);
    Paint fill = Paint()..color = Colors.white..style = PaintingStyle.fill;
    Paint border = Paint()..color = Color(0xFF134E27)..style = PaintingStyle.stroke..strokeWidth = 10..strokeJoin = StrokeJoin.round;
    canvas.drawPath(path, fill);
    canvas.drawPath(path, border);
  }
  @override bool shouldRepaint(covariant CustomPainter old) => false;
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenW = MediaQuery.of(context).size.width;
    double cardW = screenW * 0.90; // स्क्रीन की 90% चौड़ाई
    double cardH = 580;

    return Scaffold(
      backgroundColor: Color(0xFFF2F7F2),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 10),
                    child: CustomPaint(
                      painter: CorrectPainter(),
                      child: ClipPath(
                        clipper: CorrectClipper(),
                        child: Container(
                          width: cardW,
                          height: cardH,
                          child: Column(
                            children: [
                              SizedBox(height: 80),
                              Text("JAMADIL AWAL", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xFF134E27))),
                              SizedBox(height: 28),
                              // FittedBox ताकि 08 - 05 - 1448 कभी न कटे
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 24),
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text("08 - 05 - 1448", style: TextStyle(fontSize: 34, fontWeight: FontWeight.w900, color: Color(0xFF134E27))),
                                ),
                              ),
                              SizedBox(height: 58),
                              Text("English Date: 20-10-2026", style: TextStyle(fontSize: 12, color: Colors.grey)),
                              SizedBox(height: 14),
                              Container(width: 160, height: 1, color: Color(0xFFB8D0B8)),
                              SizedBox(height: 14),
                              Text("NAMAZ TIME RANGE", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: Color(0xFF134E27))),
                              SizedBox(height: 18),
                              _row("Fajr", "05:00 — 06:30"),
                              _row("Zuhr", "12:30 — 15:15"),
                              _row("Asr", "15:15 — 17:50"),
                              _row("Maghrib", "18:35 — 19:40"),
                              _row("Isha", "19:40 — 04:59"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 18),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF134E27), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13))),
                        child: FittedBox(child: Text("+ Add Fatiha", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white))),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: SizedBox(
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF134E27), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13))),
                        child: FittedBox(child: Text("+ Add Urs", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white))),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _row(String n, String t) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 78, child: Text(n, textAlign: TextAlign.right, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Color(0xFF134E27)))),
          SizedBox(width: 12),
          SizedBox(width: 132, child: Text(t, textAlign: TextAlign.left, style: TextStyle(fontSize: 17, color: Color(0xFF134E27)))),
        ],
      ),
    );
  }
}
