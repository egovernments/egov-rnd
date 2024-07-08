import 'package:flutter/material.dart';

class TableHeader {
  final String label;
  final ValueChanged<TableHeader>? callBack;
  bool? isSortingRequired = false;
  bool? isAscendingOrder;
  String? cellKey;
  TableHeader(
    this.label, {
    this.callBack,
    this.isSortingRequired,
    this.isAscendingOrder,
    this.cellKey,
  });
}

class TableDataRow {
  final List<TableData> tableRow;
  TableDataRow(this.tableRow);
}

class TableData {
  final String label;
  final TextStyle? style;
  final String? cellKey;
  ValueChanged<TableData>? callBack;
  final Widget? widget;
  TableData(
    this.label, {
    this.style,
    this.callBack,
    this.cellKey,
    this.widget,
  });
}
