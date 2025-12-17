import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_events/common/widgets/appbar/app_reusable_appbar.dart';
import 'package:my_events/features/authentication/controller/login/login_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = LoginController.instance;
    return Scaffold(
      /// -----[AppBar]-----
      appBar: FkAppBar(
        title: Text('Home'),
        actions: [IconButton(onPressed: () => controller.logout(), icon: Icon(Iconsax.logout))],
      ),
    );
  }
}
