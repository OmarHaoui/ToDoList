import 'package:flutter/material.dart';
import 'package:to_do_list/Screens/notes_screen.dart';

class DoneTasks extends StatefulWidget {
  DoneTasks({super.key});

  @override
  State<DoneTasks> createState() => _DoneTasksState();
}

class _DoneTasksState extends State<DoneTasks> {
  int _page = 1;

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
          title: Text("Completed Task"),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop()),
        ),
        body: Center(
          child: Text("Completed Tasks"),
        ));
  }
}
