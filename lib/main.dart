import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen()));
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double cardW = MediaQuery.of(context).size.width * 0.90;
    return Scaffold(
      backgroundColor: Color(0xFFF2F7F2),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 10),
                    child: Container(
                      width: cardW,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(color: Color(0xFF134E27), width: 4),
                        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 4))],
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(16, 28, 16, 24),
                        child: Column(
                          children: [
                            // Top Islamic Icon
                            Icon(Icons.mosque, size: 42, color: Color(0xFF134E27)),
                            SizedBox(height: 16),
                            Text("JAMADIL AWAL", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xFF134E27), letterSpacing: 0.5)),
                            SizedBox(height: 20),
                            FittedBox(child: Text("08 - 05 - 1448", style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: Color(0xFF134E27)))),
                            SizedBox(height: 24),
                            Text("English Date: 20-10-2026", style: TextStyle(fontSize: 12, color: Colors.grey)),
                            SizedBox(height: 12),
                            Divider(color: Color(0xFFB8D0B8), thickness: 1, indent: 40, endIndent: 40),
                            SizedBox(height: 12),
                            Text("NAMAZ TIME RANGE", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: Color(0xFF134E27), letterSpacing: 0.6)),
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
            Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 20),
              child: Row(
                children: [
                  Expanded(child: SizedBox(height: 52, child: ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF134E27), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13))), child: Text("+ Add Fatiha", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))))),
                  SizedBox(width: 10),
                  Expanded(child: SizedBox(height: 52, child: ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF134E27), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13))), child: Text("+ Add Urs", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))))),
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
      padding: EdgeInsets.symmetric(vertical: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 82, child: Text(n, textAlign: TextAlign.right, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Color(0xFF134E27)))),
          SizedBox(width: 14),
          SizedBox(width: 136, child: Text(t, textAlign: TextAlign.left, style: TextStyle(fontSize: 17, color: Color(0xFF134E27)))),
        ],
      ),
    );
  }
}
