import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LatestNewsScreenView extends GetView {
  const LatestNewsScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LatestNewsScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LatestNewsScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
