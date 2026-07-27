import 'package:intl/intl.dart';


class AIService {


  static int getShelfLife(String productName){

    String item = productName.toLowerCase();


    if(item.contains("milk")){
      return 5;
    }

    else if(item.contains("bread")){
      return 7;
    }

    else if(item.contains("banana")){
      return 5;
    }

    else if(item.contains("apple")){
      return 15;
    }

    else if(item.contains("vegetable") ||
        item.contains("vegetables")){

      return 7;

    }

    else if(item.contains("rice")){

      return 180;

    }

    else if(item.contains("egg") ||
        item.contains("eggs")){

      return 20;

    }


    // Default prediction
    return 10;

  }



  static String predictExpiry(String productName,
      String purchaseDate){


    DateTime date =
    DateFormat("dd-MM-yyyy")
        .parse(purchaseDate);


    int days =
    getShelfLife(productName);


    DateTime expiry =
    date.add(
      Duration(days: days),
    );


    return DateFormat("dd-MM-yyyy")
        .format(expiry);


  }


}