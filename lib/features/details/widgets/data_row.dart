import 'package:flutter/material.dart';

class DetailsDataRow extends StatelessWidget {
  const DetailsDataRow({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 140, child: Text(title),),
        SizedBox(width: 32,),
        Flexible(child: Text(value),),
      ],
    );
  }
}
