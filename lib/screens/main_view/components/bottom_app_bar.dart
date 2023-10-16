import 'package:flutter/material.dart';
import 'custom_button_navigation.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 10,
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            CustomButtonNavigation(
              selectedPageIndex: 0,
              icon: Icons.home,
            ),
            Padding(
              padding: EdgeInsets.only(right: 100),
              child: CustomButtonNavigation(
                selectedPageIndex: 1,
                icon: Icons.favorite,
              ),
            ),
            CustomButtonNavigation(
              selectedPageIndex: 2,
              icon: Icons.notifications,
            ),
            CustomButtonNavigation(
              selectedPageIndex: 3,
              icon: Icons.person,
            ),
          ],
        ),
      ),
    );
  }
}


