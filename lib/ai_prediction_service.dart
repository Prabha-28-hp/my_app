import 'package:google_generative_ai/google_generative_ai.dart';

import 'gemini_config.dart';


class AIPrediction {

  final int expiryDays;

  AIPrediction({
    required this.expiryDays,
  });

}



class AIPredictionService {


  static Future<AIPrediction> predictExpiry(String product) async {


    try {


      final model = GenerativeModel(

        model: 'gemini-1.5-flash',

        apiKey: geminiApiKey,

      );


      final prompt = """

Predict shelf life in days for this grocery item.

Item: $product

Return only a number.

""";


      final response = await model.generateContent(
        [
          Content.text(prompt),
        ],
      );


      String answer = response.text ?? "";


      RegExp regex = RegExp(r'\d+');

      Match? match = regex.firstMatch(answer);



      if(match != null){

        int days = int.parse(match.group(0)!);


        if(days > 0 && days < 1000){

          return AIPrediction(

            expiryDays: days,

          );

        }

      }


    } catch(e){

      print("Gemini failed: $e");

    }



    // Smart AI fallback knowledge base

    String item = product.toLowerCase();



    if(item.contains("milk")){

      return AIPrediction(expiryDays: 5);

    }


    if(item.contains("chicken")){

      return AIPrediction(expiryDays: 2);

    }


    if(item.contains("rice")){

      return AIPrediction(expiryDays: 180);

    }


    if(item.contains("beetroot")){

      return AIPrediction(expiryDays: 10);

    }


    if(item.contains("avocado")){

      return AIPrediction(expiryDays: 7);

    }



    return AIPrediction(

      expiryDays: 7,

    );


  }


}