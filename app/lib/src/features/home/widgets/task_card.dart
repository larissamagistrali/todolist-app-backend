import 'package:flutter/material.dart';
// ignore: lines_longer_than_80_chars
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_declarations

import 'package:listinha/src/shared/models/task_model.dart';

class TaskCard extends StatelessWidget {
  final TaskBoard task;
  const TaskCard({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final progressValue = 0.5;
    final statusText = 'Pendente';
    final progressText = '1/5';
    final title = task.title;
    final backgroundColor = Colors.lightBlueAccent;
    final color = Colors.blueAccent;
    final iconData = Icon(Icons.favorite);

    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                iconData,
                Spacer(),
                Text(statusText),
              ],
            ),
            Spacer(),
            Text(title),
            LinearProgressIndicator(
              value: progressValue,
              color: color,
            ),
            Text(progressText),
          ],
        ),
      ),
    );
  }
}
