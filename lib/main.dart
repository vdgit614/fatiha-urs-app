import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen()));
}

class OnePieceClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    double r = 24;
    Path path = Path();
    path.moveTo(w / 2, 0);
    path.cubicTo(w * 0.68, h * 0.06, w * 0.88, h * 0.12, w * 0.78, h * 0.36);
    path.lineTo(w * 0.86, h * 0.36);
    path.lineTo(w * 0.86, h * 0.43);
    path.lineTo(w * 0.76, h * 0.43);
    path.lineTo(w * 0.76, h - r);
    path.quadraticBezierTo(w * 0.76, h, w * 0.76 - r, h);
    path.lineTo(w * 0.24 + r, h);
    path.quadraticBezierTo(w * 0.24, h, w * 0.24, h - r);
    path.lineTo(w * 0.24, h * 0.43);
    path.lineTo(w * 0.14, h * 0.43);
    path.lineTo(w * 0.14, h * 0.36);
    path.lineTo(w * 0.22, h * 0.36);
    path.cubicTo(w * 0.12, h * 0.12, w * 0.32, h * 0.06, w / 2, 0);
    path.close();
    return path;
  }
  @override bool shouldReclip(covariant CustomClipper<Path> old) => false;
}

class OnePiecePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double w = size.width;
    double h = size.height;
    double r = 24;
    Path path = Path();
    path.moveTo(w / 2, 0);
    path.cubicTo(w * 0.68, h * 0.06, w * 0.88, h * 0.12, w * 0.78, h * 0.36);
    path.lineTo(w * 0.86, h * 0.36);
    path.lineTo(w * 0.86, h * 0.43);
    path.lineTo(w * 0.76, h * 0.43);
    path.lineTo(w * 0.76, h - r);
    path.quadraticBezierTo(w * 0.76, h, w * 0.76 - r, h);
    path.lineTo(w * 0.24 + r, h);
    path.quadraticBezierTo(w * 0.24, h, w * 0.24, h - r);
    path.lineTo(w * 0.24, h * 0.43);
    path.lineTo(w * 0.14, h * 0.43);
    path.lineTo(w * 0.14, h * 0.36);
    path.lineTo(w * 0.22, h * 0.36);
    path.cubicTo(w * 0.12, h * 0.12, w * 0.32, h * 0.06, w / 2, 0);
    path.close();
    Paint fill = Paint()..color = Colors.white..style = PaintingStyle.fill;
    Paint border = Paint()..color = Color(0xFF134E27)..style = PaintingStyle.stroke..strokeWidth = 12..strokeJoin = StrokeJoin.round;
    canvas.drawPath(path, fill);
    canvas.drawPath(path, border);
  }
  @override bool shouldRepaint(covariant CustomPainter old) => false;
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F6F0),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 18),
                    child: CustomPaint(
                      painter: OnePiecePainter(),
                      child: ClipPath(
                        clipper: OnePieceClipper(),
                        child: Container(
                          width: 330,
                          height: 600,
                          child: Column(
                            children: [
                              SizedBox(height: 85),
                              Text("JAMADIL AWAL", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xFF134E27))),
                              SizedBox(height: 36),
                              Text("08 - 05 - 1448", style: TextStyle(fontSize: 34, fontWeight: FontWeight.w900, color: Color(0xFF134E27))),
                              SizedBox(height: 72),
                              Text("English Date: 20-10-2026", style: TextStyle(fontSize: 12, color: Color(0xFF8A8A8A))),
                              SizedBox(height: 18),
                              Container(width: 180, height: 1, color: Color(0xFFB8D0B8)),
                              SizedBox(height: 20),
                              Text("NAMAZ TIME RANGE", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: Color(0xFF134E27))),
                              SizedBox(height: 22),
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
            // 2 अलग-अलग बटन - Add Fatiha + Add Urs
            Padding(
              padding: EdgeInsets.fromLTRB(20, 5, 20, 20),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF134E27),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
                          elevation: 4,
                        ),
                        child: Text("+ Add Fatiha", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white)),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: SizedBox(
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF134E27),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
                          elevation: 4,
                        ),
                        child: Text("+ Add Urs", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white)),
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
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(n, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF134E27))),
          SizedBox(width: 10),
          Text(t, style: TextStyle(fontSize: 18, color: Color(0xFF134E27))),
        ],
      ),
    );
  }
}
