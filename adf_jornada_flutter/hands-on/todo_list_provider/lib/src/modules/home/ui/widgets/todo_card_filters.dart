import 'package:flutter/material.dart';

import '../../../core/ui/utilites/theme_extensions.dart';

class TodoCardFilters extends StatefulWidget {
  const TodoCardFilters({super.key});

  @override
  State<TodoCardFilters> createState() => _TodoCardFiltersState();
}

class _TodoCardFiltersState extends State<TodoCardFilters> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: 120,
        maxWidth: 150,
      ),
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: context.primaryColor,
        border: Border.all(
          color: Colors.grey.withOpacity(0.8),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            '10 TASKS',
            style: context.titleStyle.copyWith(
              fontSize: 10,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Hoje',
            style: context.titleStyle.copyWith(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          FittedBox(
            alignment: Alignment.centerLeft,
            fit: BoxFit.scaleDown,
            child: Container(
              width: 110,
              height: 6,
              child: LinearProgressIndicator(
                backgroundColor: context.primaryColorLight,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                value: 0.4,
                color: Colors.white,
                minHeight: 5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
