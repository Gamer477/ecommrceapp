import 'package:ecommrceapp/constants.dart';
import 'package:ecommrceapp/helper/enum.dart';
import 'package:ecommrceapp/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class DeliveryTime extends StatefulWidget {
  @override
  State<DeliveryTime> createState() => _DeliveryTimeState();
}

class _DeliveryTimeState extends State<DeliveryTime> {
  Delivery delivery = Delivery.StandardDelivery;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          RadioListTile<Delivery>(
            value: Delivery.StandardDelivery,
            groupValue: delivery,
            onChanged: (Delivery? value) {
              setState(() {
                delivery = value!;
              });
            },
            title: CustomText(
              text: 'Standard Delivery',
              fontSize: 24,
            ),
            subtitle: CustomText(
              text: '\nOrder Will be Delivered between 3-5 Business Days',
              fontSize: 18,
            ),
            activeColor: primaryColor,
          ),
          SizedBox(
            height: 50,
          ),
          RadioListTile<Delivery>(
            value: Delivery.NextDayDelivery,
            groupValue: delivery,
            onChanged: (Delivery? value) {
              setState(() {
                delivery = value!;
              });
            },
            title: CustomText(
              text: 'Next Day Delivery',
              fontSize: 24,
            ),
            subtitle: CustomText(
              text:
                  '\nPlace Your Order before 6pm and your items will be delivered the next Day',
              fontSize: 18,
            ),
            activeColor: primaryColor,
          ),
          SizedBox(
            height: 50,
          ),
          RadioListTile<Delivery>(
            value: Delivery.NominatedDelivery,
            groupValue: delivery,
            onChanged: (Delivery? value) {
              setState(() {
                delivery = value!;
              });
            },
            title: CustomText(
              text: 'Nominated Delivery',
              fontSize: 24,
            ),
            subtitle: CustomText(
              text:
                  '\nPick a particular date From the calendar and order will be delivered on Selected Date',
              fontSize: 18,
            ),
            activeColor: primaryColor,
          )
        ],
      ),
    );
  }
}
