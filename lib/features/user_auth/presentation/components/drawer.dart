import 'package:agrilink/features/user_auth/presentation/components/my_list_tile.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final void Function()? onProfileTap;
  final void Function()? onSignOut;
  final void Function()? onHomeTap;
  final void Function()? onSettingsTap;
  const MyDrawer(
      {super.key,
      required this.onProfileTap,
      required this.onSignOut,
      required this.onSettingsTap,
      this.onHomeTap});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: const Color.fromARGB(255, 210, 230, 215),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(children: [
              //header
              const DrawerHeader(
                child: Icon(Icons.person, color: Colors.black, size: 80),
              ),

              //home list tile
              MyListTile(
                icon: Icons.home,
                text: 'H O M E',
                onTap: () => Navigator.pop(context),
              ),

              //profile list tile
              MyListTile(
                icon: Icons.person,
                text: 'P R O F I L E',
                onTap: onProfileTap ?? () {},
              ),

              //profile list tile
              MyListTile(
                icon: Icons.settings,
                text: 'S E T T I N G S',
                onTap: onSettingsTap ?? () {},
              ),
            ]),

            //logout list tile
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: MyListTile(
                icon: Icons.logout,
                text: 'L O G O U T',
                onTap: onSignOut ?? () {},
              ),
            ),
          ],
        ));
  }
}
