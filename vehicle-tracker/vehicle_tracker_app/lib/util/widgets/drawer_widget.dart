import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DigitElevatedButton(
                      child: const Text("English"),
                      onPressed: () => Get.updateLocale(const Locale('en', 'IN')),
                    ),
                    DigitElevatedButton(
                      child: const Text("हिंदी"),
                      onPressed: () => Get.updateLocale(const Locale('hi', 'IN')),
                    ),
                  ],
                )
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
