import 'model/grocery.dart';
import 'expiry_service.dart';


class NotificationService {


  static List<String> getAlerts(List<Grocery> groceries) {

    List<String> alerts = [];


    for (Grocery item in groceries) {

      String status =
      ExpiryService.getStatus(item.expiryDate);


      if (status == "Expired") {

        alerts.add(
          "🔴 ${item.name} is expired",
        );

      }


      else if (status == "Expiring Soon") {

        alerts.add(
          "⚠️ ${item.name} is expiring soon",
        );

      }

    }


    return alerts;

  }

}