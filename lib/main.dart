import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(
    MyApp(),
  );
}

double result;
double value1;
double value2;
final value1Controller = TextEditingController();
final value2Controller = TextEditingController();
final resultController = TextEditingController();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          "Basic Calculator App",
          style: TextStyle(
            color: Colors.amber[100],
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: value1Controller,
                        decoration: InputDecoration(labelText: "First Value"),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: value2Controller,
                    decoration: InputDecoration(labelText: "Second Value"),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                  child: Row(children: [
                    Container(
                      color: Colors.tealAccent,
                      width: 60,
                      height: 60,
                      child: OutlinedButton(
                        style: ButtonStyle(),
                        child: Icon(Icons.remove),
                        onPressed: () {
                          double firstValueData =
                              double.parse(value1Controller.text);
                          double secondValueData =
                              double.parse(value2Controller.text);
                          setState(() {
                            result = (firstValueData - secondValueData);
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      color: Colors.tealAccent,
                      width: 60,
                      height: 60,
                      child: OutlinedButton(
                        child: Icon(Icons.add),
                        onPressed: () {
                          double firstValueData =
                              double.parse(value1Controller.text);
                          double secondValueData =
                              double.parse(value2Controller.text);
                          setState(() {
                            result = (firstValueData + secondValueData);
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      color: Colors.tealAccent,
                      width: 60,
                      height: 60,
                      child: OutlinedButton(
                        child: Text("*"),
                        onPressed: () {
                          double firstValueData =
                              double.parse(value1Controller.text);
                          double secondValueData =
                              double.parse(value2Controller.text);
                          setState(() {
                            result = (firstValueData * secondValueData);
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      color: Colors.tealAccent,
                      width: 60,
                      height: 60,
                      child: OutlinedButton(
                        child: Text("÷"),
                        style: ButtonStyle(),
                        onPressed: () {
                          double firstValueData =
                              double.parse(value1Controller.text);
                          double secondValueData =
                              double.parse(value2Controller.text);
                          setState(() {
                            result = (firstValueData / secondValueData);
                          });
                        },
                      ),
                    ),
                  ]),
                ),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: resultController,
                    decoration: InputDecoration(labelText: "Answer"),
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      result.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        letterSpacing: 1.2,
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Clear",
        child: Icon(Icons.clear_rounded),
        highlightElevation: 20,
        hoverColor: Colors.green,
        splashColor: Colors.red,
        onPressed: () {
          value1Controller.clear();
          value2Controller.clear();
          resultController.clear();
        },
      ),
    );
  }
}
