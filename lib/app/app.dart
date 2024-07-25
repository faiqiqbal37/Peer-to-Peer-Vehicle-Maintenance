import 'package:disertation/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:disertation/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:disertation/ui/views/home/home_view.dart';
import 'package:disertation/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:disertation/ui/views/login/login_view.dart';
import 'package:disertation/services/authentication_service.dart';
import 'package:disertation/ui/views/service_provider_home_screen/service_provider_home_screen_view.dart';
import 'package:disertation/ui/views/service_provider_register/service_provider_register_view.dart';
import 'package:disertation/ui/views/customer_register/customer_register_view.dart';
import 'package:disertation/ui/views/initial_selection_screen/initial_selection_screen_view.dart';
import 'package:disertation/ui/views/login_service_provider/login_service_provider_view.dart';
import 'package:disertation/ui/views/service_provider_profile/service_provider_profile_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: ServiceProviderHomeScreenView),
    MaterialRoute(page: ServiceProviderRegisterView),
    MaterialRoute(page: CustomerRegisterView),
    MaterialRoute(page: InitialSelectionScreenView),
    MaterialRoute(page: LoginServiceProviderView),
    MaterialRoute(page: ServiceProviderProfileView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: AuthenticationService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
