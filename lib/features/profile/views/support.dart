import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class Support extends StatefulWidget {
  const Support({Key? key}) : super(key:key);

  @override
_SupportScreenState createState() => _SupportScreenState();
}

class _SupportScreenState extends State<Support> {
  @override
Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Support & Help',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: AppColors.primary),
        ),
        leading: const BackButton(color: AppColors.primary,),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              color: Colors.red,
              child: Text("data"),
            )
          ],
        ),
      ),
    );

  }
}