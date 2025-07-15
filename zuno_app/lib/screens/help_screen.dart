import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Help & Support", style: GoogleFonts.openSans(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black.withOpacity(0.1)),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Icon(LucideIcons.search, size: 16, color: Colors.black.withOpacity(0.3)),
                      SizedBox(width: 5),
                      Text("Search your query here", style: TextStyle(color: Colors.black.withOpacity(0.3))),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black.withOpacity(0.1)),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Icon(LucideIcons.messagesSquare),
                      SizedBox(width: 10),
                      Text("Chat with us", style: GoogleFonts.openSans(fontSize: 15, fontWeight: FontWeight.bold)),
                      Spacer(flex: 1),
                      Icon(Icons.arrow_forward_ios, size: 15),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
              Text("Help By Category", style: GoogleFonts.openSans(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 15),
              //grid categories
              GridView.count(physics: NeverScrollableScrollPhysics(), shrinkWrap: true, primary: false, crossAxisSpacing: 20, mainAxisSpacing: 10, crossAxisCount: 2, childAspectRatio: 1.4, children: <Widget>[buildCustomGridBox("Ride and Fare"), buildCustomGridBox("Account and Zuno Money Related"), buildCustomGridBox("Report misuse"), buildCustomGridBox("Referring Zuno to friends"), buildCustomGridBox("Safety and security"), buildCustomGridBox("Rentals"), buildCustomGridBox("Yulu Coins")]),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildCustomGridBox(String label, [VoidCallback? onPressed]) {
  return Container(
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black.withOpacity(0.1)),
      borderRadius: BorderRadius.circular(5),
    ),
    child: Align(alignment: Alignment.centerLeft, child: Text(label)),
  );
}
