import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cboo_mobile_app/user/account-menu.dart';
import 'package:cboo_mobile_app/home_page.dart';

class NavBar extends StatelessWidget {
  final int pageIndex;
  final Function(int) onTap;
  final UserData userData; // Specify the type as UserData

  const NavBar({
    Key? key,
    required this.pageIndex,
    required this.onTap,
    required this.userData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BottomAppBar(
        elevation: 0.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 60,
            color: Color.fromARGB(255, 245, 242, 242),
            child: Row(
              children: [
                navItem(
                  Icons.home,
                  'Home',
                  isSelected: pageIndex == 0,
                  onTap: () => onTap(0),
                ),
                navItem(
                  Icons.newspaper,
                  'News',
                  isSelected: pageIndex == 1,
                  onTap: () => onTap(1),
                ),
                const SizedBox(width: 80),
                navItem(
                  Icons.article,
                  'History',
                  isSelected: pageIndex == 2,
                  onTap: () => onTap(2),
                ),
                navItem(
                  Icons.apps_rounded,
                  'Account',
                  isSelected: pageIndex == 3,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AccountMenuPage(
                          userName: userData.name,
                          userEmail: userData.email,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget navItem(IconData icon, String label,
      {required bool isSelected, Function()? onTap}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected
                  ? Color.fromARGB(255, 10, 29, 117)
                  : const Color.fromARGB(255, 44, 44, 44),
            ),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.black : Colors.black,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
