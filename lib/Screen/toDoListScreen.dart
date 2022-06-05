import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../Widgets/toDoListWidgets.dart';

class ToDoListScreen extends StatefulWidget {
  static const routeName = '/toDoList';

  @override
  _ToDoListScreenState createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  CalendarController _calendarController;
  final List<String> todos = [];
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }

  void submit() {
    setState(() {
      controller.text == "" ? print("null") : todos.add(controller.text);
      controller.clear();
      Navigator.of(context).pop();
    });
  }

  void settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Container(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(labelText: 'Title'),
                    onSubmitted: (_) => submit(),
                  ),
                ),
                RaisedButton(
                    color: Theme.of(context).primaryColor,
                    shape: StadiumBorder(),
                    child: Text(
                      "Add",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () => submit()),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Calender"),
        centerTitle: true,
      ),
      body: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
        buildTableCalendar(context, _calendarController),
        Expanded(child: buildEventList(context, screenSize, todos)),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          settingModalBottomSheet(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
