import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Profile',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: AppColors.primary),
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
                  // Profile Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage("assets/images/register.jpeg"),
                          ),
                          const SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Rohit Sharma",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.primary),
                              ),
                              Text(
                                "6388945674",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Icon(Icons.edit,
                          color: AppColors.primary, size: 20),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Search Bar
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: "Search Settings",
                        border: InputBorder.none,
                        suffixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  // Settings List
                  const SettingsTile(
                    icon: Icons.person,
                    color: Colors.pink,
                    title: "Personal Information",
                  ),
                  const SettingsTile(
                    icon: Icons.account_circle,
                    color: Colors.amber,
                    title: "Account Status",
                  ),
                  const SettingsTile(
                    icon: Icons.language,
                    color: Colors.purple,
                    title: "Language",
                  ),
                  const SettingsTile(
                    icon: Icons.public,
                    color: Colors.orange,
                    title: "Browser Settings",
                  ),
                  const SettingsTile(
                    icon: Icons.lock,
                    color: Colors.blue,
                    title: "Account Privacy",
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.red.withOpacity(0.2),
                        child: Icon(Icons.delete, color: Colors.red),
                      ),
                      const SizedBox(width: 16),
                      Text('Logout', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
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

  const SettingsTile({
    super.key,
    required this.icon,
    required this.color,
    required this.title,
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
      onTap: () {},
    );
  }
}
