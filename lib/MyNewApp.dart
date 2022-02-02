import 'package:flutter/material.dart';

class MyNewApp extends StatefulWidget {
  MyNewApp({Key key, String title}) : super(key: key);

  @override
  State<MyNewApp> createState() => _MyNewAppState();
}

class _MyNewAppState extends State<MyNewApp> {
  TextEditingController _tc = TextEditingController();
  String revStr = " ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Reverse'),
      ),
      body: Center(
        child: Column(
          children: [
            TextFormField(
              controller: _tc,
              decoration:
                  InputDecoration(hintText: "Enter the Text to reverse"),
            ),
            ElevatedButton(
                onPressed: () {
                  String text = _tc.text;
                  setState(() {
                    revStr = reverse(text);
                  });
                  _tc.clear();
                },
                child: Text("Reverse")),
            Text("reversed : $revStr"),
          ],
        ),
      ),
    );
  }
}

String reverse(String text) {
  String rev;
  rev = text.split('').reversed.join();
  return rev;
}
