import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_list/Screens/add_note_screen.dart';
import 'package:to_do_list/Screens/done_tasks_screen.dart';
import 'package:to_do_list/models/task.dart';
import 'package:to_do_list/widgets/task_card.dart';
import '../utilities/dummy_data.dart';

class Notes extends StatefulWidget {
  Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  int _page = 0;

  Box box = Hive.box('notes');
  Task convertToTask(Map<dynamic, dynamic> map) {
    return Task(
      title: map['title'],
      note: map['note'],
      isDone: map['isDone'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          _page = value;
          if (_page == 0) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => Notes()));
          } else if (_page == 1) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => DoneTasks()));
          }
          setState(() {});
        },
        iconSize: 30,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _page == 0 ? Colors.deepPurple : Colors.black,
            ),
            label: ' ',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: _page == 1 ? Colors.deepPurple : Colors.black,
            ),
            label: ' ',
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('TODO APP'),
        actions: [
          IconButton(
              onPressed: () {
                //TODO: The calender
              },
              icon: const Icon(Icons.calendar_month_outlined))
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: box.length,
                itemBuilder: (context, index) {
                  final task = box.getAt(index);
                  return TaskCard(
                    task: convertToTask(task),
                    onTap: () {},
                    onDelete: () {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => AddTask()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
