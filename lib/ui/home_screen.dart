import 'package:flutter/material.dart';
import 'package:flutter_nfc_task/component/app_text_button.dart';
import 'package:flutter_nfc_task/component/user_detail_card_view.dart';
import 'package:flutter_nfc_task/ui/premium_bottom_sheet.dart';
import 'package:flutter_nfc_task/utils/app_color.dart';
import 'package:flutter_nfc_task/utils/app_image.dart';
import 'package:flutter_nfc_task/utils/app_text_style.dart';
import 'package:flutter_nfc_task/utils/extensions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            qrComponent(),
            const UserDetailCardView(),
            userName(),
            typesOfPayments(),
          ],
        ),
      ),
    );
  }

  Widget qrComponent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const AppTextButton(buttonName: 'Get QR', imageName: Icons.file_download_outlined),
        20.hs,
        Image.asset(AppImage.icFakeQr.pathPNG(), height: 70, width: 70),
        20.hs,
        const AppTextButton(buttonName: 'Scan QR', imageName: Icons.camera_alt),
      ],
    );
  }

  Widget userName() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Align(
        alignment: Alignment.topLeft,
        child:
            Text('Hello, Kishan', style: AppTextStyle.bold26TextStyle.copyWith(color: AppColor.black)),
      ),
    );
  }

  Widget typesOfPayments() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      childAspectRatio: 1.5,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(4, (index) {
        return itemTypesOfPayment(name: 'Pay to contact', icon: Icons.wallet_sharp).onTap(() {
          showModalBottomSheet(
              context: context,
              enableDrag: true,
              isScrollControlled: true,
              builder: (context) => Padding(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: const PremiumBottomSheet(),
                  ),
              backgroundColor: AppColor.white,
              elevation: 100,
              isDismissible: false);
        });
      }),
    );
  }

  Widget itemTypesOfPayment({
    required IconData icon,
    required String name,
  }) {
    return Container(
      decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(16)),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: AppColor.primary, size: 20),
          10.vs,
          Text(name, style: AppTextStyle.bold16TextStyle.copyWith(color: AppColor.black)),
        ],
      ),
    );
  }
}
