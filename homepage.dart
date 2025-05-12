
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // أزرار التنقل للصفحات الأخرى
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text('Login Page'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/control');
                  },
                  child: const Text('Control Page'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // زر إغلاق
          ElevatedButton(
            onPressed: () {
              // يمكن استخدام exit(0) أو pop حسب السياق
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey,
            ),
            child: const Text('Close'),
          ),
          const SizedBox(height: 40),

          // الاسم في الأسفل
          const Text(
            'abdulaziz',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
