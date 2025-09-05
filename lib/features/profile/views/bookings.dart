import 'package:flutter/material.dart';
import 'package:service_booking_app_new/core/constants/app_colors.dart';

import '../../../app/model/booking_model.dart';
import 'booking_content.dart';

class Bookings extends StatefulWidget {
  const Bookings({super.key});

  @override
  State<Bookings> createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  // 🔹 Dummy data — replace with API/DB data later.
  final List<BookingItem> upcomingBookings = const [
    BookingItem(day: "Friday",   date: "05/09/2025", service: "Haircut"),
    BookingItem(day: "Saturday", date: "06/09/2025", service: "Spa"),
    BookingItem(day: "Sunday",   date: "07/09/2025", service: "Beard Trim"),
    BookingItem(day: "Monday",   date: "08/09/2025", service: "Facial"),
  ];

  final List<BookingItem> pastBookings = const [
    BookingItem(day: "Tuesday",  date: "02/09/2025", service: "Massage"),
    BookingItem(day: "Monday",   date: "01/09/2025", service: "Facial"),
    BookingItem(day: "Sunday",   date: "31/08/2025", service: "Haircut"),
  ];

  final List<BookingItem> cancelledBookings = const [
    BookingItem(day: "Wednesday", date: "03/09/2025", service: "Pedicure"),
    BookingItem(day: "Thursday",  date: "04/09/2025", service: "Makeup"),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // three tabs
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'My Bookings',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: AppColors.primary,
            ),
          ),
          leading: const BackButton(color: AppColors.primary),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(70), // TabBar height
            child: Padding(
              padding: const EdgeInsets.only(top: 0), // space above TabBar
              child: const TabBar(
                labelColor: AppColors.primary,
                unselectedLabelColor: Colors.grey,
                indicatorColor: AppColors.primary,
                tabs: [
                  Tab(text: "Upcoming"),
                  Tab(text: "Past"),
                  Tab(text: "Cancelled"),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            BookingsContent(bookings: upcomingBookings),
            BookingsContent(bookings: pastBookings),
            BookingsContent(bookings: cancelledBookings),
          ],
        ),
      ),
    );
  }
}
