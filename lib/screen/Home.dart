import 'package:calgrade/constants/color.dart';
import 'package:calgrade/gradelist/gradelist.dart';
import 'package:flutter/material.dart';
import 'addlist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ListNameScore> listItems = [
    ListNameScore('Patta', 90),
    ListNameScore('Mali', 75),
    ListNameScore('Mala', 60),
    ListNameScore('Malu', 45),
    ListNameScore('Malah', 35),
  ];



  void _addNewItem(String name, int score) {
    setState(() {
      listItems.insert(0, ListNameScore(name, score));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: BuildAppBar(),
      body: Listview(),
      floatingActionButton: addnewitem(_addNewItem),
    );
  }

  ListView Listview() {
    return ListView.builder(
      itemCount: listItems.length,
      itemBuilder: (context, index) {
        final item = listItems[index];
        return Dismissible(
          key: Key(item.name), // Use a unique key for each item.
          direction: DismissDirection.endToStart,
          background: Container(
            alignment: Alignment.centerRight,
            color:
                Colors.red, // Set the background color when swiping to delete.
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Icon(Icons.delete, color: Colors.white),
            ),
          ),
          onDismissed: (direction) {
            // Remove the item from the list when dismissed.
            setState(() {
              listItems.removeAt(index);
            });
          },
          child: ListNameScore(item.name, item.score),
        );
      },
    );
  }

  AppBar BuildAppBar() {
    return AppBar(
      backgroundColor: bgColor,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text(
              'Calculate Grade',
              style: TextStyle(color: textColor),
            ),
          )
        ],
      ),
    );
  }
}
