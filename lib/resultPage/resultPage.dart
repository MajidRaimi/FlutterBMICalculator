import 'package:bmichallenge/const.dart';
import 'package:bmichallenge/mainCard.dart';
import 'package:flutter/material.dart';
import 'package:bmichallenge/mainPage/homePage.dart';
import '';

class ResultPage extends StatelessWidget {

  ResultPage({required this.bmiResult , required this.resultText , required this.interpretation}) ;

   final String bmiResult ;
   final String resultText ;
   final String interpretation ;





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Your Result :",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Pacifico",
                        fontSize: 35),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: MainCard(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      resultText ,
                      style: TextStyle(
                        color: Colors.green,
                        fontFamily: "Pacifico",
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      bmiResult ,
                      style: TextStyle(
                          fontSize: 70,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      interpretation ,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: "Pacifico"),
                    )
                  ],
                ),
                color: kActiveButtonColor,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
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
                      "Recalculate",
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
      ),
    );;
  }
}

