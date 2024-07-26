import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookingCard extends StatelessWidget {
  final String customerName;
  final String serviceName;
  final String date;
  final String location;
  final String status;

  BookingCard({
    required this.customerName,
    required this.serviceName,
    required this.date,
    required this.location,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Customer Name: $customerName', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Service Name: $serviceName'),
            SizedBox(height: 8),
            Text('Date: $date'),
            SizedBox(height: 8),
            Text('Location: $location'),
            SizedBox(height: 8),
            Text('Status: $status', style: TextStyle(color: status == 'Completed' ? Colors.green : Colors.red)),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Add logic to handle button press
                  },
                  child: Text(status == 'Completed' ? 'Mark as Pending' : 'Mark as Complete'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add logic for viewing more details
                  },
                  child: Text('View'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}