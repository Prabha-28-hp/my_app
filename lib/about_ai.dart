import 'package:flutter/material.dart';


class AboutAI extends StatelessWidget {

  const AboutAI({super.key});


  @override
  Widget build(BuildContext context) {


    return Scaffold(

      appBar: AppBar(

        title: const Text(
          "About AI",
        ),

      ),



      body: SingleChildScrollView(

        padding: const EdgeInsets.all(20),


        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [



            Container(

              width: double.infinity,

              padding: const EdgeInsets.symmetric(

                vertical: 14,

                horizontal: 16,

              ),


              margin: const EdgeInsets.only(

                bottom: 20,

              ),



              decoration: BoxDecoration(

                color: Colors.blue.shade50,

                borderRadius: BorderRadius.circular(16),


                border: Border.all(

                  color: Colors.blue.shade200,

                ),

              ),



              child: const Row(

                mainAxisAlignment: MainAxisAlignment.center,


                children: [



                  Icon(

                    Icons.auto_awesome,

                    color: Colors.blue,

                    size: 28,

                  ),



                  SizedBox(

                    width: 10,

                  ),



                  Text(

                    "Powered by Gemini AI",


                    style: TextStyle(

                      fontSize: 17,

                      fontWeight: FontWeight.bold,

                    ),

                  ),



                ],

              ),

            ),





            const Text(

              "AI-Based Smart Grocery Planner",

              style: TextStyle(

                fontSize: 22,

                fontWeight: FontWeight.bold,

              ),

            ),



            const SizedBox(

              height: 15,

            ),




            const Text(

              "This application uses Artificial Intelligence "

                  "to predict grocery expiry dates, monitor "

                  "inventory freshness, and provide smart "

                  "recommendations to reduce food waste.",


              style: TextStyle(

                fontSize: 16,

              ),

            ),




            const SizedBox(

              height: 20,

            ),





            Card(

              child: ListTile(

                leading: Icon(

                  Icons.smart_toy,

                  color: Colors.blue,

                ),

                title: Text(

                  "AI Expiry Prediction",

                ),

                subtitle: Text(

                    "Predicts shelf life of groceries using AI."

                ),

              ),

            ),




            Card(

              child: ListTile(

                leading: Icon(

                  Icons.notifications_active,

                  color: Colors.orange,

                ),


                title: Text(

                  "Smart Expiry Alerts",

                ),


                subtitle: Text(

                    "Provides alerts before grocery items expire."

                ),

              ),

            ),





            Card(

              child: ListTile(

                leading: Icon(

                  Icons.lightbulb,

                  color: Colors.green,

                ),


                title: Text(

                  "AI Suggestions",

                ),


                subtitle: Text(

                    "Generates intelligent recommendations "

                        "for grocery usage."

                ),

              ),

            ),





          ],

        ),

      ),

    );

  }

}