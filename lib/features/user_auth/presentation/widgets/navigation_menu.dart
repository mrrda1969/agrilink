//import 'package:demo_app/features/user_auth/presentation/pages/chat_page.dart';
import 'package:agrilink/features/user_auth/presentation/pages/farmers_page.dart';
import 'package:agrilink/features/user_auth/presentation/pages/home.dart';
import 'package:agrilink/features/user_auth/presentation/pages/investors_page.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
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
                      icon: Icon(Icons.message), label: "Chats"),
                  NavigationDestination(
                      icon: Icon(Icons.groups), label: "Farmer"),
                  NavigationDestination(
                      icon: Icon(Icons.monetization_on), label: "Investors"),
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
    const FarmersPage(),
    const InvestorsPage(),
  ];

  int get length => screens.length;
}
