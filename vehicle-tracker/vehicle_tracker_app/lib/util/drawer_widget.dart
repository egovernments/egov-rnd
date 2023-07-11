import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // ! USE SCROLLABLE CONTETNT
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text(
                    "Vehicle Tracker App",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
                ListTile(
                  title: const Text("Home"),
                  onTap: () {
                    // Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text("About"),
                  onTap: () {
                    // Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          const Spacer(),
          const PoweredByDigit()
        ],
      ),
    );
  }
}
