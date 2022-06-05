import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../providers/db_provider.dart';

Widget buildTableCalendar(
    BuildContext context, CalendarController _calendarController) {
  return TableCalendar(
    calendarController: _calendarController,
    startingDayOfWeek: StartingDayOfWeek.sunday,
    calendarStyle: CalendarStyle(
      selectedColor: Theme.of(context).primaryColor,
      todayColor: Theme.of(context).accentColor,
      outsideDaysVisible: false,
    ),
    headerStyle: HeaderStyle(
      formatButtonTextStyle: TextStyle(color: Colors.white, fontSize: 15.0),
      formatButtonDecoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(16.0),
      ),
    ),
  );
}

Widget buildEventList(
    BuildContext context, Size screenSize, List<String> todos) {
  return Container(
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32), topRight: Radius.circular(32)),
    ),
    child: Column(
      children: [
        Text(
          "To-Do Lists",
          style: TextStyle(
              color: Colors.white,
              fontSize: screenSize.height * 0.025,
              fontWeight: FontWeight.w700),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: todos.length,
            itemBuilder: (BuildContext context, int index) {
              final todo = todos[index];
              return Dismissible(
                key: Key('$todo$index'),
                onDismissed: (direction) =>
                    {todos.removeAt(index), DBProvider().delete(index)},
                child: ListTile(
                    leading: Icon(
                      Icons.circle,
                      color: Colors.white,
                    ),
                    title: Text(
                      todo,
                      style: TextStyle(color: Colors.white),
                    )),
                background: Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.all(8),
                  color: Colors.red,
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}
