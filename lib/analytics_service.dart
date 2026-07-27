import 'model/grocery.dart';
import 'expiry_service.dart';


class AnalyticsService {


  static int totalItems(List<Grocery> groceries) {

    return groceries.length;

  }



  static int freshItems(List<Grocery> groceries) {

    int count = 0;


    for (var item in groceries) {


      if (ExpiryService.getStatus(item.expiryDate)
          == "Fresh") {

        count++;

      }


    }


    return count;

  }




  static int expiringSoonItems(List<Grocery> groceries) {

    int count = 0;


    for (var item in groceries) {


      if (ExpiryService.getStatus(item.expiryDate)
          == "Expiring Soon") {

        count++;

      }


    }


    return count;

  }




  static int expiredItems(List<Grocery> groceries) {

    int count = 0;


    for (var item in groceries) {


      if (ExpiryService.getStatus(item.expiryDate)
          == "Expired") {

        count++;

      }


    }


    return count;

  }


}