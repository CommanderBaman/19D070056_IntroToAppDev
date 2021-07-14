import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String queryString = '';
  String answer = '';

  void onNumpadPress(String charPressed) {
    print(charPressed + ' asdflv');
    setState(() {
      queryString += charPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Calculator!'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: AnswerWidget(
              text: answer,
            ),
          ),
          Expanded(
            flex: 2,
            child: QueryWidget(
              text: queryString,
            ),
          ),
          Expanded(
            flex: 10,
            child: Numpad(
              onKeyPress: onNumpadPress,
            ),
          ),
        ],
      ),
    );
  }
}

class AnswerWidget extends StatelessWidget {
  const AnswerWidget({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Text(this.text),
    );
  }
}

class QueryWidget extends StatelessWidget {
  const QueryWidget({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Text(this.text),
    );
  }
}

class Numpad extends StatelessWidget {
  const Numpad({Key? key, required this.onKeyPress}) : super(key: key);

  final ValueSetter<String> onKeyPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: ElevatedButton(
        child: Text('click me!'),
        onPressed: () {
          onKeyPress('sgg');
        },
      ),
    );
  }
}
