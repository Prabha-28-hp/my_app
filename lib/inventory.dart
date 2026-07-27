import 'package:flutter/material.dart';
import 'db_helper.dart';
import 'model/grocery.dart';
import 'expiry_service.dart';


class Inventory extends StatefulWidget {

  const Inventory({super.key});


  @override
  State<Inventory> createState() => _InventoryState();

}



class _InventoryState extends State<Inventory> {


  final DBHelper db = DBHelper();


  List<Grocery> groceries = [];



  @override
  void initState(){

    super.initState();

    loadItems();

  }



  Future<void> loadItems() async {


    groceries = await db.getGroceries();


    setState(() {});


  }




  Future<void> deleteItem(int id) async {


    await db.deleteGrocery(id);


    await loadItems();


  }





  @override
  Widget build(BuildContext context) {


    return Scaffold(

      appBar: AppBar(

        title: const Text(
          "Inventory",
        ),

      ),



      body: groceries.isEmpty


          ?

      const Center(

        child: Text(
          "No groceries available",
        ),

      )



          :

      ListView.builder(

        itemCount: groceries.length,


        itemBuilder: (context,index){


          Grocery item = groceries[index];


          String status =
          ExpiryService.getStatus(
              item.expiryDate
          );



          return Card(

            margin: const EdgeInsets.all(10),


            child: ListTile(


              title: Text(

                item.name,

                style: const TextStyle(

                  fontWeight: FontWeight.bold,

                ),

              ),



              subtitle: Text(

                "Quantity: ${item.quantity}\n"
                    "Purchase Date: ${item.purchaseDate}\n"
                    "Expiry: ${item.expiryDate}\n"
                    "Status: $status",

              ),



              trailing: IconButton(

                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),


                onPressed: (){


                  if(item.id != null){

                    deleteItem(item.id!);

                  }


                },

              ),



            ),

          );


        },


      ),


    );


  }


}