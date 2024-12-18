import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class BotaoLoginWith extends StatelessWidget {
  final void Function() ontap;
  final double whidth;
  final Color color;
  final IconData icon;
  final String label;

  const BotaoLoginWith({
    super.key,
    required this.ontap,
    required this.whidth,
    required this.color,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: whidth,
        height: 45.csh,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 30.csh,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: VerticalDivider(
                color: Colors.white,
                thickness: 2,
              ),
            ),
            SizedBox(width: 8.csh),
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.csh,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
