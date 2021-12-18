import 'package:ecommrceapp/core/viewmodel/checkout_view_model.dart';
import 'package:ecommrceapp/helper/enum.dart';
import 'package:ecommrceapp/view/widgets/add_address_widget.dart';
import 'package:ecommrceapp/view/widgets/custom_button.dart';
import 'package:ecommrceapp/view/widgets/delivery_time_widget.dart';
import 'package:ecommrceapp/view/widgets/summary_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status_change/status_change.dart';

import '../../constants.dart';

class CheckOutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutViewModel>(
        init: CheckoutViewModel(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.white,
              elevation: 0.0,
              title: Text(
                "Order Status",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            backgroundColor: Colors.white,
            body: Column(
              children: [
                Expanded(
                  child: Container(
                    child: StatusChange.tileBuilder(
                      theme: StatusChangeThemeData(
                        direction: Axis.horizontal,
                        connectorTheme:
                            ConnectorThemeData(space: 1.0, thickness: 1.0),
                      ),
                      builder: StatusChangeTileBuilder.connected(
                        itemWidth: (_) =>
                            MediaQuery.of(context).size.width /
                            _processes.length,
                        contentWidgetBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              'add content here',
                              style: TextStyle(
                                color: Colors
                                    .blue, // change color with dynamic color --> can find it with example section
                              ),
                            ),
                          );
                        },
                        nameWidgetBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(20),
                            child: Text(
                              'your text ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: controller.getColor(index),
                              ),
                            ),
                          );
                        },
                        indicatorWidgetBuilder: (_, index) {
                          if (index <= controller.index) {
                            return DotIndicator(
                              size: 35.0,
                              border: Border.all(color: Colors.green, width: 1),
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return OutlinedDotIndicator(
                              size: 30,
                              borderWidth: 1.0,
                              color: todoColor,
                            );
                          }
                        },
                        lineWidgetBuilder: (index) {
                          if (index > 0) {
                            if (index == controller.index) {
                              final prevColor = controller.getColor(index - 1);
                              final color = controller.getColor(index);
                              var gradientColors;
                              gradientColors = [
                                prevColor,
                                Color.lerp(prevColor, color, 0.5)
                              ];
                              return DecoratedLineConnector(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: gradientColors,
                                  ),
                                ),
                              );
                            } else {
                              return SolidLineConnector(
                                color: controller.getColor(index),
                              );
                            }
                          } else {
                            return null;
                          }
                        },
                        itemCount: _processes.length,
                      ),
                    ),
                  ),
                ),
                controller.pages == Pages.DeliveryTime
                    ? DeliveryTime()
                    : controller.pages == Pages.AddAddress
                        ? AddAddress()
                        : Summary(),
                Container(
                  width: 200,
                  height: 100,
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.bottomRight,
                  child: CustomButton(
                    buttonText: 'NEXT',
                    onPressed: () {
                      controller.changeIndex(controller.index + 1);
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }
}

final _processes = [
  'Order Signed',
  'Order Processed',
  'Shipped ',
  'Out for delivery ',
  'Delivered ',
];

final _content = [
  '20/18',
  '20/18',
  '20/18',
  '20/18',
  '20/18',
];
