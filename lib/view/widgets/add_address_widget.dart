import 'package:ecommrceapp/core/viewmodel/checkout_view_model.dart';
import 'package:ecommrceapp/view/widgets/custom_text.dart';
import 'package:ecommrceapp/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutViewModel>(
      builder: (controller) => Form(
        key: controller.formState,
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  CustomText(
                    text: 'Billing Address is the same as Delivery Address',
                    fontSize: 20,
                    alignment: Alignment.center,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  CustomTextFormField(
                    onSave: (val) {
                      controller.street1 = val;
                    },
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'You Must Enter The Street 1';
                      }
                    },
                    text: 'Street 1',
                    hintText: '21, Alex Davidson Avenue',
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  CustomTextFormField(
                    onSave: (val) {
                      controller.street2 = val;
                    },
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'You Must Enter The Street 2';
                      }
                    },
                    text: 'Street 2',
                    hintText: 'Opposite Omegatron, Vincent Quarters',
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  CustomTextFormField(
                    text: 'City',
                    hintText: 'Victoria Island',
                    onSave: (val) {
                      controller.city = val;
                    },
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'You Must Enter The City';
                      }
                    },
                  ),
                  Container(
                    width: Get.width,
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: CustomTextFormField(
                              text: 'State',
                              hintText: 'Lagos State',
                              onSave: (val) {
                                controller.state = val;
                              },
                              validator: (val) {
                                if (val.isEmpty) {
                                  return 'You Must Enter The State';
                                }
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: CustomTextFormField(
                              text: 'Country',
                              hintText: 'Nigeria',
                              onSave: (val) {
                                controller.country = val;
                              },
                              validator: (val) {
                                if (val.isEmpty) {
                                  return 'You Must Enter The Country';
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
