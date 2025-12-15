
import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/device/device_utility.dart';
import '../buttons/back_button.dart';

class FkAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;
  final Color? backgroundColor;
  final bool centerTitle;

  const FkAppBar({
    super.key,
    this.title,
    this.showBackArrow = false,
    this.leadingIcon,
    this.actions,
    this.leadingOnPressed,
    this.backgroundColor,
    this.centerTitle = true
  });

  @override
  Size get preferredSize => Size.fromHeight(FkDeviceUtils.getAppBarHeight());

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      iconTheme: const IconThemeData(color: FkColors.dark),
      backgroundColor: backgroundColor ?? FkColors.appColor,
      automaticallyImplyLeading: false,
      leading: showBackArrow
          ? Center(child: FkBackButton())
          : leadingIcon != null
          ? IconButton(
              onPressed: leadingOnPressed,
              icon: Icon(leadingIcon, color: FkColors.dark),
            )
          : null,

      title: title,
      // centerTitle: true,
      actions: actions,
    );
  }
}
