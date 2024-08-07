import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:disertation/models/customer/customer.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/serviceprovider/serviceprovider.dart';

class RegistrationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> registerServiceProvider(ServiceProvider serviceProvider) async {
    try {
      // Register the user using FirebaseAuth
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: serviceProvider.email,
        password: serviceProvider.password,
      );

      // Extract the User from the UserCredential
      User? user = userCredential.user;

      if (user != null) {
        // Prepare the data to be saved in Firestore
        final userData = {
          'id': user.uid, // Use Firebase Auth UID as the unique ID
          'firstname': serviceProvider.firstname,
          'lastname': serviceProvider.lastname,
          'email': serviceProvider.email,
          'password': serviceProvider.password,
          'businessName': serviceProvider.businessName,
          'phoneNumber': serviceProvider.phoneNumber,
          'location': serviceProvider.location,
          'approvalStatus': serviceProvider.approvalStatus ??
              false, // Default to false if not provided
        };

        // Save the additional user details in Firestore
        await _firestore
            .collection('serviceProviders')
            .doc(user.uid)
            .set(userData);
      }
    } catch (e) {
      print('Error registering service provider: $e');
      throw Exception('Failed to register service provider');
    }
  }

  Future<void> registerCustomer(Customer customer) async {
    try {
      // Register the user using FirebaseAuth
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: customer.email,
        password: customer.password,
      );

      // Extract the User from the UserCredential
      User? user = userCredential.user;

      if (user != null) {
        // Prepare the data to be saved in Firestore
        final userData = {
          'id': user.uid, // Use Firebase Auth UID as the unique ID
          'firstname': customer.firstname,
          'lastname': customer.lastname,
          'email': customer.email,
          'password': customer.password,
          'phoneNumber': customer.phoneNumber,
          'location': customer.location,
        };

        // Save the additional user details in Firestore
        await _firestore.collection('customers').doc(user.uid).set(userData);
      }
    } catch (e) {
      print('Error registering service provider: $e');
      throw Exception('Failed to register service provider');
    }
  }
}
