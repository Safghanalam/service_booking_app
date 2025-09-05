import 'package:flutter/material.dart';
import 'package:service_booking_app_new/features/Home/views/notification_screen.dart';
import 'package:service_booking_app_new/features/profile/views/personal_information.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/listtile.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Settings',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: AppColors.primary,
          ),
        ),
        leading: const BackButton(color: AppColors.primary),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// settings list
              SettingsTile(
                icon: Icons.language,
                color: Colors.pink,
                title: "Language",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PersonalInformation(),
                    ),
                  );
                },
              ),
              Divider(color: Colors.grey.withOpacity(0.5), thickness: 1),
              SettingsTile(
                icon: Icons.light_mode,
                color: Colors.amber,
                title: "Theme mode",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotificationScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
