
import 'package:finalporject/json1/users.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FinalPage extends StatefulWidget {
  const FinalPage({super.key, required Users usr,  });

  @override
  State<FinalPage> createState() => _FinalPageState();
}

class _FinalPageState extends State<FinalPage> {
  final TextEditingController numberController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  late Users usr;
  // بيانات تجريبية (مكان قاعدة البيانات لاحقًا)
  List<Map<String, String>> data = [
    {"id": "1", "number": "055", "code": "111"},
    {"id": "2", "number": "050", "code": "222"},
  ];

  void _showAllData() {
    // يمكنك لاحقًا ربطها بقاعدة البيانات
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Showing all data')),
    );
  }

  void _logout() {
    Navigator.popUntil(context, ModalRoute.withName('/'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Final Page'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // الحقول العلوية
            Row(
              children: [
                Expanded(
                  child:   Text(
                    '${usr.username}',
                    style: TextStyle(
                      fontSize: 30,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 2
                        ..color = Colors.blue[900]!,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    '${usr.password}',
                    style: TextStyle(
                      fontSize: 30,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 2
                        ..color = Colors.blue[900]!,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // الأزرار
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _showAllData,
                  child: const Text('All Data'),
                ),
                ElevatedButton(
                  onPressed: _logout,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text('Logout'),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // الجدول
            Expanded(
              child: SingleChildScrollView(
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Id')),
                    DataColumn(label: Text('Number')),
                    DataColumn(label: Text('Code')),
                  ],
                  rows: data.map((entry) {
                    return DataRow(cells: [
                      DataCell(Text(entry['id']!)),
                      DataCell(Text(entry['number']!)),
                      DataCell(Text(entry['code']!)),
                    ]);
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
