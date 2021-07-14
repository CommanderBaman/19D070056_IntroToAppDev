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
    print(charPressed + ' pressed!');
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
      child: Text(this.text),
      decoration:
          BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
    );
  }
}

class QueryWidget extends StatelessWidget {
  const QueryWidget({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(this.text),
      decoration:
          BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
    );
  }
}

class Numpad extends StatelessWidget {
  const Numpad({Key? key, required this.onKeyPress}) : super(key: key);

  final ValueSetter<String> onKeyPress;

  final List<String> firstRow = const ['7', '8', '9', '/'];
  final List<String> secondRow = const ['4', '5', '6', 'X'];
  final List<String> thirdRow = const ['1', '2', '3', '-'];
  final List<String> fourthRow = const ['.', '0', '<x', '+'];
  final List<String> fifthRow = const ['C', '='];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
        child: Column(
      children: [
        Expanded(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: firstRow
                  .map((displayValue) => NumpadButton(
                        text: displayValue,
                        onKeyPress: onKeyPress,
                      ))
                  .toList()),
        ),
        Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: secondRow
                    .map((displayValue) => NumpadButton(
                          text: displayValue,
                          onKeyPress: onKeyPress,
                        ))
                    .toList())),
        Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: thirdRow
                    .map((displayValue) => NumpadButton(
                          text: displayValue,
                          onKeyPress: onKeyPress,
                        ))
                    .toList())),
        Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: fourthRow
                    .map((displayValue) => NumpadButton(
                          text: displayValue,
                          onKeyPress: onKeyPress,
                        ))
                    .toList())),
        Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: fifthRow
                    .map((displayValue) => NumpadButton(
                          text: displayValue,
                          onKeyPress: onKeyPress,
                        ))
                    .toList())),
      ],
    ));
  }
}

class NumpadButton extends StatelessWidget {
  const NumpadButton({Key? key, required this.text, required this.onKeyPress})
      : super(key: key);
  final String text;
  final ValueSetter<String> onKeyPress;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () {
          onKeyPress(text);
        },
        style: OutlinedButton.styleFrom(shape: CircleBorder()),
        child: Container(
            child: Text(
          text,
          style: TextStyle(color: Colors.black),
        ), padding: EdgeInsets.all(25),));
  }
}
