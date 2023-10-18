import 'package:flutter/material.dart';

class FinanceBox extends StatelessWidget {
  final String text;
  final int amount;
  final int percentage;
  final Color color;

  FinanceBox({
    required this.text,
    required this.amount,
    required this.percentage,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      height: 120,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.only(left: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text, style: TextStyle(color: Colors.white, fontSize: 16)),
          Text("Rs. $amount", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
          Row(
            children: [
              Icon(percentage > 0 ? Icons.arrow_upward : Icons.arrow_downward,
                  size: 16,
                  color: Colors.white),
              Text("$percentage%", style: TextStyle(color: Colors.white, fontSize: 16)),
            ],
          ),
        ],
      ),
    );
  }
}
