import 'package:flutter/material.dart';
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

}