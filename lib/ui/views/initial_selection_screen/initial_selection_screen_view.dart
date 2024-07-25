import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'initial_selection_screen_viewmodel.dart';

class InitialSelectionScreenView
    extends StackedView<InitialSelectionScreenViewModel> {
  const InitialSelectionScreenView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    InitialSelectionScreenViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Select the Portal',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
            ),
            SizedBox(height: 10),
            // Adding a row with two buttons
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: viewModel.navigateToCustomerLogin,
                  child: Text('Customer'),
                ),
                SizedBox(width: 8), // Spacing between the two buttons
                ElevatedButton(
                  onPressed: viewModel.navigateToServiceProviderLogin,
                  child: Text('Service Provider'),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                    width: 8), // Spacing defined earlier, assumed here as well
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  InitialSelectionScreenViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      InitialSelectionScreenViewModel();
}
