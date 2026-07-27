import 'model/grocery.dart';
import 'expiry_service.dart';


class RecommendationService {


  static List<String> getRecommendations(
      List<Grocery> groceries) {


    List<String> recommendations = [];


    for (Grocery item in groceries) {


      String status =
      ExpiryService.getStatus(item.expiryDate);



      if (status == "Expired") {


        recommendations.add(
          "❌ ${item.name} is expired. Remove it from your inventory.",
        );


      }


      else if (status == "Expiring Soon") {


        recommendations.add(
          "⚠️ ${item.name} is expiring soon. Use it first.",
        );


      }


      else {


        recommendations.add(
          "✅ ${item.name} is available. Keep monitoring its expiry.",
        );


      }


    }


    if (groceries.isEmpty) {


      recommendations.add(
        "Add groceries to receive smart recommendations.",
      );


    }


    return recommendations;


  }


}