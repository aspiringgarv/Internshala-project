import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SonboardProvider extends ChangeNotifier {
  void _finishOnboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isFirstTime', false);
    // Navigate to the main screen
  }
  PageController controller = PageController();
  int currentpageindex = 0;
  void updatepage(int x) {
    currentpageindex = x;
    controller.jumpToPage(x);
    notifyListeners();
  }

  void tappedskip() {
    updatepage(3);
  }

  void tappednext(BuildContext context) {
    if(currentpageindex==2){
      _finishOnboarding();
      Navigator.of(context).pushReplacementNamed('search');
      notifyListeners();
    }
    else{
      updatepage(currentpageindex + 1);
    }
  }
}
