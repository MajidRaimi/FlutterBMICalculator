import 'package:bmichallenge/const.dart';
import 'package:bmichallenge/mainCard.dart';
import 'package:bmichallenge/resultPage/resultPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmichallenge/calculatorBrain.dart';

enum Sex { male, female }

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int height = 160;
  int age = 20;
  int weight = 70;

  Color maleCardColor = kInactiveButtonColor;
  Color femaleCardColor = kInactiveButtonColor;

  void changeCardColor(Sex input) {
    input == Sex.male
        ? maleCardColor = kActiveButtonColor
        : maleCardColor = kInactiveButtonColor;
    input == Sex.female
        ? femaleCardColor = kActiveButtonColor
        : femaleCardColor = kInactiveButtonColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        title: Center(
          child: Text(
            "BMI Calculators",
            style: TextStyle(
              fontFamily: "Pacifico",
              fontWeight: FontWeight.bold,
              fontSize: 26,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        changeCardColor(Sex.male);
                      });
                    },
                    child: MainCard(
                      color: maleCardColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.male,
                            color: Colors.white,
                            size: 100,
                          ),
                          Text(
                            "MALE",
                            style: TextStyle(
                                color: kTextColor,
                                fontSize: 20,
                                fontFamily: "Pacifico"),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      changeCardColor(Sex.female);
                    });
                  },
                  child: MainCard(
                    color: femaleCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.female,
                          color: Colors.white,
                          size: 100,
                        ),
                        Text(
                          "FEMALE",
                          style: TextStyle(
                              color: kTextColor,
                              fontSize: 20,
                              fontFamily: "Pacifico"),
                        )
                      ],
                    ),
                  ),
                )),
              ],
            ),
          ),
          Expanded(
            child: MainCard(
              color: kActiveButtonColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: TextStyle(
                        color: kTextColor,
                        fontSize: 15,
                        fontFamily: "Pacifico"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "cm",
                        style: TextStyle(
                            fontFamily: "Pacifico",
                            color: kTextColor,
                            fontSize: 20),
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: kCalculateButton,
                      thumbColor: kCalculateButton,
                      overlayColor: Color(0x15E83D66),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 20),
                    ),
                    child: Slider(
                        max: 220,
                        min: 120,
                        inactiveColor: kTextColor,
                        value: height.toDouble(),
                        onChanged: (double slideNumber) {
                          setState(
                            () {
                              height = slideNumber.round();
                            },
                          );
                        }),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MainCard(
                    color: kActiveButtonColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: TextStyle(
                              color: kTextColor,
                              fontSize: 13,
                              fontFamily: "Pacifico"),
                        ),
                        Text(
                          weight.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Transform.scale(
                              scale: 0.8,
                              child: FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                backgroundColor: kTextColor,
                                child: Icon(Icons.remove),
                              ),
                            ),
                            Transform.scale(
                              scale: 0.8,
                              child: FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                backgroundColor: kTextColor,
                                child: Icon(Icons.add),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: MainCard(
                    color: kActiveButtonColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: TextStyle(
                              color: kTextColor,
                              fontSize: 13,
                              fontFamily: "Pacifico"),
                        ),
                        Text(
                          age.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Transform.scale(
                              scale: 0.8,
                              child: FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                backgroundColor: kTextColor,
                                child: Icon(Icons.remove),
                              ),
                            ),
                            Transform.scale(
                              scale: 0.8,
                              child: FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                backgroundColor: kTextColor,
                                child: Icon(Icons.add),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: GestureDetector(
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(weight: weight, height: height);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ResultPage(
                        bmiResult: calc.calculateBMI(),
                        resultText: calc.getResults(),
                        interpretation: calc.getInterpretation(),
                      );
                    },
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: 70,
                decoration: BoxDecoration(
                  color: kCalculateButton,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Center(
                  child: Text(
                    "Calculate",
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: "Pacifico",
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
