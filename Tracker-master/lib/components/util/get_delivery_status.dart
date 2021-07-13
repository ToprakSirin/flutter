import 'package:tracker/models/data_model/user_data_model.dart';

String getDeliveryStatus(DeliveryStatus status) {
  switch (status) {
    case DeliveryStatus.homeToSchool:
      return "Home to Scholl";
    case DeliveryStatus.schoolToHome:
      return "Scholl to Home";
    case DeliveryStatus.booth:
      return "Home to School \nSchool to Home";
    default:
      throw Exception('Not Found');
  }
}
