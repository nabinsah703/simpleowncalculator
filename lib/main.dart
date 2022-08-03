import 'package:flutter/material.dart';
import 'package:owncalculator/mybutton.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      title: 'calculator',
      color: Colors.deepPurple,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userInput = '';
  var answer = '';
  final colors = Colors.blue[50];
  final List<String> buttons = [
    'C',
    '+/-',
    '%',
    'DEL',
    '7',
    '8',
    '9',
    'x',
    '4',
    '5',
    '6',
    '/',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '=',
    '+'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Calculator App')),
      ),
      backgroundColor: Colors.white54,
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    userInput,
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.red,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  alignment: Alignment.centerRight,
                  child: Text(
                    answer,
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (BuildContext context, int index) {
                  // clear button

                  if (index == 0) {
                    return MyButton(
                      buttonTapped: () {
                        setState(() {
                          userInput = '';
                          answer = '0';
                        });
                      },
                      buttonText: buttons[index],
                      color: colors,
                    );
                  }

                  // +/- button

                  if (index == 1) {
                    return MyButton(
                      buttonText: buttons[index],
                      color: colors,
                      textColor: Colors.black,
                    );
                  }

                  // % button
                  if (index == 2) {
                    return MyButton(
                      buttonTapped: () {
                        setState(() {
                          userInput += buttons[index];
                        });
                      },
                      buttonText: buttons[index],
                      color: colors,
                      textColor: Colors.black,
                    );
                  }

                  // delete button
                  if (index == 3) {
                    return MyButton(
                      buttonTapped: () {
                        setState(() {
                          userInput =
                              userInput.substring(0, userInput.length - 1);
                        });
                      },
                      buttonText: buttons[index],
                      color: colors,
                      textColor: Colors.black,
                    );
                  }

                  // Equal to button

                  if (index == 18) {
                    return MyButton(
                      buttonTapped: () {
                        setState(() {
                          equalPressd();
                        });
                      },
                      buttonText: buttons[index],
                      color: colors,
                      textColor: Colors.black,
                    );
                  }

                  // Other button
                  else {
                    return MyButton(
                      buttonTapped: () {
                        setState(() {
                          userInput += buttons[index];
                        });
                      },
                      buttonText: buttons[index],
                      color: colors,
                      textColor: Colors.black,
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }

    return false;
  }

  // function to calculate the input operation
  void equalPressd() {
    String finaluserinput = userInput;
    finaluserinput = userInput.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
  }
}
