import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen()));
}

// ONE PIECE PAINTER - एक ही Piece में पूरा गुंबद + Rectangle
class OnePieceDomePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double w = size.width;
    double h = size.height;
    double r = 20;

    Paint borderPaint = Paint()
      ..color = Color(0xFF124725)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeJoin = StrokeJoin.round;

    Paint fillPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(w / 2, 0); // नोक

    // Right Dome
    path.cubicTo(w * 0.62, h * 0.08, w * 0.98, h * 0.14, w * 0.90, h * 0.36);
    path.lineTo(w * 0.90, h * 0.38);
    path.lineTo(w * 0.76, h * 0.38);
    path.lineTo(w * 0.76, h - r);
    path.quadraticBezierTo(w * 0.76, h, w * 0.76 - r, h);
    path.lineTo(w * 0.24 + r, h);
    path.quadraticBezierTo(w * 0.24, h, w * 0.24, h - r);
    path.lineTo(w * 0.24, h * 0.38);
    path.lineTo(w * 0.10, h * 0.38);
    path.lineTo(w * 0.10, h * 0.36);
    path.cubicTo(w * 0.02, h * 0.14, w * 0.38, h * 0.08, w / 2, 0);
    path.close();

    canvas.drawPath(path, fillPaint);
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F6F1),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: CustomPaint(
                      painter: OnePieceDomePainter(),
                      child: Container(
                        width: 320,
                        height: 590,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            SizedBox(height: 88),
                            Text("JAMADIL AWAL", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Color(0xFF124725))),
                            SizedBox(height: 28),
                            Text("08 - 05 - 1448", style: TextStyle(fontSize: 31, fontWeight: FontWeight.w900, color: Color(0xFF124725))),
                            SizedBox(height: 60),
                            Text("English Date: 20-10-2026", style: TextStyle(fontSize: 13, color: Colors.grey)),
                            SizedBox(height: 16),
                            Container(width: 170, height: 1, color: Color(0xFFB8D8B8)),
                            SizedBox(height: 20),
                            Text("NAMAZ TIME RANGE", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF124725), letterSpacing: 0.5)),
                            SizedBox(height: 20),
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
            Padding(
              padding: EdgeInsets.fromLTRB(28, 5, 28, 20),
              child: SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF124725),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                  child: Text("+ Add Fatiha", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _row(String n, String t) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(n, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF124725))),
          SizedBox(width: 10),
          Text(t, style: TextStyle(fontSize: 18, color: Color(0xFF124725))),
        ],
      ),
    );
  }
}
