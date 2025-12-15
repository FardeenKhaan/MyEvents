import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/constants/sizes.dart';

class LogoutAlertDialog extends StatelessWidget {
  const LogoutAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(FkSizes.borderRadiusLg),
      ),
      child: Container(
        padding: const EdgeInsets.all(FkSizes.defaultSpace),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(FkSizes.borderRadiusLg),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Icon
            Container(
              padding: const EdgeInsets.all(FkSizes.defaultSpace),
              decoration: BoxDecoration(
                color: Colors.orange.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.logout,
                size: 40,
                color: Colors.orange,
              ),
            ),

            const SizedBox(height: 15),

            /// Title
            Text(
              "Logout?",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: FkSizes.spaceBtwItems),

            /// Description
            Text(
              "Are you sure you want to logout from your account?",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.black54),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: FkSizes.spaceBtwSections / 1.5),

            /// Buttons
            Row(
              children: [
                /// Cancel
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Get.back(result: false),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.grey),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(FkSizes.borderRadiusLg / 1.5),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(color: Colors.black87),
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                /// Logout
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Get.back(result: true),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(FkSizes.borderRadiusLg / 1.5),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text(
                      "Logout",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}