import 'package:ecommrceapp/core/viewmodel/profile_view_model.dart';
import 'package:ecommrceapp/view/screens/login_screen.dart';
import 'package:ecommrceapp/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) => controller.loading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        top: 50,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                              image: DecorationImage(
                                image: controller.userModel == null
                                    ? AssetImage('assets/images/Avatar.png')
                                        as ImageProvider
                                    : controller.userModel.pic == 'default'
                                        ? AssetImage('assets/images/Avatar.png')
                                            as ImageProvider
                                        : NetworkImage(
                                            controller.userModel.pic!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              CustomText(
                                text: controller.userModel.name!,
                                color: Colors.black,
                                fontSize: 32,
                              ),
                              CustomText(
                                text: controller.userModel.email!,
                                color: Colors.black,
                                fontSize: 24,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Container(
                      child: FlatButton(
                        onPressed: () {},
                        child: ListTile(
                          title: CustomText(
                            text: 'Edit Profile',
                          ),
                          leading: Image.asset(
                              'assets/menuIcon/Icon_Edit-Profile.png'),
                          trailing: Icon(
                            Icons.navigate_next_outlined,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: FlatButton(
                        onPressed: () {},
                        child: ListTile(
                          title: CustomText(
                            text: 'Shipping Address',
                          ),
                          leading:
                              Image.asset('assets/menuIcon/Icon_Location.png'),
                          trailing: Icon(
                            Icons.navigate_next_outlined,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: FlatButton(
                        onPressed: () {},
                        child: ListTile(
                          title: CustomText(
                            text: 'Order History',
                          ),
                          leading:
                              Image.asset('assets/menuIcon/Icon_History.png'),
                          trailing: Icon(
                            Icons.navigate_next_outlined,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: FlatButton(
                        onPressed: () {},
                        child: ListTile(
                          title: CustomText(
                            text: 'Cards',
                          ),
                          leading:
                              Image.asset('assets/menuIcon/Icon_Payment.png'),
                          trailing: Icon(
                            Icons.navigate_next_outlined,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: FlatButton(
                        onPressed: () {},
                        child: ListTile(
                          title: CustomText(
                            text: 'Notifications',
                          ),
                          leading:
                              Image.asset('assets/menuIcon/Icon_Alert.png'),
                          trailing: Icon(
                            Icons.navigate_next_outlined,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: FlatButton(
                        onPressed: () {
                          controller.signOut();
                          Get.offAll(LoginView());
                        },
                        child: ListTile(
                          title: CustomText(
                            text: 'Log Out',
                          ),
                          leading: Image.asset('assets/menuIcon/Icon_Exit.png'),
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
