import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:my_events/routes/app_routes.dart';
import 'package:my_events/utils/constants/image_strings.dart';
import 'package:my_events/utils/storage/secure_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _visible = true;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   FlutterNativeSplash.remove();
    // });

    _startBlinking();
    _navigateToHome();
  }

  void _startBlinking() {
    _timer = Timer.periodic(const Duration(milliseconds: 300), (timer) {
      if (timer.tick <= 6) {
        setState(() => _visible = !_visible);
      } else {
        timer.cancel();
        setState(() => _visible = true);
      }
    });
  }

  void _navigateToHome() {
    Future.delayed(const Duration(seconds: 2), () async {
      // getIt<UserSession>().redirectUser();
      // getIt<ApiServices>().initializeOptions();
      // Get.toNamed(AppRoutes.loginScreen);
      final token = await SecureStorage.getToken();

      Future.delayed(const Duration(seconds: 2), () {
        if (token != null) {
          Get.offAllNamed(AppRoutes.homeScreen);
        } else {
          Get.offAllNamed(AppRoutes.loginScreen);
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF6BCF63), Color(0xFFF2E74B), Color(0xFFF28C28)],
          ),
        ),
        child: Center(
          child: AnimatedOpacity(
            opacity: _visible ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            child: Image.asset(FkImages.splashLogo, width: 300),
          ),
        ),
      ),
    );
  }
}
