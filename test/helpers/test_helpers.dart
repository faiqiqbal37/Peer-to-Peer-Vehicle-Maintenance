import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:disertation/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:disertation/services/authentication_service.dart';
import 'package:disertation/services/registration_service.dart';
import 'package:disertation/services/services_service.dart';
import 'package:disertation/services/cars_service_service.dart';
import 'package:disertation/services/booking_service.dart';
import 'package:disertation/services/customer_service.dart';
import 'package:disertation/services/service_provider_service.dart';
// @stacked-import

import 'test_helpers.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<NavigationService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<BottomSheetService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DialogService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<AuthenticationService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<RegistrationService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<ServicesService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<CarsServiceService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<BookingService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<CustomerService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<ServiceProviderService>(onMissingStub: OnMissingStub.returnDefault),
// @stacked-mock-spec
])
void registerServices() {
  getAndRegisterNavigationService();
  getAndRegisterBottomSheetService();
  getAndRegisterDialogService();
  getAndRegisterAuthenticationService();
  getAndRegisterRegistrationService();
  getAndRegisterServicesService();
  getAndRegisterCarsServiceService();
  getAndRegisterBookingService();
  getAndRegisterCustomerService();
  getAndRegisterServiceProviderService();
// @stacked-mock-register
}

MockNavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

MockBottomSheetService getAndRegisterBottomSheetService<T>({
  SheetResponse<T>? showCustomSheetResponse,
}) {
  _removeRegistrationIfExists<BottomSheetService>();
  final service = MockBottomSheetService();

  when(service.showCustomSheet<T, T>(
    enableDrag: anyNamed('enableDrag'),
    enterBottomSheetDuration: anyNamed('enterBottomSheetDuration'),
    exitBottomSheetDuration: anyNamed('exitBottomSheetDuration'),
    ignoreSafeArea: anyNamed('ignoreSafeArea'),
    isScrollControlled: anyNamed('isScrollControlled'),
    barrierDismissible: anyNamed('barrierDismissible'),
    additionalButtonTitle: anyNamed('additionalButtonTitle'),
    variant: anyNamed('variant'),
    title: anyNamed('title'),
    hasImage: anyNamed('hasImage'),
    imageUrl: anyNamed('imageUrl'),
    showIconInMainButton: anyNamed('showIconInMainButton'),
    mainButtonTitle: anyNamed('mainButtonTitle'),
    showIconInSecondaryButton: anyNamed('showIconInSecondaryButton'),
    secondaryButtonTitle: anyNamed('secondaryButtonTitle'),
    showIconInAdditionalButton: anyNamed('showIconInAdditionalButton'),
    takesInput: anyNamed('takesInput'),
    barrierColor: anyNamed('barrierColor'),
    barrierLabel: anyNamed('barrierLabel'),
    customData: anyNamed('customData'),
    data: anyNamed('data'),
    description: anyNamed('description'),
  )).thenAnswer((realInvocation) =>
      Future.value(showCustomSheetResponse ?? SheetResponse<T>()));

  locator.registerSingleton<BottomSheetService>(service);
  return service;
}

MockDialogService getAndRegisterDialogService() {
  _removeRegistrationIfExists<DialogService>();
  final service = MockDialogService();
  locator.registerSingleton<DialogService>(service);
  return service;
}

MockAuthenticationService getAndRegisterAuthenticationService() {
  _removeRegistrationIfExists<AuthenticationService>();
  final service = MockAuthenticationService();
  locator.registerSingleton<AuthenticationService>(service);
  return service;
}

MockRegistrationService getAndRegisterRegistrationService() {
  _removeRegistrationIfExists<RegistrationService>();
  final service = MockRegistrationService();
  locator.registerSingleton<RegistrationService>(service);
  return service;
}

MockServicesService getAndRegisterServicesService() {
  _removeRegistrationIfExists<ServicesService>();
  final service = MockServicesService();
  locator.registerSingleton<ServicesService>(service);
  return service;
}

MockCarsServiceService getAndRegisterCarsServiceService() {
  _removeRegistrationIfExists<CarsServiceService>();
  final service = MockCarsServiceService();
  locator.registerSingleton<CarsServiceService>(service);
  return service;
}

MockBookingService getAndRegisterBookingService() {
  _removeRegistrationIfExists<BookingService>();
  final service = MockBookingService();
  locator.registerSingleton<BookingService>(service);
  return service;
}

MockCustomerService getAndRegisterCustomerService() {
  _removeRegistrationIfExists<CustomerService>();
  final service = MockCustomerService();
  locator.registerSingleton<CustomerService>(service);
  return service;
}

MockServiceProviderService getAndRegisterServiceProviderService() {
  _removeRegistrationIfExists<ServiceProviderService>();
  final service = MockServiceProviderService();
  locator.registerSingleton<ServiceProviderService>(service);
  return service;
}
// @stacked-mock-create

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
