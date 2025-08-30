import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:service_booking_app_new/core/helpers.dart';
import 'package:service_booking_app_new/features/Home/views/notification_screen.dart';
import 'package:service_booking_app_new/features/profile/views/bookings.dart';
import 'package:service_booking_app_new/features/profile/views/personal_information.dart';
import 'package:service_booking_app_new/features/profile/views/settings.dart';
import 'package:service_booking_app_new/features/profile/views/support.dart';

import '../../../core/constants/app_colors.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Map<String, dynamic>? userDataJson;

  Future<void> loadUserData() async {
    final helper = Helpers();
    final userData = await helper.getSharedPreferences(key: 'user');
    if (userData != null) {
      setState(() {
        userDataJson = jsonDecode(userData) as Map<String, dynamic>;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Profile',
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
        child: Stack(
          children: [
            // Main content
            SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(userDataJson!['avatar']),
                      ),
                      const SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userDataJson!['first_name'] ?? '',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                          ),
                          Text(
                            userDataJson!['phone'] ?? '',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  Divider(
                    color: Colors.grey.withOpacity(0.5), // Line color
                    thickness: 1, // Line thickness
                  ),

                  // // Search Bar
                  // Container(
                  //   padding: const EdgeInsets.symmetric(horizontal: 15),
                  //   decoration: BoxDecoration(
                  //     color: Colors.grey.shade200,
                  //     borderRadius: BorderRadius.circular(30),
                  //   ),
                  //   child: const TextField(
                  //     decoration: InputDecoration(
                  //       hintText: "Search Settings",
                  //       border: InputBorder.none,
                  //       suffixIcon: Icon(Icons.search),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(height: 15),

                  // Settings List
                  SettingsTile(
                    icon: Icons.person,
                    color: Colors.pink,
                    title: "Personal Information",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PersonalInformation(),
                        ),
                      );
                    },
                  ),
                  SettingsTile(
                    icon: Icons.notifications,
                    color: Colors.amber,
                    title: "Notifications",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NotificationScreen(),
                        ),
                      );
                    },
                  ),
                  SettingsTile(
                    icon: Icons.support,
                    color: Colors.purple,
                    title: "Support & Help",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Support(),
                        ),
                      );
                    },
                  ),
                  SettingsTile(
                    icon: Icons.book,
                    color: Colors.orange,
                    title: "My Bookings",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Bookings(),
                        ),
                      );
                    },
                  ),
                  SettingsTile(
                    icon: Icons.settings,
                    color: Colors.blue,
                    title: "Settings",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Settings(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.red.withOpacity(0.2),
                        child: Icon(Icons.delete, color: Colors.red),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        'Logout',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsTile extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final VoidCallback? onTap;

  const SettingsTile({
    super.key,
    required this.icon,
    required this.color,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color.withOpacity(0.2),
        child: Icon(icon, color: color),
      ),
      title: Text(title, style: const TextStyle(fontSize: 15)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 15),
      contentPadding: const EdgeInsets.symmetric(vertical: 2),
      onTap: onTap, // <-- use here
    );
  }
}
