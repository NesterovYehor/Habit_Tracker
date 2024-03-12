import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HabitTile extends StatelessWidget {
  const HabitTile({Key? key, required this.habitName, required this.habitCompleted, required this.onChanged, required this.settingsTapped, required this.deleteTapped});

  final String habitName;
  final bool habitCompleted;
  final Function(bool?)? onChanged;
  final Function (BuildContext)? settingsTapped;
  final Function (BuildContext)? deleteTapped;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(), 
          children: [
            SlidableAction(
              onPressed: settingsTapped,
              backgroundColor: Theme.of(context).colorScheme.tertiary,
              icon: Icons.settings,
              borderRadius: BorderRadius.circular(12),
              ),
            SlidableAction(
              onPressed: deleteTapped,
              backgroundColor: Colors.red,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(12),
              ),
            ]
          ),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(12)
          ),
          padding: EdgeInsets.all(24),
          child: Row(
            children: [
              Checkbox(
                value: habitCompleted, 
                onChanged: onChanged,
              ),
              Text(habitName)
            ],
          ),
        ),
      ),
    );
  }
}
