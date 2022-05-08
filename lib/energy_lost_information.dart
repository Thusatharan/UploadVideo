import 'package:flutter/material.dart';

class EnergyLostInformation extends StatelessWidget {
  const EnergyLostInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Energy Lost Information'),
        elevation: 0,
      ),
      backgroundColor: Colors.transparent,
      body: Container(),
    );
  }
}
