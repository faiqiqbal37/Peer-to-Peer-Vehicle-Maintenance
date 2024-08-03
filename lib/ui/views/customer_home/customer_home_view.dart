import 'package:disertation/ui/views/common_components/customer/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'booking_widget.dart';
import 'category_widget.dart';
import 'customer_home_viewmodel.dart';

class CustomerHomeView extends StackedView<CustomerHomeViewModel> {
  const CustomerHomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CustomerHomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Hi James!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search for Services.",
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10, // Number of items in the list
                itemBuilder: (context, index) {
                  return Container(
                    width: 400,
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    color: Colors.grey[300],
                    child: Image.network(
                      'https://via.placeholder.com/100', // Example image URL
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 30),
            Text('Service Categories',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  CategoryWidget(title: 'Electrical'),
                  CategoryWidget(title: 'Paint'),
                  CategoryWidget(title: 'Bodywork'),
                  CategoryWidget(title: 'Mechanical'),
                  CategoryWidget(title: 'Wrap'),
                ],
              ),
            ),
            SizedBox(height: 30),
            Text('Upcoming Booking',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            BookingWidget(
              service: 'AC Servicing',
              provider: 'Daniel Brown',
              date: '20/01/2024',
              price: 250,
              status: 'Completed',
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomerBottomNavigationBar(),
    );
  }

  @override
  CustomerHomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CustomerHomeViewModel();
}