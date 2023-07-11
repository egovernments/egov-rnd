import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

class InboxHeaderWidget extends StatelessWidget {
  const InboxHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Home / FSM / Inbox"),
          const Text("INBOX", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DigitIconButton(
                icon: Icons.search,
                onPressed: () => searchDialogBox(context),
                iconText: "Search",
                iconColor: Colors.orange[700],
                iconTextColor: Colors.orange[700],
              ),
              DigitIconButton(
                icon: Icons.sort,
                onPressed: () => filterDialogBox(context),
                iconText: "Filter",
                iconColor: Colors.orange[700],
                iconTextColor: Colors.orange[700],
              ),
              DigitIconButton(
                icon: Icons.sort,
                onPressed: () {},
                iconText: "Sort",
                iconColor: Colors.orange[700],
                iconTextColor: Colors.orange[700],
              ),
            ],
          )
        ],
      ),
    );
  }
}

searchDialogBox(context) => DigitActionDialog.show(
      context,
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Search By", style: TextStyle(fontSize: 20)),
          const DigitTextField(
            label: "Application No.",
          ),
          const DigitTextField(
            label: "Mobile No.",
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(child: const Text("CLEAR SEARCH"), onPressed: () {}),
              ElevatedButton(child: const Text("SEARCH"), onPressed: () {}),
            ],
          )
        ],
      ),
    );

filterDialogBox(context) => DigitActionDialog.show(
      context,
      widget: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Filter By", style: TextStyle(fontSize: 20)),
          SizedBox(height: 10),
          Text("Locality"),
          SizedBox(height: 20),
          Text("Status"),
          DigitCheckboxTile(label: "Application Created", value: false),
          DigitCheckboxTile(label: "Pending for DSO Assignment", value: false),
          DigitCheckboxTile(label: "DSO In Progress", value: false),
          DigitCheckboxTile(label: "Pending for Payment", value: false),
          // DigitDropdown(value: value, label: label, menuItems: menuItems, valueMapper: valueMapper)
        ],
      ),
    );
