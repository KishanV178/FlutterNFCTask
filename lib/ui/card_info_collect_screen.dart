import 'package:flutter/material.dart';
import 'package:flutter_nfc_task/component/AppTextField.dart';
import 'package:flutter_nfc_task/component/app_button.dart';
import 'package:flutter_nfc_task/component/payment_card_view.dart';
import 'package:flutter_nfc_task/const/app_routes.dart';
import 'package:flutter_nfc_task/utils/app_color.dart';
import 'package:flutter_nfc_task/utils/app_image.dart';
import 'package:flutter_nfc_task/utils/app_text_style.dart';
import 'package:flutter_nfc_task/utils/extensions.dart';
import 'package:flutter_nfc_task/utils/route_manager.dart';

class CardInfoCollectScreen extends StatefulWidget {
  const CardInfoCollectScreen({super.key});

  @override
  State<CardInfoCollectScreen> createState() => _CardInfoCollectScreenState();
}

class _CardInfoCollectScreenState extends State<CardInfoCollectScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _cardExpiryController = TextEditingController();
  final TextEditingController _cardCVVController = TextEditingController();
  final TextEditingController _additionalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                Image.asset(
                  AppImage.icCardBg.pathPNG(),
                  width: double.infinity,
                  fit: BoxFit.cover,
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70.0, bottom: 30, left: 30),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        const Icon(Icons.arrow_circle_left_outlined, color: AppColor.white, size: 30)
                            .onTap(() {
                          AppRouteManager.pop();
                        }),
                        30.hs,
                        Text('Card details',
                            style: AppTextStyle.bold20TextStyle.copyWith(color: AppColor.white))
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
              height: MediaQuery.sizeOf(context).height,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              child: Column(
                children: [
                  const PaymentCardView(),
                  AppTextField(textEditingController: _firstNameController, hintText: 'First name'),
                  16.vs,
                  AppTextField(textEditingController: _lastNameController, hintText: 'Last name'),
                  16.vs,
                  AppTextField(textEditingController: _cardNumberController, hintText: 'Card number'),
                  16.vs,
                  Row(
                    children: [
                      Expanded(
                        child: AppTextField(
                            textEditingController: _cardExpiryController, hintText: 'MM/YY'),
                      ),
                      16.hs,
                      Expanded(
                          child:
                              AppTextField(textEditingController: _cardCVVController, hintText: 'CVV')),
                    ],
                  ),
                  16.vs,
                  AppTextField(
                      textEditingController: _additionalController, hintText: 'Additional info'),
                  16.vs,
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0, right: 50, top: 20),
                    child: AppButton(
                        buttonName: 'Send',
                        onTap: () {
                          AppRouteManager.pop();
                          AppRouteManager.pushNamed(AppRoutes.confirmationScreen);
                        }),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
