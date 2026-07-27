class ExpiryService {


  static String getStatus(String expiryDate) {


    try {


      DateTime expiry =
      DateTime.parse(expiryDate);



      DateTime today = DateTime.now();



      DateTime currentDate = DateTime(

        today.year,

        today.month,

        today.day,

      );



      int difference =
          expiry.difference(currentDate).inDays;



      if(difference < 0){

        return "Expired";

      }


      else if(difference <= 3){

        return "Expiring Soon";

      }


      else {

        return "Fresh";

      }



    }

    catch(e){


      return "Unknown";


    }


  }


}