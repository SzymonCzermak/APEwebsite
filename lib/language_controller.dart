import 'package:flutter/material.dart';

class LanguageController extends ChangeNotifier {
  bool _isPolish = true;

  bool get isPolish => _isPolish;

  void toggleLanguage() {
    _isPolish = !_isPolish;
    notifyListeners();
  }

  void setLanguage(bool isPL) {
    _isPolish = isPL;
    notifyListeners();
  }
}
