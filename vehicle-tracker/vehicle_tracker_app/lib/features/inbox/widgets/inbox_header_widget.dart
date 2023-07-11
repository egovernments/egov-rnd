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
                onPressed: () => sortDialogBox(context),
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
              DigitElevatedButton(child: const Text("SEARCH"), onPressed: () {}),
            ],
          )
        ],
      ),
    );

filterDialogBox(context) => DigitActionDialog.show(
      context,
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Filter By", style: TextStyle(fontSize: 20)),
          const SizedBox(height: 10),
          const Text("Locality"),
          const SizedBox(height: 20),
          const Text("Status"),
          const DigitCheckboxTile(label: "Application Created", value: false),
          const DigitCheckboxTile(label: "Pending for DSO Assignment", value: false),
          const DigitCheckboxTile(label: "DSO In Progress", value: false),
          const DigitCheckboxTile(label: "Pending for Payment", value: false),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(child: const Text("CLEAR FILTER"), onPressed: () {}),
              DigitElevatedButton(child: const Text("FILTER"), onPressed: () {}),
            ],
          )
          // DigitDropdown(value: value, label: label, menuItems: menuItems, valueMapper: valueMapper)
        ],
      ),
    );

sortDialogBox(context) => DigitActionDialog.show(
      context,
      widget: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Sort By", style: TextStyle(fontSize: 20)),
          RadioListTile(
            title: const Text("Date (Latest First)"),
            value: 1,
            groupValue: 1,
            onChanged: (value) {},
          ),
          RadioListTile(
            title: const Text("Date (Lates Last)"),
            value: 2,
            groupValue: 1,
            onChanged: (value) {},
          ),
        ],
      ),
    );
