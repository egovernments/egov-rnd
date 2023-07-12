import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_tracker_app/features/inbox/controllers/header_controllers.dart';

class InboxHeaderWidget extends StatelessWidget {
  const InboxHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HeaderControllers headerControllers = Get.find<HeaderControllers>();

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
                onPressed: () => searchDialogBox(context, headerControllers),
                iconText: "Search",
                iconColor: Colors.orange[700],
                iconTextColor: Colors.orange[700],
              ),
              DigitIconButton(
                icon: Icons.sort,
                onPressed: () => filterDialogBox(context, headerControllers),
                iconText: "Filter",
                iconColor: Colors.orange[700],
                iconTextColor: Colors.orange[700],
              ),
              DigitIconButton(
                icon: Icons.sort,
                onPressed: () => sortDialogBox(context, headerControllers),
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

searchDialogBox(context, HeaderControllers headerControllers) => DigitActionDialog.show(
      context,
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Search By", style: TextStyle(fontSize: 20)),
          DigitTextField(
            label: "Application No.",
            controller: headerControllers.applicationNoCtrl,
          ),
          DigitTextField(
            label: "Mobile No.",
            controller: headerControllers.mobileNoCtrl,
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(child: const Text("CLEAR SEARCH"), onPressed: () => headerControllers.clearSeatch()),
              DigitElevatedButton(child: const Text("SEARCH"), onPressed: () {}),
            ],
          )
        ],
      ),
    );

filterDialogBox(context, HeaderControllers headerControllers) => DigitActionDialog.show(
      context,
      widget: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Filter By", style: TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            const Text("Locality"),
            const SizedBox(height: 20),
            const Text("Status"),
            DigitCheckboxTile(
              label: "Application Created",
              value: headerControllers.appCreated.value,
              onChanged: (value) => headerControllers.appCreatedToggle(),
            ),
            DigitCheckboxTile(
              label: "Pending for DSO Assignment",
              value: headerControllers.dsoPending.value,
              onChanged: (value) => headerControllers.dsoPendingToggle(),
            ),
            DigitCheckboxTile(
              label: "DSO In Progress",
              value: headerControllers.dsoInProcgress.value,
              onChanged: (value) => headerControllers.dsoInProgressToggle(),
            ),
            DigitCheckboxTile(
              label: "Pending for Payment",
              value: headerControllers.pendingPayment.value,
              onChanged: (value) => headerControllers.pendingPaymentToggle(),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(child: const Text("CLEAR FILTER"), onPressed: () => headerControllers.clearFilters()),
                DigitElevatedButton(child: const Text("FILTER"), onPressed: () {}),
              ],
            )
            // DigitDropdown(value: value, label: label, menuItems: menuItems, valueMapper: valueMapper)
          ],
        ),
      ),
    );

sortDialogBox(context, HeaderControllers headerControllers) => DigitActionDialog.show(
      context,
      widget: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Sort By", style: TextStyle(fontSize: 20)),
            RadioListTile(
              title: const Text("Date (Latest First)"),
              value: 0,
              groupValue: headerControllers.sortValue.value,
              onChanged: (value) => headerControllers.setSortValue(0),
            ),
            RadioListTile(
              title: const Text("Date (Lates Last)"),
              value: 1,
              groupValue: headerControllers.sortValue.value,
              onChanged: (value) => headerControllers.setSortValue(1),
            ),
          ],
        ),
      ),
    );
