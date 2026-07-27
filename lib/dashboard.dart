import 'package:flutter/material.dart';

import 'add_grocery.dart';
import 'inventory.dart';
import 'shopping_screen.dart';
import 'analytics_screen.dart';
import 'about_ai.dart';
import 'db_helper.dart';
import 'model/grocery.dart';
import 'notification_service.dart';
import 'recommendation_service.dart';



class Dashboard extends StatefulWidget {

  const Dashboard({super.key});


  @override
  State<Dashboard> createState() => _DashboardState();

}



class _DashboardState extends State<Dashboard> {


  final DBHelper db = DBHelper();


  List<String> alerts = [];

  List<String> recommendations = [];



  @override
  void initState() {

    super.initState();

    loadData();

  }




  Future<void> loadData() async {


    List<Grocery> items =
    await db.getGroceries();



    setState(() {

      alerts =
          NotificationService.getAlerts(items);


      recommendations =
          RecommendationService.getRecommendations(items);


    });


  }





  Widget featureCard(

      String title,

      IconData icon,

      VoidCallback onTap,

      ) {


    return GestureDetector(


      onTap: onTap,


      child: Card(

        elevation: 5,


        child: Container(

          height: 120,


          padding: const EdgeInsets.all(15),


          child: Column(

            mainAxisAlignment:
            MainAxisAlignment.center,


            children: [


              Icon(

                icon,

                size: 40,

              ),



              const SizedBox(height: 10),



              Text(

                title,

                textAlign: TextAlign.center,


                style: const TextStyle(

                  fontWeight: FontWeight.bold,

                  fontSize: 16,

                ),

              ),


            ],


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

          "AI Grocery Assistant",

        ),

        centerTitle: true,

      ),





      body: SingleChildScrollView(


        padding: const EdgeInsets.all(16),


        child: Column(

          crossAxisAlignment:
          CrossAxisAlignment.start,


          children: [



            const Text(

              "Welcome 👋",

              style: TextStyle(

                fontSize: 28,

                fontWeight: FontWeight.bold,

              ),

            ),



            const SizedBox(height: 5),




            const Text(

              "Manage your groceries smartly with AI",

              style: TextStyle(

                fontSize: 16,

              ),

            ),




            const SizedBox(height: 25),




            GridView.count(

              crossAxisCount: 2,

              shrinkWrap: true,

              physics:
              const NeverScrollableScrollPhysics(),



              children: [



                featureCard(

                  "Add Grocery",

                  Icons.add_shopping_cart,

                      () async {


                    await Navigator.push(

                      context,

                      MaterialPageRoute(

                        builder: (context) =>
                        const AddGrocery(),

                      ),

                    );


                    loadData();


                  },

                ),





                featureCard(

                  "Inventory",

                  Icons.inventory,

                      () {


                    Navigator.push(

                      context,

                      MaterialPageRoute(

                        builder: (context) =>
                        const Inventory(),

                      ),

                    );


                  },

                ),





                featureCard(

                  "Shopping List",

                  Icons.shopping_cart,

                      () {


                    Navigator.push(

                      context,

                      MaterialPageRoute(

                        builder: (context) =>
                        const ShoppingScreen(),

                      ),

                    );


                  },

                ),





                featureCard(

                  "Analytics",

                  Icons.analytics,

                      () {


                    Navigator.push(

                      context,

                      MaterialPageRoute(

                        builder: (context) =>
                        const AnalyticsScreen(),

                      ),

                    );


                  },

                ),





                featureCard(

                  "About AI",

                  Icons.smart_toy,

                      () {


                    Navigator.push(

                      context,

                      MaterialPageRoute(

                        builder: (context) =>
                        const AboutAI(),

                      ),

                    );


                  },

                ),



              ],

            ),





            const SizedBox(height: 25),





            const Text(

              "🔔 Expiry Alerts",

              style: TextStyle(

                fontSize: 22,

                fontWeight: FontWeight.bold,

              ),

            ),




            const SizedBox(height: 10),




            alerts.isEmpty

                ? const Text(

              "No expiry alerts",

            )


                :

            Column(

              children: alerts.map((alert) {


                return Card(

                  child: ListTile(

                    leading:
                    const Icon(Icons.warning),

                    title: Text(alert),

                  ),

                );


              }).toList(),

            ),






            const SizedBox(height: 25),





            const Text(

              "🤖 AI Suggestions",

              style: TextStyle(

                fontSize: 22,

                fontWeight: FontWeight.bold,

              ),

            ),




            const SizedBox(height: 10),




            recommendations.isEmpty

                ? const Text(

              "No suggestions",

            )


                :

            Column(

              children:
              recommendations.map((suggestion) {


                return Card(

                  child: ListTile(

                    leading:
                    const Icon(Icons.lightbulb),

                    title: Text(suggestion),

                  ),

                );


              }).toList(),

            ),



          ],


        ),


      ),


    );


  }


}