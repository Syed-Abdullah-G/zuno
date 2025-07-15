import 'package:flutter/material.dart';
import 'package:zuno_app/screens/help_screen.dart';
import 'package:zuno_app/screens/profile_screen.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({Key? key, required this.currentIndex, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8, offset: const Offset(0, -2))],
      ),
      child: SafeArea(
        child: Container(
          height: 64,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(icon: Icons.home_outlined, activeIcon: Icons.home, label: "Home", index: 0),
              _buildNavItem(icon: Icons.account_balance_wallet_outlined, activeIcon: Icons.account_balance_wallet, label: "Money", index: 1),
              _buildNavItem(icon: Icons.help_outline, activeIcon: Icons.help, label: "Help", index: 2),
              _buildNavItem(icon: Icons.person_outline, activeIcon: Icons.person, label: "Profile", index: 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({required IconData icon, required IconData activeIcon, required String label, required int index}) {
    final isActive = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(isActive ? activeIcon : icon, size: 24, color: isActive ? Colors.black : Colors.grey[600]),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(fontSize: 12, color: isActive ? Colors.black : Colors.grey[600], fontWeight: isActive ? FontWeight.w600 : FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}

class bottomNavigationScreen extends StatefulWidget {
  @override
  _ExampleScreenState createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<bottomNavigationScreen> {
  int _currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: _buildBody(),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return const Center(child: Text('Home Page'));
      case 1:
        return const Center(child: Text('Money Page'));
      case 2:
        return HelpScreen();
      case 3:
        return ProfileScreen();
      default:
        return const Center(child: Text('Home Page'));
    }
  }
}
