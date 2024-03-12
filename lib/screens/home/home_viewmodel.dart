import 'package:flutter/material.dart';
import 'package:habit_tracker/components/my_alert_box.dart';
import 'package:habit_tracker/data/data.dart';
import 'package:hive/hive.dart';

class HomeViewModel extends ChangeNotifier {
  bool habitCompleted = false;
  final TextEditingController newHabitName = TextEditingController();
  final _myBox = Hive.box("Habit_Database");

  final db = HabitDataBase();

  void loadHabits(){
    if (_myBox.get("CURRENT_HABIT_LIST") == null){
      db.createDefaultData();
    }
    else{
      db.loadData();
    }
  }


  List todayHabitsList = [
    ["Morning Run", false],
    ["Read Book", false],
    [" Go to gym", false]
  ];

  void checkBoxTapped(bool value, int index) {
    todayHabitsList[index][1] = value;
    notifyListeners();
  }

  void addNewHabit(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return MyAlertBox(
          onSave: (habitName) {
            todayHabitsList.add([habitName, false]);
            notifyListeners();
          }, habitName: '',
        );
      },
    );
  }

  void deleteHabit(int index){
    todayHabitsList.removeAt(index);
    notifyListeners();
  }

  void openSettings( BuildContext context, int index){
    showDialog(
      context: context,
       builder: (context) {
         return MyAlertBox(
          onSave: (habitName) {
            todayHabitsList.add([habitName, false]);
            notifyListeners();
          }, habitName: todayHabitsList[index][0],
        );
      },
    );
  }
}
