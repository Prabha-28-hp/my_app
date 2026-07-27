import 'package:flutter/material.dart';

import 'db_helper.dart';
import 'shopping_model.dart';



class ShoppingScreen extends StatefulWidget {

  const ShoppingScreen({super.key});


  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();

}



class _ShoppingScreenState extends State<ShoppingScreen> {


  final DBHelper db = DBHelper();


  List<Shopping> items = [];


  final TextEditingController controller =
  TextEditingController();




  @override
  void initState() {

    super.initState();

    loadItems();

  }




  Future<void> loadItems() async {


    items = await db.getShoppingItems();


    setState(() {});


  }






  Future<void> addItem() async {


    if(controller.text.isEmpty){

      return;

    }



    Shopping item = Shopping(

      itemName: controller.text,

      purchased: false,

    );



    await db.insertShopping(item);


    controller.clear();


    loadItems();


  }






  Future<void> deleteItem(int id) async {


    await db.deleteShopping(id);


    loadItems();


  }





  @override
  Widget build(BuildContext context) {


    return Scaffold(


      appBar: AppBar(

        title: const Text(
          "Smart Shopping List",
        ),

      ),



      body: Column(

        children: [



          Padding(

            padding: const EdgeInsets.all(15),

            child: Row(

              children: [


                Expanded(

                  child: TextField(

                    controller: controller,

                    decoration: const InputDecoration(

                      hintText: "Enter item name",

                      border: OutlineInputBorder(),

                    ),

                  ),

                ),



                const SizedBox(width:10),



                ElevatedButton(

                  onPressed: addItem,

                  child: const Text(
                    "Add",
                  ),

                ),



              ],

            ),

          ),






          Expanded(

            child: items.isEmpty


                ? const Center(

              child: Text(
                "No shopping items",
              ),

            )


                : ListView.builder(


              itemCount: items.length,


              itemBuilder: (context,index){


                Shopping item = items[index];



                return Card(


                  child: ListTile(


                    leading: Checkbox(

                      value: item.purchased,


                      onChanged: (value) async {


                        item.purchased =
                            value ?? false;


                        await db.updateShopping(item);


                        loadItems();


                      },


                    ),



                    title: Text(

                      item.itemName,

                      style: TextStyle(

                        decoration:

                        item.purchased

                            ? TextDecoration.lineThrough

                            : null,

                      ),

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


          ),



        ],


      ),



    );


  }


}