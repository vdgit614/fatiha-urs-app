import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen()));
}

// एक ही Shape - पूरा Card नोकदार + चौड़ा
class WholeCardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    Path path = Path();
    
    // ऊपर की नोक
    path.moveTo(w / 2, 0);
    // Right Dome Curve - बाहर निकला हुआ
    path.cubicTo(w * 0.60, h * 0.08, w * 0.98, h * 0.18, w * 0.92, h * 0.34);
    // कंधे पर अंदर की तरफ
    path.lineTo(w * 0.78, h * 0.34);
    // नीचे तक सीधा - गोल कोने के लिए थोड़ा ऊपर
    path.lineTo(w * 0.78, h - 28);
    path.quadraticBezierTo(w * 0.78, h, w * 0.50, h);
    path.quadraticBezierTo(w * 0.22, h, w * 0.22, h - 28);
    path.lineTo(w * 0.22, h * 0.34);
    path.lineTo(w * 0.08, h * 0.34);
    path.cubicTo(w * 0.02, h * 0.18, w * 0.40, h * 0.08, w / 2, 0);
    path.close();
    return path;
  }
  @override bool shouldReclip(covariant CustomClipper<Path> old) => false;
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDF5ED),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(top: 15),
                child: Center(
                  child: Container(
                    width: 330, // चौड़ाई बढ़ा दी
                    height: 560,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        // बाहर हरी Border - मोटी
                        ClipPath(
                          clipper: WholeCardClipper(),
                          child: Container(width: 330, height: 560, color: Color(0xFF0F3D1E)),
                        ),
                        // अंदर सफेद - 10px अंदर
                        Positioned(
                          top: 9,
                          child: ClipPath(
                            clipper: WholeCardClipper(),
                            child: Container(
                              width: 312,
                              height: 542,
                              color: Colors.white,
                              child: Column(
                                children: [
                                  SizedBox(height: 65),
                                  Text("JAMADIL AWAL", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Color(0xFF0F3D1E), letterSpacing: 0.5)),
                                  SizedBox(height: 18),
                                  // Islamic Date - अब बीच में, नहीं कटेगा - 30 SP Bold
                                  Text("08 - 05 - 1448", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color(0xFF0F3D1E))),
                                  SizedBox(height: 45),
                                  Text("English Date: 20-10-2026", style: TextStyle(fontSize: 13, color: Colors.grey)),
                                  SizedBox(height: 14),
                                  Container(width: 150, height: 1, color: Color(0xFFB8D8B8)),
                                  SizedBox(height: 18),
                                  Text("NAMAZ TIME RANGE", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF0F3D1E))),
                                  SizedBox(height: 18),
                                  namazRow("Fajr", "05:00 — 06:30"),
                                  namazRow("Zuhr", "12:30 — 15:15"),
                                  namazRow("Asr", "15:15 — 17:50"),
                                  namazRow("Maghrib", "18:35 — 19:40"),
                                  namazRow("Isha", "19:40 — 04:59"),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 5, 20, 20),
              child: Row(
                children: [
                  Expanded(child: SizedBox(height: 50, child: ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF0F3D1E), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13))), child: Text("+ Add Fatiha", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white))))),
                  SizedBox(width: 10),
                  Expanded(child: SizedBox(height: 50, child: ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF0F3D1E), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13))), child: Text("+ Add Urs", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white))))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget namazRow(String n, String t) {
    return Padding(padding: EdgeInsets.symmetric(vertical: 7), child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [Text(n, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0F3D1E))), SizedBox(width: 10), Text(t, style: TextStyle(fontSize: 18, color: Color(0xFF0F3D1E)))]));
  }
}
