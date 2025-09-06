import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:service_booking_app_new/core/helpers.dart';
import 'package:service_booking_app_new/features/Home/views/notification_screen.dart';
import 'package:service_booking_app_new/features/auth/views/login.dart';
import 'package:service_booking_app_new/features/profile/views/bookings.dart';
import 'package:service_booking_app_new/features/profile/views/personal_information.dart';
import 'package:service_booking_app_new/features/profile/views/settings.dart';
import 'package:service_booking_app_new/features/profile/views/support.dart';

import '../../../app/provider/auth_provider.dart';
import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/listtile.dart';

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

  Future<void> _handleLogout(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Confirm Logout'),
        content: const Text(
          'Are you sure you want to log out from all devices?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: const Text('Logout'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    final authProvider = context.read<AuthProvider>();
    final success = await authProvider.logout();

    if (success) {
      // Navigate to login screen and clear back stack
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const Login()),
            (route) => false,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Logout failed. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // show loader until data is fetched
    if (userDataJson == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final authProvider = context.watch<AuthProvider>();

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
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// user info
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: userDataJson?['avatar'] != null
                        ? NetworkImage(userDataJson!['avatar'])
                        : null,
                    child: userDataJson?['avatar'] == null
                        ? const Icon(Icons.person, size: 30)
                        : null,
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            userDataJson?['first_name'] ?? 'Verified',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            userDataJson?['last_name'] ?? 'User',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        userDataJson?['phone'] ?? 'No phone available',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 15),
              Divider(color: Colors.grey.withOpacity(0.5), thickness: 1),

              const SizedBox(height: 15),

              /// settings list
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

              /// logout
              InkWell(
                onTap: authProvider.isLoading
                    ? null
                    : () => _handleLogout(context),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.red.withOpacity(0.2),
                      child: authProvider.isLoading
                          ? const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.red,
                        ),
                      )
                          : const Icon(Icons.logout, color: Colors.red),
                    ),
                    const SizedBox(width: 16),
                    const Text(
                      'Logout',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
