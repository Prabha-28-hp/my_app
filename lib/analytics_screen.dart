import 'package:flutter/material.dart';

import 'db_helper.dart';
import 'model/grocery.dart';
import 'analytics_service.dart';



class AnalyticsScreen extends StatefulWidget {

  const AnalyticsScreen({super.key});


  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();

}



class _AnalyticsScreenState extends State<AnalyticsScreen> {


  final DBHelper db = DBHelper();


  List<Grocery> groceries = [];



  @override
  void initState() {

    super.initState();

    loadData();

  }




  Future<void> loadData() async {


    groceries = await db.getGroceries();


    setState(() {});


  }





  Widget buildCard(
      String title,
      int value,
      IconData icon,
      ) {


    return Card(

      child: ListTile(

        leading: Icon(icon),

        title: Text(title),

        trailing: Text(

          value.toString(),

          style: const TextStyle(

            fontSize: 22,

            fontWeight: FontWeight.bold,

          ),

        ),

      ),

    );


  }





  @override
  Widget build(BuildContext context) {


    return Scaffold(

      appBar: AppBar(

        title: const Text(
          "Grocery Analytics",
        ),

      ),



      body: Padding(

        padding: const EdgeInsets.all(20),


        child: Column(

          children: [



            buildCard(

              "Total Items",

              AnalyticsService.totalItems(groceries),

              Icons.shopping_cart,

            ),



            buildCard(

              "Fresh Items",

              AnalyticsService.freshItems(groceries),

              Icons.check_circle,

            ),




            buildCard(

              "Expiring Soon",

              AnalyticsService.expiringSoonItems(groceries),

              Icons.warning,

            ),




            buildCard(

              "Expired Items",

              AnalyticsService.expiredItems(groceries),

              Icons.cancel,

            ),



          ],


        ),


      ),


    );


  }


}