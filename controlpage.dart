
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'json1/sql_helper.dart';
import 'json1/users.dart';

class ControlPage extends StatefulWidget {
  const ControlPage({super.key});

  @override
  State<ControlPage> createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
  final TextEditingController numberController = TextEditingController();
  final TextEditingController codeController = TextEditingController();


  insertUser() async{
    if(numberController.text.isNotEmpty ) {
      var response = await SqlDb.instance.createUser(
          Users(username: numberController.text, password: codeController.text,));
      if (response > 0) {
        Navigator.pop(context);
      } else {
        AlertDialog(title: Text("Error"));
      }
    }else{
      const AlertDialog(title: Text("Empty"));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Control Page'),
        centerTitle: true,
        backgroundColor: Colors.green,

      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // حقول الإدخال
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: numberController,
                    decoration: const InputDecoration(
                      labelText: 'Number',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: codeController,
                    decoration: const InputDecoration(
                      labelText: 'Code',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // الأزرار الأربعة
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Create عملية


                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Create clicked')),
                    );
                  },
                  child: const Text('Create'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Update عملية
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Update clicked')),
                    );
                  },
                  child: const Text('Update'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Delete عملية
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Delete clicked')),
                    );
                  },
                  child: const Text('Delete'),
                ),
                ElevatedButton(

                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Back'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
