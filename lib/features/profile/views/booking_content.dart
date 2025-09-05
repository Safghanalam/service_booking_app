import 'package:flutter/material.dart';

import '../../../app/model/booking_model.dart';
import '../../../shared/widgets/booking_card.dart';

class BookingsContent extends StatelessWidget {
  final List<BookingItem> bookings;

  const BookingsContent({super.key, required this.bookings});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            for (final b in bookings)
              BookingCard(
                day: b.day,
                date: b.date,
                service: b.service,
                onTap: () {
                  // TODO: Navigate to booking details if you want
                  // Navigator.push(context, MaterialPageRoute(builder: (_) => BookingDetails(item: b)));
                },
              ),
          ],
        ),
      ),
    );
  }
}
