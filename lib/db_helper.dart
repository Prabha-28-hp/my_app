import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';

import 'model/user.dart';
import 'model/grocery.dart';
import 'shopping_model.dart';



class DBHelper {


  static Database? _database;



  Future<Database> get database async {


    if (_database != null) {

      return _database!;

    }


    _database = await initDB();


    return _database!;


  }





  Future<Database> initDB() async {


    Directory directory =
    await getApplicationDocumentsDirectory();


    String path =
    join(directory.path, "grocery.db");



    return await openDatabase(

      path,


      version: 3,



      onCreate: (db, version) async {



        await db.execute('''

        CREATE TABLE users(

          id INTEGER PRIMARY KEY AUTOINCREMENT,

          username TEXT,

          password TEXT

        )

        ''');



        await db.execute('''

        CREATE TABLE groceries(

          id INTEGER PRIMARY KEY AUTOINCREMENT,

          name TEXT,

          quantity TEXT,

          purchaseDate TEXT,

          expiryDate TEXT

        )

        ''');



        await db.execute('''

        CREATE TABLE shopping(

          id INTEGER PRIMARY KEY AUTOINCREMENT,

          itemName TEXT,

          purchased INTEGER

        )

        ''');



      },



      onUpgrade: (db, oldVersion, newVersion) async {



        if(oldVersion < 3){



          await db.execute('''

          CREATE TABLE shopping(

            id INTEGER PRIMARY KEY AUTOINCREMENT,

            itemName TEXT,

            purchased INTEGER

          )

          ''');



        }


      },


    );


  }






  // ================= USER =================



  Future<int> insertUser(User user) async {


    final db = await database;


    return await db.insert(

      'users',

      user.toMap(),

    );


  }




  Future<User?> login(String username, String password) async {


    final db = await database;



    List<Map<String,dynamic>> result =

    await db.query(

      'users',

      where: 'username=? AND password=?',

      whereArgs: [

        username,

        password

      ],

    );



    if(result.isNotEmpty){


      return User.fromMap(result.first);


    }


    return null;


  }








  // ================= GROCERY =================



  Future<int> insertGrocery(Grocery grocery) async {


    final db = await database;



    return await db.insert(

      'groceries',

      grocery.toMap(),

    );


  }





  Future<List<Grocery>> getGroceries() async {


    final db = await database;



    List<Map<String,dynamic>> data =

    await db.query(

        'groceries'

    );



    return data

        .map(

          (item)=>Grocery.fromMap(item),

    )

        .toList();


  }





  Future<int> deleteGrocery(int id) async {


    final db = await database;



    return await db.delete(

      'groceries',

      where: 'id=?',

      whereArgs: [

        id

      ],

    );


  }





  Future<int> updateGrocery(Grocery grocery) async {


    final db = await database;



    return await db.update(

      'groceries',

      grocery.toMap(),

      where: 'id=?',

      whereArgs: [

        grocery.id

      ],

    );


  }








  // ================= SHOPPING =================




  Future<int> insertShopping(Shopping item) async {


    final db = await database;



    return await db.insert(

      'shopping',

      item.toMap(),

    );


  }





  Future<List<Shopping>> getShoppingItems() async {


    final db = await database;



    List<Map<String,dynamic>> data =

    await db.query(

        'shopping'

    );



    return data

        .map(

          (item)=>Shopping.fromMap(item),

    )

        .toList();


  }





  Future<int> deleteShopping(int id) async {


    final db = await database;



    return await db.delete(

      'shopping',

      where: 'id=?',

      whereArgs: [

        id

      ],

    );


  }





  Future<int> updateShopping(Shopping item) async {


    final db = await database;



    return await db.update(

      'shopping',

      item.toMap(),

      where: 'id=?',

      whereArgs: [

        item.id

      ],

    );


  }



}