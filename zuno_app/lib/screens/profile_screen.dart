import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(image: AssetImage("assets/profile_card_background.jpg"), fit: BoxFit.cover),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(12)),
                            padding: const EdgeInsets.all(20.0),
                            child: Icon(LucideIcons.user, color: Colors.white),
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            child: Text("Harsh Kumar", style: GoogleFonts.openSans(fontSize: 24, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),

                    // Positioned Edit Icon
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        decoration: BoxDecoration(color: Colors.white60, borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.all(5.0),
                        child: Icon(LucideIcons.pencil, color: Colors.black54, size: 16),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              MenuTile(icon: LucideIcons.piggyBank, title: "Saver Packs"),
              MenuTile(icon: LucideIcons.history, title: "Ride History"),
              MenuTile(icon: LucideIcons.shoppingCart, title: "Buy Wynn"),
              MenuTile(icon: LucideIcons.tag, title: "Offers"),
              MenuTile(icon: LucideIcons.gift, title: "Refer & Earn"),
              MenuTile(icon: LucideIcons.receipt, title: "Ride Charges"),
              MenuTile(icon: LucideIcons.settings, title: "Settings"),
              MenuTile(icon: LucideIcons.mapPin, title: "Request a Zuno Centre"),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? badge;
  final VoidCallback? onTap;
  final Color? iconColor;
  final Color? backgroundColor;

  const MenuTile({Key? key, required this.icon, required this.title, this.badge, this.onTap, this.iconColor, this.backgroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.black12),

                  child: Icon(icon, size: 24, color: iconColor ?? Colors.grey[600]),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    title,
                    style: GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black87),
                  ),
                ),
                if (badge != null) ...[
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(12)),
                    child: Text(
                      badge!,
                      style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
