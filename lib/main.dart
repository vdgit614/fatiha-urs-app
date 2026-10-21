import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F8F1),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(20, 30, 20, 10),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 20, offset: Offset(0, 10))
                      ],
                    ),
                    child: Column(
                      children: [
                        // DOME TOP PART
                        Container(
                          width: 300,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(top: BorderSide(color: Color(0xFF1B4D2B), width: 8), left: BorderSide(color: Color(0xFF1B4D2B), width: 8), right: BorderSide(color: Color(0xFF1B4D2B), width: 8)),
                            borderRadius: BorderRadius.vertical(top: Radius.elliptical(300, 250)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("JAMADIL AWAL", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1B4D2B), letterSpacing: 0.5)),
                              SizedBox(height: 20),
                              Text("08 - 05 - 1448", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color(0xFF1B4D2B))),
                              SizedBox(height: 30),
                            ],
                          ),
                        ),
                        // RECTANGLE BOTTOM PART
                        Container(
                          width: 300,
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 25),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(left: BorderSide(color: Color(0xFF1B4D2B), width: 8), right: BorderSide(color: Color(0xFF1B4D2B), width: 8), bottom: BorderSide(color: Color(0xFF1B4D2B), width: 8)),
                            borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
                          ),
                          child: Column(
                            children: [
                              Text("English Date: 20-10-2026", style: TextStyle(fontSize: 13, color: Colors.grey)),
                              SizedBox(height: 15),
                              Container(width: 150, height: 1, color: Color(0xFFB8D8B8)),
                              SizedBox(height: 20),
                              Text("NAMAZ TIME RANGE", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF1B4D2B))),
                              SizedBox(height: 20),
                              namazRow("Fajr", "05:00 — 06:30"),
                              namazRow("Zuhr", "12:30 — 15:15"),
                              namazRow("Asr", "15:15 — 17:50"),
                              namazRow("Maghrib", "18:35 — 19:40"),
                              namazRow("Isha", "19:40 — 04:59"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // 2 BUTTONS - CLOSE BUT SEPARATE
            Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF1B4D2B), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                        child: Text("+ Add Fatiha", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white)),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF1B4D2B), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
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
      padding: EdgeInsets.symmetric(vertical: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1B4D2B))),
          SizedBox(width: 12),
          Text(time, style: TextStyle(fontSize: 18, color: Color(0xFF1B4D2B))),
        ],
      ),
    );
  }
}
