import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen()));
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
    path.lineTo(w * 0.78, h * 0.45);
    path.lineTo(w * 0.78, h - r);
    path.quadraticBezierTo(w * 0.78, h, w * 0.78 - r, h);
    path.lineTo(w * 0.22 + r, h);
    path.quadraticBezierTo(w * 0.22, h, w * 0.22, h - r);
    path.lineTo(w * 0.22, h * 0.45);
    path.lineTo(w * 0.14, h * 0.45);
    path.lineTo(w * 0.14, h * 0.37);
    path.lineTo(w * 0.24, h * 0.37);
    path.cubicTo(w * 0.12, h * 0.12, w * 0.30, h * 0.05, w / 2, 0);
    path.close();

    // 1. कार्ड के पीछे शैडो (Shadow) लगाना
    canvas.drawShadow(path, Colors.black45, 10.0, true);

    Paint fill = Paint()..color = Colors.white..style = PaintingStyle.fill;
    Paint border = Paint()
      ..color = Color(0xFF134E27)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 11
      ..strokeJoin = StrokeJoin.round;

    canvas.drawPath(path, fill);
    canvas.drawPath(path, border);
  }
  @override bool shouldRepaint(covariant CustomPainter old) => false;
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F7F2),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 25, bottom: 20),
                    child: CustomPaint(
                      painter: CorrectPainter(),
                      // 2. ClipPath को यहाँ से हटा दिया गया है
                      child: Container(
                        width: 330,
                        height: 600,
                        child: Column(
                          children: [
                            SizedBox(height: 84),
                            Text("JAMADIL AWAL", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xFF134E27))),
                            SizedBox(height: 34),
                            Text("08 - 05 - 1448", style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: Color(0xFF134E27))),
                            SizedBox(height: 70),
                            Text("English Date: 20-10-2026", style: TextStyle(fontSize: 12, color: Colors.grey)),
                            SizedBox(height: 16),
                            Container(width: 180, height: 1, color: Color(0xFFB8D0B8)),
                            SizedBox(height: 18),
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
            // 2 बटन अलग-अलग - Add Fatiha + Add Urs
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
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
                  SizedBox(width: 12),
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

  // 3. अलाइनमेंट को स्क्रीनशॉट जैसा बनाने के लिए SizedBox का उपयोग
  Widget _row(String n, String t) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 80, // नाम (Fajr, Zuhr) के लिए फिक्स्ड चौड़ाई
            child: Text(n, textAlign: TextAlign.right, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF134E27))),
          ),
          SizedBox(width: 16),
          SizedBox(
            width: 140, // समय के लिए फिक्स्ड चौड़ाई
            child: Text(t, textAlign: TextAlign.left, style: TextStyle(fontSize: 18, color: Color(0xFF134E27))),
          ),
        ],
      ),
    );
  }
}
