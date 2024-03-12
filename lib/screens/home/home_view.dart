import 'package:flutter/material.dart';
import 'package:habit_tracker/components/my_fab.dart';
import 'package:habit_tracker/data/data.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:habit_tracker/components/habit_tile.dart';
import 'package:habit_tracker/screens/home/home_viewmodel.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final vm = HomeViewModel();

  @override
  void initState() {
    vm.loadHabits(); // Ensure loadHabits() is called after Hive box is opened
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, vm, child) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          floatingActionButton: MyFloatingActionButton(onPressed: () => vm.addNewHabit(context)),
          body: ListView.builder(
            itemCount: vm.db.todaysHabitList.length,
            itemBuilder: (context, index) {
              return HabitTile(
                habitName: vm.db.todaysHabitList[index][0], 
                habitCompleted: vm.db.todaysHabitList[index][1], 
                onChanged: (value) => vm.checkBoxTapped(value!, index), 
                settingsTapped: (context) => vm.openSettings(context, index), 
                deleteTapped: (context) => vm.deleteHabit(index),
                );
            },
            )
        );
      },
    );
  }
}
