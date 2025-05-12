import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Finalpage.dart';
import 'json1/sql_helper.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController numberController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  bool isChecked = false;
  bool isLoginTrue = false;

  Future<void> login() async {
    if (numberController.text.isEmpty || codeController.text.isEmpty) {
      showErrorDialog("الرجاء إدخال الرقم والكود");
      return;
    }

    try {
      var user = await SqlDb.instance.loginUser(
          numberController.text,
          codeController.text
      );

      if (user != null && mounted) {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FinalPage(usr: user))
        );
      } else {
        showErrorDialog("بيانات الدخول غير صحيحة");
      }
    } catch (e) {
      showErrorDialog("حدث خطأ أثناء محاولة الدخول");
    }
  }

  void showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("خطأ", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("حسناً"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page', style: TextStyle(fontSize: 20, color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: numberController,
              decoration: const InputDecoration(
                labelText: 'Number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: codeController,
              obscureText: true, // لإخفاء النص في حقل الكود
              decoration: const InputDecoration(
                labelText: 'Code',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Transform.rotate(
                  angle: -0.0,
                  child: ElevatedButton(
                    onPressed: () async {
                      await login();
                    },
                    child: const Text('Login'),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Home'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
