import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_nfc_task/base/base_bloc.dart';
import 'package:flutter_nfc_task/base/base_state.dart';
import 'package:flutter_nfc_task/bloc/dashboard_main_bloc.dart';
import 'package:flutter_nfc_task/ui/home_screen.dart';
import 'package:flutter_nfc_task/utils/app_color.dart';
import 'package:flutter_nfc_task/utils/app_image.dart';
import 'package:flutter_nfc_task/utils/app_text_style.dart';
import 'package:flutter_nfc_task/utils/extensions.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardMain extends StatefulWidget {
  final int routeIndex;

  const DashboardMain({super.key, this.routeIndex = 0});

  @override
  State<DashboardMain> createState() => _DashboardMainState();
}

class _DashboardMainState extends BaseState<DashboardMain> {
  List<Widget> screens = [];
  final dashboardMainBloc = DashboardMainBloc();

  @override
  void initState() {
    screens = [
      const HomeScreen(),
      const HomeScreen(),
      const HomeScreen(),
      const HomeScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light, statusBarIconBrightness: Brightness.dark),
      ),
      bottomNavigationBar: StreamBuilder<int>(
        stream: dashboardMainBloc.selectedIndexSubject,
        initialData: 0,
        builder: (context, snapshot) {
          final selectedIndex = snapshot.data ?? 0;
          return Container(
            color: Colors.white,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColor.white,
                borderRadius:
                    BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
              ),
              padding: const EdgeInsets.only(bottom: 0, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  4,
                  (index) => SizedBox(
                    width: MediaQuery.sizeOf(context).width / 6,
                    child: getIconForIndex(index, selectedIndex),
                  ).onTap(() {
                    dashboardMainBloc.selectedIndexSubject.add(index);
                  }),
                ),
              ),
            ),
          );
        },
      ),
      body: StreamBuilder<int>(
          stream: dashboardMainBloc.selectedIndexSubject,
          builder: (context, snapshot) {
            return screens[dashboardMainBloc.selectedIndexSubject.value];
          }),
    );
  }

  Widget getIconForIndex(int index, int selectedIndex) {
    switch (index) {
      case 0:
        return setBottomIcons(
            iconIndex: index,
            selectedIndex: selectedIndex,
            iconName: AppImage.icHome.path(),
            screenName: 'Home');
      case 1:
        return setBottomIcons(
            iconIndex: index,
            selectedIndex: selectedIndex,
            iconName: AppImage.icCheckBox.path(),
            screenName: 'Bills');
      case 2:
        return setBottomIcons(
            iconIndex: index,
            selectedIndex: selectedIndex,
            iconName: AppImage.icStorage.path(),
            screenName: 'History');
      case 3:
        return setBottomIcons(
            iconIndex: index,
            selectedIndex: selectedIndex,
            iconName: AppImage.icPerson.path(),
            screenName: 'Profile');
      default:
        return const SizedBox.shrink();
    }
  }

  Widget setBottomIcons({
    required int iconIndex,
    required int selectedIndex,
    required String iconName,
    required String screenName,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            iconName,
            colorFilter: ColorFilter.mode(
              iconIndex == selectedIndex ? AppColor.primary : AppColor.secondary,
              BlendMode.srcIn,
            ),
          ),
          10.vs,
          Text(
            screenName,
            style: AppTextStyle.medium12TextStyle
                .copyWith(color: iconIndex == selectedIndex ? AppColor.primary : AppColor.secondary),
          ),
        ],
      ),
    );
  }

  @override
  BaseBloc? getBaseBloc() {
    return dashboardMainBloc;
  }
}
