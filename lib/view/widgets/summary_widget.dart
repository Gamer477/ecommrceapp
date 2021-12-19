import 'package:ecommrceapp/constants.dart';
import 'package:ecommrceapp/core/viewmodel/cart_view_model.dart';
import 'package:ecommrceapp/core/viewmodel/checkout_view_model.dart';
import 'package:ecommrceapp/view/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Summary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<CartViewModel>(
        builder: (controller) => Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              height: 350,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    width: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 150,
                          height: 180,
                          child: Image.network(
                            controller.cartProductModel[index].image!,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        RichText(
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          text: TextSpan(
                            text: controller.cartProductModel[index].name!,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomText(
                          alignment: Alignment.bottomLeft,
                          text:
                              '\$ ${controller.cartProductModel[index].price!.toString()}',
                          color: primaryColor,
                        ),
                      ],
                    ),
                  );
                },
                itemCount: controller.cartProductModel.length,
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 15,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                text: 'Shipping Address',
                fontSize: 24,
              ),
            ),
            GetBuilder<CheckoutViewModel>(
              builder: (controller) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomText(
                  fontSize: 24,
                  color: Colors.grey,
                  text:
                      '${controller.street1! + ', ' + controller.street2! + ', ' + controller.state! + ', ' + controller.city! + ', ' + controller.country!}',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
