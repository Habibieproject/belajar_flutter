import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  String _title = 'Expandable List';
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Widget'),
      ),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Header",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          newMethod(),
        ],
      ),
    );
  }

  bool _isChecked = false;
  ExpansionTile newMethod() {
    return ExpansionTile(
      title: CheckboxListTile(
        title: const Text('Expandable List'),
        value: _isChecked,
        onChanged: (bool? value) {
          setState(() {
            _isChecked = value!;
          });
        },
        controlAffinity: ListTileControlAffinity.leading,
      ),
      onExpansionChanged: (bool isExpanded) {
        setState(() {
          _isExpanded = isExpanded;
          _title = isExpanded ? 'Expanded List' : 'Expandable List';
        });
      },
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DataTable(
              columns: const [
                DataColumn(label: Text('')),
                DataColumn(label: Text('')),
                DataColumn(label: Text('')),
              ],
              rows: const [
                DataRow(cells: [
                  DataCell(Text('Row 1')),
                  DataCell(Text('Row 1,')),
                  DataCell(Text('Row 1, ')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Row 2,')),
                  DataCell(Text('Row 2,')),
                  DataCell(Text('Row 2, ')),
                ]),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
