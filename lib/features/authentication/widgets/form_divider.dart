import 'package:flutter/material.dart';
import 'package:my_events/utils/constants/colors.dart';

class FkFormDivider extends StatelessWidget {
  final String dividerText;
  final TextStyle? textStyle;

  const FkFormDivider({super.key, required this.dividerText, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(thickness: 0.5, color: FkColors.black, indent: 60, endIndent: 5)),
        Text(dividerText, style: textStyle ?? Theme.of(context).textTheme.labelMedium),
        Expanded(child: Divider(thickness: 0.5, color: FkColors.black, indent: 5, endIndent: 60)),
      ],
    );
  }
}
