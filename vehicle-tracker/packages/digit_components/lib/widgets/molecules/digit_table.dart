import 'package:digit_components/digit_components.dart';
import 'package:digit_components/models/digit_table_model.dart';
import 'package:digit_components/theme/digit_theme.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

class DigitTable extends StatelessWidget {
  final double columnRowFixedHeight = 52.0;
  final List<TableHeader> headerList;
  final List<TableDataRow> tableData;
  final double leftColumnWidth;
  final double rightColumnWidth;
  final double? height;

  const DigitTable({
    Key? key,
    required this.headerList,
    required this.tableData,
    required this.leftColumnWidth,
    required this.rightColumnWidth,
    this.height,
  }) : super(key: key);

  List<Widget>? _getTitleWidget(ThemeData theme) {
    var index = 0;
    return headerList.map((e) {
      index++;

      if (e.isSortingRequired ?? false) {
        return TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
            ),
            onPressed: e.callBack == null ? null : () => e.callBack!(e),
            child: _getTitleItemWidget((e.label), theme,
                isAscending: e.isAscendingOrder,
                isBorderRequired: (index - 1) == 0));
      } else {
        return _getTitleItemWidget(e.label, theme,
            isBorderRequired: (index - 1) == 0);
      }
    }).toList();
  }

  Widget _getTitleItemWidget(String label, ThemeData theme,
      {bool? isAscending, bool isBorderRequired = false}) {
    var textWidget = Text((label), style: theme.textTheme.headlineSmall);
    final tableCellBorder = DigitTheme.instance.tableCellBorder;
    final tableCellStrongBorder = DigitTheme.instance.tableCellStrongBorder;
    final surfaceColor = DigitTheme.instance.colorScheme.surface;

    return Container(
      decoration: isBorderRequired
          ? BoxDecoration(
              border: Border(
                left: tableCellBorder,
                bottom: tableCellBorder,
                right: tableCellStrongBorder,
              ),
              color: surfaceColor)
          : null,
      width: leftColumnWidth,
      height: 56,
      color: !isBorderRequired ? surfaceColor : null,
      padding: const EdgeInsets.only(left: 17, right: 5, top: 6, bottom: 6),
      alignment: Alignment.centerLeft,
      child: isAscending != null
          ? Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 5,
              children: [
                textWidget,
                Icon(isAscending
                    ? Icons.arrow_upward
                    : Icons.arrow_downward_sharp)
              ],
            )
          : textWidget,
    );
  }

  double columnRowIncreasedHeight(int index) {
    return (50 +
        tableData[index].tableRow.first.label.substring(28).length.toDouble());
    //if greater than 28 characters
  }

  Widget _generateColumnRow(BuildContext context, int index, String input,
      {TextStyle? style}) {
    return Container(
      width: leftColumnWidth,
      height: tableData[index].tableRow.first.label.length > 28
          ? columnRowIncreasedHeight(index)
          : columnRowFixedHeight,
      padding: const EdgeInsets.only(left: 17, right: 5, top: 6, bottom: 6),
      alignment: Alignment.centerLeft,
      color: index % 2 == 0
          ? DigitTheme.instance.colorScheme.background
          : DigitTheme.instance.colorScheme.surface,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              (input),
              style: style,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    final theme = Theme.of(context);
    var data = tableData[index];
    var list = <Widget>[];
    for (int i = 1; i < data.tableRow.length; i++) {
      list.add(_generateColumnRow(context, index, data.tableRow[i].label,
          style: data.tableRow[i].style));
    }

    return Container(
        color: index % 2 == 0 ? theme.scaffoldBackgroundColor : theme.cardColor,
        child: Row(children: list));
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    var data = tableData[index].tableRow.first;
    final tableCellBorder = DigitTheme.instance.tableCellBorder;
    final tableCellStrongBorder = DigitTheme.instance.tableCellStrongBorder;
    return InkWell(
      onTap: () {
        if (data.callBack != null) {
          data.callBack!(data);
        }
      },
      child: Container(
        decoration: BoxDecoration(
            color: DigitTheme.instance.colorScheme.surface,
            border: Border(
              left: tableCellBorder,
              right: tableCellStrongBorder,
            )),
        width: leftColumnWidth,
        height: tableData[index].tableRow.first.label.length > 28
            ? columnRowIncreasedHeight(index)
            : columnRowFixedHeight,
        padding: const EdgeInsets.only(left: 17, right: 5, top: 6, bottom: 6),
        alignment: Alignment.centerLeft,
        child: Text(tableData[index].tableRow.first.label,
            style: tableData[index].tableRow.first.style),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: height,
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
        decoration: BoxDecoration(
          border: Border.all(color: DigitTheme.instance.colorScheme.outline),
          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        ),
        child: HorizontalDataTable(
          leftHandSideColumnWidth: leftColumnWidth,
          rightHandSideColumnWidth: rightColumnWidth,
          isFixedHeader: true,
          headerWidgets: _getTitleWidget(theme),
          leftSideItemBuilder: _generateFirstColumnRow,
          rightSideItemBuilder: _generateRightHandSideColumnRow,
          itemCount: tableData.length,
          rowSeparatorWidget: const Divider(
            color: Colors.black54,
            height: 1.0,
            thickness: 0.0,
          ),
        ),
      ),
    );
  }

//Need to move this to theme
}
