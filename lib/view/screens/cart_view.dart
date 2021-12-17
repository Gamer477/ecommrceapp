import 'package:ecommrceapp/constants.dart';
import 'package:ecommrceapp/core/viewmodel/cart_view_model.dart';
import 'package:ecommrceapp/view/widgets/custom_button.dart';
import 'package:ecommrceapp/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<CartViewModel>(
              init: Get.put(CartViewModel()),
              builder: (controller) => Container(
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                    height: 15,
                  ),
                  itemCount: controller.cartProductModel.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 140,
                      child: Row(
                        children: [
                          Container(
                            width: 140,
                            child: Image.network(
                              controller.cartProductModel[index].image!,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text:
                                      controller.cartProductModel[index].name!,
                                  fontSize: 24,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CustomText(
                                  color: primaryColor,
                                  text:
                                      '\$ ${controller.cartProductModel[index].price!.toString()}',
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: 140,
                                  color: Colors.grey.shade200,
                                  height: 40,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          controller.increaseQuantitiy(index);
                                        },
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      CustomText(
                                        alignment: Alignment.center,
                                        fontSize: 20,
                                        color: Colors.black,
                                        text:
                                            '${controller.cartProductModel[index].quantity!}',
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(bottom: 20),
                                        child: GestureDetector(
                                          onTap: () {
                                            controller.decreaseQuantitiy(index);
                                          },
                                          child: Icon(
                                            Icons.minimize,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 5, top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    CustomText(
                      text: "PRICE",
                      fontSize: 22,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GetBuilder<CartViewModel>(
                      builder: (controller) => CustomText(
                        text: '\$ ${controller.totalPrice}',
                        color: primaryColor,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  width: 180,
                  height: 100,
                  child: CustomButton(
                    buttonText: 'CHECKOUT',
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
