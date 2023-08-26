import 'package:calgrade/constants/color.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListNameScore extends StatelessWidget {
  String name = '';
  int score = 0;
  String addList = '';

  ListNameScore(this.name, this.score);

  String calculateGrade() {
    if (score >= 90) {
      return 'A';
    } else if (score >= 75) {
      return 'B';
    } else if (score >= 60) {
      return 'C';
    } else if (score >= 45) {
      return 'D';
    } else {
      return 'Fail';
    }
  }

  @override
  Widget build(BuildContext context) {
    String gradeMessage = '${calculateGrade()}!';

    return Container(
      decoration: BoxDecoration(
          color: listColor, borderRadius: BorderRadius.circular(30)),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
              Text('Your score is: $score',
                  style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
              Text('You got',
                  style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.normal)),
              Text('$gradeMessage',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold))
            ],
          ),
        ],
      ),
    );
  }
}
