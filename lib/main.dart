import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen()));
}

class FullArchClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    Path path = Path();
    path.moveTo(w / 2, 0);
    path.cubicTo(w * 0.65, h * 0.08, w, h * 0.18, w, h * 0.30);
    path.lineTo(w, h);
    path.lineTo(0, h);
    path.lineTo(0, h * 0.30);
    path.cubicTo(0, h * 0.18, w * 0.35, h * 0.08, w / 2, 0);
    path.close();
    return path;
  }
  @override bool shouldReclip(covariant CustomClipper<Path> old) => false;
}

class FullArchPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double w = size.width;
    double h = size.height;
    Path path = Path();
    path.moveTo(w / 2, 0);
    path.cubicTo(w * 0.65, h * 0.08, w, h * 0.18, w, h * 0.30);
    path.lineTo(w, h);
    path.lineTo(0, h);
    path.lineTo(0, h * 0.30);
    path.cubicTo(0, h * 0.18, w * 0.35, h * 0.08, w / 2, 0);
    path.close();
    canvas.drawShadow(path, Colors.black26, 10, true);
    Paint fill = Paint()..color = Colors.white..style = PaintingStyle.fill;
    Paint border = Paint()..color = Color(0xFF0F4D24)..style = PaintingStyle.stroke..strokeWidth = 12..strokeJoin = StrokeJoin.round;
    canvas.drawPath(path, fill);
    canvas.drawPath(path, border);
  }
  @override bool shouldRepaint(covariant CustomPainter old) => false;
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.of(context).size.width;
    double sh = MediaQuery.of(context).size.height;
    
    return Scaffold(
      backgroundColor: Color(0xFFF2F7F2),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Expanded(
                child: CustomPaint(
                  painter: FullArchPainter(),
                  child: ClipPath(
                    clipper: FullArchClipper(),
                    child: Container(
                      width: sw,
                      height: sh * 0.82,
                      child: Column(
                        children: [
                          SizedBox(height: sh * 0.12),
                          Text("JAMADIL AWAL", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Color(0xFF0F4D24))),
                          SizedBox(height: 14),
                          Text("08 - 05 - 1448", style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: Color(0xFF0F4D24))),
                          SizedBox(height: 28),
                          Text("English Date: 20-10-2026", style: TextStyle(fontSize: 13, color: Colors.grey)),
                          SizedBox(height: 10),
                          Divider(indent: 50, endIndent: 50, thickness: 1, color: Color(0xFF0F4D24)),
                          SizedBox(height: 10),
                          Text("NAMAZ TIME RANGE", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF0F4D24))),
                          SizedBox(height: 20),
                          _row("Fajr", "05:00 — 06:30"),
                          _row("Zuhr", "12:30 — 15:15"),
                          _row("Asr", "15:15 — 17:50"),
                          _row("Maghrib", "18:35 — 19:40"),
                          _row("Isha", "19:40 — 04:59"),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.fromLTRB(12, 0, 12, 22),
                            child: Row(
                              children: [
                                Expanded(child: SizedBox(height: 50, child: ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF0F4D24), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), child: Text("+ Add Fatiha", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))))),
                                SizedBox(width: 10),
                                Expanded(child: SizedBox(height: 50, child: ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: Colors.white, side: BorderSide(color: Color(0xFF0F4D24), width: 2), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), child: Text("+ Add Urs", style: TextStyle(color: Color(0xFF0F4D24), fontWeight: FontWeight.bold))))),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
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
          SizedBox(width: 80, child: Text(n, textAlign: TextAlign.right, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF0F4D24)))),
          SizedBox(width: 12),
          Text(t, style: TextStyle(fontSize: 16, color: Color(0xFF0F4D24))),
        ],
      ),
    );
  }
}
