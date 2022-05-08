import 'package:flutter/material.dart';

class PerformaceDetails extends StatelessWidget {
  const PerformaceDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Performance Details'),
        elevation: 0,
      ),
      backgroundColor: Colors.transparent,
      body: Container(),
    );
  }
}
