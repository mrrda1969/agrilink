import 'package:agrilink/features/user_auth/presentation/pages/farmers_page.dart';
import 'package:agrilink/features/user_auth/presentation/pages/home.dart';
import 'package:agrilink/features/user_auth/presentation/pages/investment_management_page.dart';
import 'package:agrilink/features/user_auth/presentation/pages/investors_page.dart';
import 'package:agrilink/features/user_auth/presentation/pages/posts_feed_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return DefaultTabController(
        length: controller.length,
        child: Scaffold(
          bottomNavigationBar: Obx(
            () => NavigationBar(
                height: 80,
                elevation: 0,
                selectedIndex: controller.selectedIndex.value,
                onDestinationSelected: (index) {
                  if (index >= 0 && index < controller.length) {
                    controller.selectedIndex.value = index;
                  }
                },
                destinations: const [
                  NavigationDestination(icon: Icon(Icons.home), label: "Home"),
                  NavigationDestination(
                      icon: Icon(Icons.agriculture), label: "Projects"),
                  NavigationDestination(
                      icon: Icon(Icons.message), label: "Chats"),
                  NavigationDestination(
                      icon: Icon(Icons.groups), label: "Farmers"),
                  NavigationDestination(
                      icon: Icon(Icons.monetization_on), label: "Investments"),
                ]),
          ),
          body: TabBarView(children: <Widget>[
            Obx(() => controller.screens[controller.selectedIndex.value])
          ]),
        ));
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomePage(),
    const PostsFeedPage(),
    const FarmersPage(),
    const InvestorsPage(),
    const InvestmentManagementPage(),
  ];

  int get length => screens.length;
}
