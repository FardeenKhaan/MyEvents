
import 'package:flutter/cupertino.dart';

import '../../utils/constants/sizes.dart';

class FkPadding {


  static const EdgeInsetsGeometry screenPadding = EdgeInsets.all(FkSizes.defaultSpace);

  static const EdgeInsetsGeometry screenPaddingWithoutTop = EdgeInsets.only(
      left: FkSizes.defaultSpace,
      right: FkSizes.defaultSpace,
      bottom: FkSizes.defaultSpace,
  );

  static const EdgeInsetsGeometry screenHorizontalPadding = EdgeInsets.symmetric(horizontal: FkSizes.defaultSpace);
}