import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_list/Screens/notes_screen.dart';
import 'package:to_do_list/utilities/show_snack_bar.dart';

class AddTask extends StatelessWidget {
  AddTask({super.key});
  final TextEditingController _title_controller = new TextEditingController();
  final TextEditingController _noteController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool validate() {
      if (_title_controller.text.isEmpty || _noteController.text.isEmpty) {
        showSnackBar(context, "Fill all the fields");
        return false;
      }
      return true;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text("Add Task"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (_) => Notes()));
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          TextField(
            decoration: const InputDecoration(
              hintText: "Title:",
            ),
            controller: _title_controller,
          ),
          const SizedBox(height: 20),
          TextField(
            decoration: const InputDecoration(
              hintText: "Note:",
            ),
            controller: _noteController,
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.deepPurple),
              textStyle: MaterialStateProperty.all<TextStyle>(
                const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              padding: MaterialStateProperty.all<EdgeInsets>(
                EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 2.8,
                    vertical: 15),
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            onPressed: () async {
              // add data to the hive box
              if (validate()) {
                await Hive.box('notes').add({
                  'title': _title_controller.text,
                  'note': _noteController.text,
                  'isDone': false,
                });
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => Notes()));
              }
            },
            child: const Text('ADD'),
          ),
        ]),
      ),
    );
  }
}
