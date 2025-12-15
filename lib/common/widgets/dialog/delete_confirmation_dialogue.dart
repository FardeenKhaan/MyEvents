import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/snackbar_helpers.dart';

class CartItemDeleteDialog extends StatelessWidget {
  const CartItemDeleteDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(FkSizes.borderRadiusLg)),
      child: Container(
        padding: const EdgeInsets.all(FkSizes.defaultSpace),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ///  Icon
            Container(
              padding: const EdgeInsets.all(FkSizes.defaultSpace),
              decoration: BoxDecoration(color: Colors.red.withValues(alpha: 0.1), shape: BoxShape.circle),
              child: const Icon(Icons.delete_outline, size: 40, color: Colors.red),
            ),

            const SizedBox(height: 15),

            /// Title
            Text(
              "Remove Item?",
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: FkSizes.spaceBtwItems),

            /// Description
            Text(
              "Are you sure you want to remove this item from your cart?",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black54),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: FkSizes.spaceBtwSections / 1.5),

            /// Buttons
            Row(
              children: [
                /// Cancel
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Get.back(),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.grey),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(FkSizes.borderRadiusLg / 1.5)),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text("Cancel", style: TextStyle(color: Colors.black87)),
                  ),
                ),

                const SizedBox(width: 12),

                /// Remove
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back();

                      FkSnackBarHelpers.showSnackBar('Item removed from cart');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(FkSizes.borderRadiusLg / 1.5)),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text("Remove", style: TextStyle(color: Colors.white)),
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
