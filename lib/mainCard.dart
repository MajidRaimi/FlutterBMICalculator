import 'package:flutter/material.dart';


class MainCard extends StatelessWidget {
  MainCard({required this.child , required this.color}) ;

    final color ;
    final child ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(

        child: child,
        decoration: BoxDecoration(
          color: color ,
          borderRadius: BorderRadius.circular(25) ,
        ),
      ),
    );
  }
}
