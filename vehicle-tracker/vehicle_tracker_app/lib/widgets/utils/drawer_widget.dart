import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../router/routes.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = DigitTheme.instance;

    return Drawer(
      child: ScrollableContent(
        header: Container(
          color: DigitTheme.instance.colors.cloudGray,
          padding: theme.buttonPadding,
          child: Padding(
            padding: theme.buttonPadding,
            child: Column(
              children: [
                Text("--- Name ---", style: Theme.of(context).textTheme.displayMedium),
                Text("--- Phone ---", style: Theme.of(context).textTheme.headlineLarge),
              ],
            ),
          ),
        ),
        footer: Padding(
          padding: theme.buttonPadding,
          child: const PoweredByDigit(),
        ),
        children: [
          DigitIconTile(
            title: "Home",
            onPressed: () {},
            icon: Icons.home,
          ),
          DigitIconTile(
            title: "Language",
            onPressed: () {},
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DigitElevatedButton(child: const Text("Hindi"), onPressed: () {}),
                DigitOutLineButton(label: "English", onPressed: () {}),
              ],
            ),
            icon: Icons.language,
          ),
          DigitIconTile(
            title: "Org Profile",
            onPressed: () {},
            icon: Icons.contact_page,
          ),
          DigitIconTile(
            title: "Logout",
            onPressed: () => Get.offAllNamed(LANG),
            icon: Icons.logout,
          ),
        ],
      ),
    );
  }
}
