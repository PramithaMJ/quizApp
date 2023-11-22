import 'package:flutter/material.dart';

class QusestionScreen extends StatefulWidget {
  const QusestionScreen({super.key});

  @override
  State<QusestionScreen> createState() => _QusestionScreenState();
}

class _QusestionScreenState extends State<QusestionScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Thequestion..."),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Answer 1'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Answer 2'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Answer 3'),
          ),
        ],
      ),
    );
  }
}
