import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}

// ये है Pointed Arch का Shape - ऊपर नोक वाला
class PointedDomeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    Path path = Path();
    path.moveTo(w / 2, 0); // ऊपर की नोक
    // Right Side - बाहर की तरफ गोल
    path.cubicTo(w * 0.65, h * 0.15, w * 0.98, h * 0.35, w * 0.92, h * 0.68);
    path.lineTo(w * 0.78, h * 0.68); // अंदर की तरफ कट
    path.lineTo(w * 0.78, h); // नीचे तक
    path.lineTo(w * 0.22, h); // नीचे की लाइन
    path.lineTo(w * 0.22, h * 0.68); // बायीं तरफ अंदर कट
    // Left Side - बाहर की तरफ गोल
    path.cubicTo(w * 0.08, h * 0.68, w * 0.02, h * 0.35, w * 0.35, h * 0.15);
    path.cubicTo(w * 0.42, h * 0.07, w * 0.5, 0, w / 2, 0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEF6EE),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    // DOME + RECTANGLE - COMBINED
                    Center(
                      child: Container(
                        width: 310,
                        height: 580,
                        child: Stack(
                          children: [
                            // GREEN BORDER - बाहर वाला
                            ClipPath(
                              clipper: PointedDomeClipper(),
                              child: Container(
                                width: 310,
                                height: 220,
                                color: Color(0xFF1A4D2E),
                              ),
                            ),
                            Positioned(
                              top: 160,
                              left: 10,
                              right: 10,
                              child: Container(
                                height: 400,
                                decoration: BoxDecoration(
                                  color: Color(0xFF1A4D2E),
                                  borderRadius: BorderRadius.circular(28),
                                ),
                              ),
                            ),
                            // WHITE INNER - अंदर वाला
                            Positioned(
                              top: 8,
                              left: 8,
                              child: ClipPath(
                                clipper: PointedDomeClipper(),
                                child: Container(
                                  width: 294,
                                  height: 210,
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                      SizedBox(height: 85),
                                      Text("JAMADIL AWAL", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1A4D2E))),
                                      SizedBox(height: 12),
                                      Text("08 - 05 - 1448", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900, color: Color(0xFF1A4D2E), letterSpacing: 0.5)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 168,
                              left: 18,
                              right: 18,
                              child: Container(
                                height: 385,
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(height: 15),
                                    Text("English Date: 20-10-2026", style: TextStyle(fontSize: 13, color: Colors.grey)),
                                    SizedBox(height: 15),
                                    Container(width: 150, height: 1, color: Color(0xFFC8E6C9)),
                                    SizedBox(height: 20),
                                    Text("NAMAZ TIME RANGE", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF1A4D2E))),
                                    SizedBox(height: 22),
                                    namazRow("Fajr", "05:00 — 06:30"),
                                    namazRow("Zuhr", "12:30 — 15:15"),
                                    namazRow("Asr", "15:15 — 17:50"),
                                    namazRow("Maghrib", "18:35 — 19:40"),
                                    namazRow("Isha", "19:40 — 04:59"),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // 2 BUTTONS - एक दूसरे के करीब लेकिन अलग-अलग
            Padding(
              padding: EdgeInsets.fromLTRB(20, 5, 20, 15),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF1A4D2E), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
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
                        style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF1A4D2E), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
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

  Widget namazRow(String name, String time) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1A4D2E))),
          SizedBox(width: 12),
          Text(time, style: TextStyle(fontSize: 18, color: Color(0xFF1A4D2E))),
        ],
      ),
    );
  }
}
