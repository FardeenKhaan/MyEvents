
import 'package:flutter/widgets.dart';

/// -- Used in Authentication phase
class UpperImage extends StatelessWidget {
  final String image;

  const UpperImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.30,
      width: double.infinity,
      child: Image.asset(image, fit: BoxFit.cover),
    );
  }
}
