import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tasky_pro/main_componant/loader.dart';
import 'package:tasky_pro/model/week_model.dart';

class HomeViewModel extends ChangeNotifier {

  List<WeekModel> weekWidget =[
    WeekModel(weekDays: 'SAT', weekDate: '1'),
    WeekModel(weekDays: 'SUN', weekDate: '2'),
    WeekModel(weekDays: 'MON', weekDate: '3'),
    WeekModel(weekDays: 'TUE', weekDate: '4'),
    WeekModel(weekDays: 'WED', weekDate: '5'),
    WeekModel(weekDays: 'THU', weekDate: '6'),
    WeekModel(weekDays: 'FRI', weekDate: '7'),
  ];

  Future<void> signOut(context)async{
    LoaderApp.showLoadingDialog(context);
    await FirebaseAuth.instance.signOut();
    print('sign Out');
  }

  String greeting='';

  void updateGreeting(){
    final hour = DateTime.now().hour;
    if(hour >= 5 && hour <=12){
      greeting = 'Good Morning !';
    }
    else if (hour>= 12 && hour<= 17){
      greeting = 'Good Afternoon !';
    }
    else{
      greeting = 'Good Evening !';
    }
    notifyListeners();
  }

}