class Grocery {

  int? id;
  String name;
  String quantity;
  String purchaseDate;
  String expiryDate;


  Grocery({

    this.id,

    required this.name,

    required this.quantity,

    required this.purchaseDate,

    required this.expiryDate,

  });



  Map<String,dynamic> toMap(){

    return {

      'id': id,

      'name': name,

      'quantity': quantity,

      'purchaseDate': purchaseDate,

      'expiryDate': expiryDate,

    };

  }



  factory Grocery.fromMap(Map<String,dynamic> map){

    return Grocery(

      id: map['id'],

      name: map['name'],

      quantity: map['quantity'],

      purchaseDate: map['purchaseDate'],

      expiryDate: map['expiryDate'],

    );

  }

}