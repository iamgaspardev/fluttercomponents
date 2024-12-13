import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class AppDrawer extends StatelessWidget {
  final Function(int) onTap;

  const AppDrawer({required this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Center(
              child: Text(
                'Malaria Survillance \n in Zanzibar',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Ionicons.home_sharp),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
              onTap(0);
            },
          ),
          ListTile(
            leading: const Icon(Ionicons.analytics),
            title: const Text('Analytics'),
            onTap: () {
              Navigator.pop(context);
              onTap(1);
            },
          ),
          ListTile(
            leading: const Icon(Ionicons.settings_sharp),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
              onTap(2);
            },
          ),
        ],
      ),
    );
  }
}
