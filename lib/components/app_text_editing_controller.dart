import 'package:flutter/material.dart';

class TextController extends TextEditingController {
  @override
  void dispose() {
    print('$this is being disposedsssss');
    super.dispose();
  }
}
