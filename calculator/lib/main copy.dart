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
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String operation = '';
  String answer = '';

  void onKeyPress(String character) {
    setState(() {
      answer += character;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Riya's Calculator"),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(flex: 3, child: Answer(answer: answer)),
          Expanded(
            flex: 10,
            child: Numberpad(
              onKeyPress: onKeyPress,
            ),
          )
        ],
      ),
    );
  }
}

class Answer extends StatelessWidget {
  const Answer({Key? key, required this.answer}) : super(key: key);

  final String answer;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Text(answer),
    );
  }
}

class Numberpad extends StatelessWidget {
  const Numberpad({Key? key, required this.onKeyPress}) : super(key: key);
  final ValueSetter<String> onKeyPress;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  child: TextButton(
                      onPressed: () {
                        onKeyPress('C');
                      },
                      child: Text('C'))),
              Expanded(
                  child: TextButton(
                      onPressed: () {
                        onKeyPress('7');
                      },
                      child: Text('7'))),
              Expanded(
                  child: TextButton(
                      onPressed: () {
                        onKeyPress('4');
                      },
                      child: Text('4'))),
              Expanded(
                  child: TextButton(
                      onPressed: () {
                        onKeyPress('1');
                      },
                      child: Text('1'))),
              Expanded(
                  child: TextButton(
                      onPressed: () {
                        onKeyPress('.');
                      },
                      child: Text('.'))),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  child: IconButton(
                      onPressed: () {
                        onKeyPress('B');
                      },
                      icon: Icon(Icons.arrow_back))),
              Expanded(
                  child: TextButton(
                      onPressed: () {
                        onKeyPress('8');
                      },
                      child: Text('8'))),
              Expanded(
                  child: TextButton(
                      onPressed: () {
                        onKeyPress('5');
                      },
                      child: Text('5'))),
              Expanded(
                  child: TextButton(
                      onPressed: () {
                        onKeyPress('2');
                      },
                      child: Text('2'))),
              Expanded(
                  child: TextButton(
                      onPressed: () {
                        onKeyPress('0');
                      },
                      child: Text('0'))),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  child: TextButton(
                      onPressed: () {
                        onKeyPress('/');
                      },
                      child: Text('/'))),
              Expanded(
                  child: TextButton(
                      onPressed: () {
                        onKeyPress('9');
                      },
                      child: Text('9'))),
              Expanded(
                  child: TextButton(
                      onPressed: () {
                        onKeyPress('6');
                      },
                      child: Text('6'))),
              Expanded(
                  child: TextButton(
                      onPressed: () {
                        onKeyPress('3');
                      },
                      child: Text('3'))),
              Expanded(
                  child: TextButton(
                      onPressed: () {
                        onKeyPress('00');
                      },
                      child: Text('00'))),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  child: TextButton(
                      onPressed: () {
                        onKeyPress('*');
                      },
                      child: Text('*'))),
              Expanded(
                  child: TextButton(
                      onPressed: () {
                        onKeyPress('-');
                      },
                      child: Text('-'))),
              Expanded(
                  child: TextButton(
                      onPressed: () {
                        onKeyPress('+');
                      },
                      child: Text('+'))),
              Expanded(
                  flex: 2,
                  child: TextButton(
                      onPressed: () {
                        onKeyPress('=');
                      },
                      child: Text('='))),
            ],
          ),
        ],
      ),
    );
  }
}
