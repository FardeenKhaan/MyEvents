import 'package:flutter/material.dart';

import '../../utils/constants/sizes.dart';

class FkSpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: FkSizes.appBarHeight,
    left: FkSizes.defaultSpace,
    bottom: FkSizes.defaultSpace,
    right: FkSizes.defaultSpace,
  );

  static const EdgeInsetsGeometry paddingOfChatRoomScreen = EdgeInsets.only(
    left: FkSizes.defaultSpace,
    right: FkSizes.defaultSpace,
    bottom: FkSizes.defaultSpace,
    top: 0,
  );
}
