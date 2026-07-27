import 'package:flutter/material.dart';

import 'db_helper.dart';
import 'model/grocery.dart';
import 'ai_prediction_service.dart';



class AddGrocery extends StatefulWidget {

  const AddGrocery({super.key});


  @override
  State<AddGrocery> createState() => _AddGroceryState();

}



class _AddGroceryState extends State<AddGrocery> {


  final DBHelper db = DBHelper();


  final TextEditingController nameController =
  TextEditingController();


  final TextEditingController quantityController =
  TextEditingController();



  DateTime selectedDate = DateTime.now();



  Future<void> selectDate() async {


    DateTime? picked =
    await showDatePicker(

      context: context,

      initialDate: selectedDate,

      firstDate: DateTime(2020),

      lastDate: DateTime(2035),

    );



    if(picked != null){

      setState(() {

        selectedDate = picked;

      });

    }


  }




  Future<void> addGrocery() async {



    if(nameController.text.isEmpty ||
        quantityController.text.isEmpty){

      return;

    }



    // AI EXPIRY PREDICTION

    var prediction =
   await AIPredictionService.predictExpiry(

      nameController.text,

    );
    print("AI DAYS RECEIVED: ${prediction.expiryDays}");



    DateTime expiryDate =

    selectedDate.add(

      Duration(

        days: prediction.expiryDays,

      ),

    );




    Grocery grocery = Grocery(


      name: nameController.text,


      quantity: quantityController.text,


      purchaseDate:

      selectedDate.toString().split(" ")[0],



      expiryDate:

      expiryDate.toString().split(" ")[0],


    );




    await db.insertGrocery(grocery);




    ScaffoldMessenger.of(context).showSnackBar(

      SnackBar(

        content: Text(

          "AI predicted expiry: ${grocery.expiryDate}",

        ),

      ),

    );




    Navigator.pop(context);



  }







  @override
  Widget build(BuildContext context) {


    return Scaffold(


      appBar: AppBar(

        title: const Text(

          "Add Grocery",

        ),

      ),



      body: Padding(

        padding: const EdgeInsets.all(20),


        child: Column(

          children: [



            TextField(

              controller: nameController,

              decoration: const InputDecoration(

                labelText: "Grocery Name",

                border: OutlineInputBorder(),

              ),

            ),



            const SizedBox(height:15),




            TextField(

              controller: quantityController,

              decoration: const InputDecoration(

                labelText: "Quantity",

                border: OutlineInputBorder(),

              ),

            ),




            const SizedBox(height:15),




            ListTile(

              title: Text(

                "Purchase Date: ${selectedDate.toString().split(" ")[0]}",

              ),


              trailing: IconButton(

                icon: const Icon(

                  Icons.calendar_today,

                ),

                onPressed: selectDate,

              ),

            ),




            const SizedBox(height:20),




            ElevatedButton(

              onPressed: addGrocery,


              child: const Text(

                "Add Grocery",

              ),


            ),



          ],


        ),


      ),


    );


  }


}