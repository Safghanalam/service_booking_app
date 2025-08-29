import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notifications = [
      {
        "title": "Your recent transaction of \$570.00 at Pizzapoint has been successfully completed.",
        "time": "10m ago",
        "icon": Icons.local_pizza,
        "color": Colors.orange,
      },
      {
        "title": "John requested a payment of \$50.00",
        "time": "9:33 AM",
        "icon": Icons.payment,
        "color": Colors.blue,
        "action": "Pay",
      },
      {
        "title": "Your recent transaction of \$230.00 at Chaishai has been successfully completed.",
        "time": "9:10 AM",
        "icon": Icons.local_cafe,
        "color": Colors.green,
      },
      {
        "title": "Your monthly account statement for April 2024 is now available.",
        "time": "7:00 AM",
        "icon": Icons.description,
        "color": Colors.indigo,
      },
      {
        "title": "Your new credit card ending in 2688 has been successfully activated.",
        "time": "7:43 PM",
        "icon": Icons.credit_card,
        "color": Colors.brown,
      },
      {
        "title": "Your account balance has been updated. Current balance: \$10,689.37",
        "time": "4:18 PM",
        "icon": Icons.account_balance_wallet,
        "color": Colors.black,
      },
      {
        "title": "Exclusive offer for you! Get 1% cashback on your next grocery purchases using your HDFC credit card.",
        "time": "Apr 20, 2024 at 05:05 PM",
        "icon": Icons.local_offer,
        "color": Colors.red,
      },
      {
        "title": "Your bill payment to Electric board has been processed successfully.",
        "time": "Apr 25, 2024 at 11:46 AM",
        "icon": Icons.bolt,
        "color": Colors.yellow.shade800,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Notifications',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: AppColors.primary),
        ),
        leading: const BackButton(color: AppColors.primary),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 20),
        itemBuilder: (context, index) {
          final item = notifications[index];
          return Card(
            elevation: 0,
            margin: const EdgeInsets.symmetric(vertical: 6),
            color: Colors.white,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: (item["color"] as Color).withOpacity(0.2),
                child: Icon(item["icon"] as IconData,
                    color: item["color"] as Color),
              ),
              title: Text(item["title"] as String,
                  style: const TextStyle(fontSize: 13)),
              subtitle: Text(item["time"] as String,
                  style: const TextStyle(fontSize: 12, color: Colors.grey)),
              trailing: item.containsKey("action")
                  ? ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 14, vertical: 6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  item["action"] as String,
                  style: const TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              )
                  : null,
            ),
          );
        },
      ),
    );
  }
}
