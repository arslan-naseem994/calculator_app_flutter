import 'dart:async';

import 'package:calculator/utils/textstyles.dart';
import 'package:calculator/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String userinput = '';
  String useranswer = '';
  bool cursorVisible = true;
  bool answerg = true;

  String addition = '+', subtraction = '-', multiplication = 'x', divide = '/';

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(milliseconds: 500), (Timer timer) {
      setState(() {
        cursorVisible = !cursorVisible;
      });
    });
  }

  fun() {
    cursorVisible = false;

    try {
      String finaluserinput = userinput.replaceAll('x', '*');
      Parser p = Parser();
      Expression exp = p.parse(finaluserinput);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      if (eval % 1 == 0) {
        useranswer = eval.toStringAsFixed(0);
      } else {
        useranswer = eval.toStringAsFixed(1);
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
            backgroundColor: Colors.black,
            title: const Text(
              "Calculator",
              style: texttstyle,
            )),
        body: Column(
          children: [
            Expanded(
                flex: 4,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        RichText(
                            text: answerg
                                ? TextSpan(
                                    children: [
                                      TextSpan(
                                        text: userinput,
                                        style: texttstyle3,
                                      ),
                                      if (userinput.isNotEmpty && cursorVisible)
                                        WidgetSpan(
                                          child: Container(
                                            width:
                                                2.0, // Adjust the width of the cursor as needed
                                            height: texttstyle3.fontSize,
                                            color: Colors
                                                .white, // Set the cursor color
                                          ),
                                        ),
                                    ],
                                  )
                                : TextSpan(
                                    children: [
                                      TextSpan(
                                        text: userinput,
                                        style: smallblur,
                                      ),
                                    ],
                                  )),
                        Text(
                          useranswer,
                          style: texttstyle3,
                        )
                      ],
                    ),
                  ),
                )),
            Expanded(
                flex: 6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        RoundButton(
                            title: 'C',
                            onPress: () {
                              userinput = '';
                              useranswer = '';
                              setState(() {
                                answerg = true;
                              });
                            }),
                        RoundButton(
                            title: '%',
                            onPress: () {
                              userinput += '%';
                              setState(() {
                                answerg = true;
                              });
                            }),
                        RoundButton(
                            title: 'DEL',
                            onPress: () {
                              if (userinput.isNotEmpty) {
                                userinput = userinput.substring(
                                    0, userinput.length - 1);
                              } else {
                                userinput = '';
                              }
                              setState(() {});
                            }),
                        RoundButton(
                            title: '/',
                            color: Colors.deepOrange,
                            onPress: () {
                              checkFun(divide);
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        RoundButton(
                            title: '7',
                            onPress: () {
                              userinput += '7';
                              setState(() {
                                answerg = true;
                              });
                            }),
                        RoundButton(
                            title: '8',
                            onPress: () {
                              userinput += '8';
                              setState(() {
                                answerg = true;
                              });
                            }),
                        RoundButton(
                            title: '9',
                            onPress: () {
                              userinput += '9';
                              setState(() {
                                answerg = true;
                              });
                            }),
                        RoundButton(
                            title: 'X',
                            color: Colors.deepOrange,
                            onPress: () {
                              checkFun(multiplication);
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        RoundButton(
                            title: '4',
                            onPress: () {
                              userinput += '4';
                              setState(() {
                                answerg = true;
                              });
                            }),
                        RoundButton(
                            title: '5',
                            onPress: () {
                              userinput += '5';
                              setState(() {
                                answerg = true;
                              });
                            }),
                        RoundButton(
                            title: '6',
                            onPress: () {
                              userinput += '6';
                              setState(() {
                                answerg = true;
                              });
                            }),
                        RoundButton(
                            title: '-',
                            color: Colors.deepOrange,
                            onPress: () {
                              checkFun(subtraction);
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        RoundButton(
                            title: '1',
                            onPress: () {
                              userinput += '1';
                              setState(() {
                                answerg = true;
                              });
                            }),
                        RoundButton(
                            title: '2',
                            onPress: () {
                              userinput += '2';
                              setState(() {
                                answerg = true;
                              });
                            }),
                        RoundButton(
                            title: '3',
                            onPress: () {
                              userinput += '3';
                              setState(() {
                                answerg = true;
                              });
                            }),
                        RoundButton(
                            title: '+',
                            color: Colors.deepOrange,
                            onPress: () {
                              checkFun(addition);
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        RoundButton(
                            title: '00',
                            onPress: () {
                              userinput += '00';
                              setState(() {
                                answerg = true;
                              });
                            }),
                        RoundButton(
                            title: '0',
                            onPress: () {
                              userinput += '0';
                              setState(() {
                                answerg = true;
                              });
                            }),
                        RoundButton(
                            title: '.',
                            onPress: () {
                              userinput += '.';
                              setState(() {
                                answerg = true;
                              });
                            }),
                        RoundButton(
                            title: '=',
                            color: Colors.deepOrange,
                            onPress: () {
                              fun();
                              answerg = false;
                              setState(() {});
                            }),
                      ],
                    ),
                  ],
                )),
          ],
        ));
  }

  void checkFun(String value) {
    if (useranswer == '') {
      userinput += value;
      setState(() {
        answerg = true;
      });
    } else if (useranswer != '') {
      userinput = '';
      userinput += '$useranswer$value';
      setState(() {
        answerg = true;
      });
    }
  }
}
