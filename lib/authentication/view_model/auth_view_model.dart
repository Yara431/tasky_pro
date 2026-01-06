import 'package:flutter/widgets.dart';

class AuthViewModel extends ChangeNotifier{

  int currentPage=0;


  changePage(int index){
    currentPage = index;
    notifyListeners();
  }
}