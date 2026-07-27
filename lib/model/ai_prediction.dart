class AIPrediction {

  String productName;

  int expiryDays;

  String category;



  AIPrediction({

    required this.productName,

    required this.expiryDays,

    required this.category,

  });



  Map<String,dynamic> toMap(){

    return {

      "productName": productName,

      "expiryDays": expiryDays,

      "category": category,

    };

  }

}