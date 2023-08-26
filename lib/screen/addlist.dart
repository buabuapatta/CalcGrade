import 'package:calgrade/constants/color.dart';
import 'package:flutter/material.dart';

class addnewitem extends StatefulWidget {
  final void Function(String name, int score) addNewItem;

  const addnewitem(this.addNewItem, {Key? key}) : super(key: key);

  @override
  State<addnewitem> createState() => _addnewitemState();
}

class _addnewitemState extends State<addnewitem> {
  String name = '';
  String score = '';

  void _showInputDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          TextEditingController nameController = TextEditingController();
          TextEditingController scoreController = TextEditingController();

          return AlertDialog(
            title: const Text('Enter Name and Score'),
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(hintText: 'Enter Name'),
                  ),
                  TextField(
                    controller: scoreController,
                    decoration: const InputDecoration(hintText: 'Enter Score'),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Cancle'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('Save'),
                onPressed: () {
                  setState(
                    () {
                      name = nameController.text;
                      score = scoreController.text;
                    },
                  );
                  if (name.isNotEmpty && score.isNotEmpty) {
                    final int parsedScore = int.tryParse(score) ?? 0;
                    widget.addNewItem(name, parsedScore);
                  }
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: _showInputDialog,
          child: const Icon(Icons.add),
          backgroundColor: buttonColor,
          elevation: 0,
        )
      ],
    );
  }
}
