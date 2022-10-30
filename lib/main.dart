import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Tashyn Notes App',
      home: MainBody(),
    );
  }
}

class MainBody extends StatefulWidget {
  const MainBody({super.key});

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  final notes = [];
  var noteInputController = TextEditingController();
  void _addNote(String value) {
    setState(() {
      notes.add(value);
    });
    noteInputController.clear();
  }

  void _removeNote(String value) {
    setState(() {
      notes.remove(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Notes App"),
        ),
        body: Column(
          children: <Widget>[
            TextField(
              controller: noteInputController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter a note",
              ),
              onSubmitted: ((value) {
                _addNote(value);
              }),
            ),
            Expanded(
              child: notes.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: notes.length,
                      itemBuilder: ((context, index) {
                        return ListTile(
                          title: Text(notes[index]),
                          trailing: IconButton(
                            onPressed: (() {
                              _removeNote(notes[index]);
                            }),
                            icon: const Icon(Icons.auto_delete_sharp),
                          ),
                        );
                      }),
                    )
                  : const Text("No items available"),
            ),
          ],
        ));
  }
}
