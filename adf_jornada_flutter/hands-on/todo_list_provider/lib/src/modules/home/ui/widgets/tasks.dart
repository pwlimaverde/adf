import 'package:flutter/material.dart';

class Tasks extends StatelessWidget {
  const Tasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            // spreadRadius: 2,
            // blurRadius: 5,
            // offset: Offset(0, 3),
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(10),
      child: IntrinsicHeight(
        child: ListTile(
          leading: Checkbox(
            value: true,
            onChanged: (value) {},
          ),
          title: Text(
            'Descrição da TASK',
            style: TextStyle(decoration: true ? TextDecoration.lineThrough:null),
          ),
          subtitle: Text(
            '27/10/2024',
            style: TextStyle(decoration: true ? TextDecoration.lineThrough:null),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(width: 1)
          ),
        ),
      ),
    );
  }
}
