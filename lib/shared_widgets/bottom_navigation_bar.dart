import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final VoidCallback onHomeTap;
  final VoidCallback onDiagnosisTap;
  final VoidCallback onMyPlantsTap;
  final VoidCallback onProfileTap;
  final VoidCallback onFabTap;
  final int selectedIndex;

  const CustomBottomNavBar({
    Key? key,
    required this.onHomeTap,
    required this.onDiagnosisTap,
    required this.onMyPlantsTap,
    required this.onProfileTap,
    required this.onFabTap,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 25,
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home_outlined, 'Home', 0, onHomeTap),
            _buildNavItem(
              Icons.health_and_safety_outlined,
              'Diagnose',
              1,
              onDiagnosisTap,
            ),
            const SizedBox(width: 48), // khoảng trống cho FAB
            _buildNavItem(
              Icons.local_florist_outlined,
              'My Plants',
              2,
              onMyPlantsTap,
            ),
            _buildNavItem(Icons.person_outline, 'Profile', 3, onProfileTap),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
    IconData icon,
    String label,
    int index,
    VoidCallback onTap,
  ) {
    final bool isSelected = index == selectedIndex;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        width: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 25,
              color: isSelected ? Colors.green : Colors.black,
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                color: isSelected ? Colors.green : Colors.black,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
