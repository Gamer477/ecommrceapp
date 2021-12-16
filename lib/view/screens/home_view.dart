import 'package:ecommrceapp/constants.dart';
import 'package:ecommrceapp/core/viewmodel/control_view_model.dart';
import 'package:ecommrceapp/core/viewmodel/home_view_model.dart';
import 'package:ecommrceapp/view/screens/login_screen.dart';
import 'package:ecommrceapp/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  final List<String> names = <String>[
    'G',
    'S',
    'F',
    'R',
    'W',
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                    top: 80,
                    left: 20,
                    right: 20,
                  ),
                  child: Column(
                    children: [
                      _serachTextFormField(),
                      SizedBox(
                        height: 30,
                      ),
                      CustomText(
                        text: 'Categories',
                        fontSize: 18,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      _listViewCategory(),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: 'Best Selling',
                            fontSize: 18,
                          ),
                          CustomText(
                            text: 'See All',
                            fontSize: 18,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      _listViewProduct(),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget _serachTextFormField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade200,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _listViewCategory() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 100,
        child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(
            width: 20,
          ),
          itemCount: controller.categoryModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey.shade100,
                  ),
                  height: 60,
                  width: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        Image.network(controller.categoryModel[index].image!),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomText(
                  text: controller.categoryModel[index].name!,
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _listViewProduct() {
    return Container(
      height: 350,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          width: 20,
        ),
        itemCount: names.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey.shade100,
                  ),
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 220,
                    child: Image.asset(
                      'assets/images/Image.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                CustomText(
                  text: 'BoePlay Speaker',
                  alignment: Alignment.bottomLeft,
                ),
                SizedBox(
                  height: 5,
                ),
                CustomText(
                  text: 'Bang and Olufsen',
                  color: Colors.grey,
                  alignment: Alignment.bottomLeft,
                ),
                SizedBox(
                  height: 5,
                ),
                CustomText(
                  text: '\$750',
                  color: primaryColor,
                  alignment: Alignment.bottomLeft,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
