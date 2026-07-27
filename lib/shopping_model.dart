class Shopping {

  int? id;
  String itemName;
  bool purchased;


  Shopping({

    this.id,

    required this.itemName,

    this.purchased = false,

  });



  Map<String, dynamic> toMap() {

    return {

      'id': id,

      'itemName': itemName,

      'purchased': purchased ? 1 : 0,

    };

  }



  factory Shopping.fromMap(Map<String, dynamic> map) {

    return Shopping(

      id: map['id'],

      itemName: map['itemName'],

      purchased: map['purchased'] == 1,

    );

  }

}