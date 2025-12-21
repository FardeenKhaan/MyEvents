import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_events/common/widgets/appbar/app_reusable_appbar.dart';
import 'package:my_events/common/widgets/buttons/feature_provider_button.dart';
import 'package:my_events/features/home/controller/create_edit_event_controller.dart';
import 'package:my_events/utils/constants/sizes.dart';

class CreateEditEventScreen extends StatelessWidget {
  const CreateEditEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CreateEditEventController());

    return Scaffold(
      /// -----[AppBar]-----
      appBar: FkAppBar(
        showBackArrow: true,
        title: Obx(() => Text(controller.isEdit.value ? 'Edit Event' : 'Create Event')),
      ),

      /// -----[Body]-----
      body: Padding(
        padding: const EdgeInsets.all(FkSizes.defaultSpace),
        child: Form(
          key: controller.formKey,
          //-- form fields
          child: ListView(
            children: [
              TextFormField(
                controller: controller.title,
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (v) => v == null || v.length < 2 ? 'Min 2 chars' : null,
              ),
              const SizedBox(height: FkSizes.spaceBtwItems / 1.5),

              TextFormField(
                controller: controller.description,
                maxLines: 4,
                decoration: const InputDecoration(labelText: 'Description'),
                validator: (v) => v == null || v.length < 5 ? 'Min 5 chars' : null,
              ),
              const SizedBox(height: FkSizes.spaceBtwItems / 1.5),

              TextFormField(
                controller: controller.city,
                decoration: const InputDecoration(labelText: 'City'),
                validator: (v) => v == null || v.length < 2 ? 'Invalid city' : null,
              ),
              const SizedBox(height: FkSizes.spaceBtwItems / 1.5),

              TextFormField(
                controller: controller.date,
                decoration: const InputDecoration(labelText: 'Date', hintText: 'YYYY-MM-DD'),
                validator: (v) => v == null || v.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: FkSizes.spaceBtwSections),

              /// Submit Button
              Obx(
                () => Center(
                  child: FkElevatedButton(
                    width: double.infinity,
                    text: "Submit",
                    isLoading: controller.isLoading.value,
                    onPressed: controller.isLoading.value ? null : controller.submit,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
