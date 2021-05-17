import 'package:basic_bank_app/model/customer.dart';
import 'package:basic_bank_app/screens/adminDetails.dart';
import 'package:basic_bank_app/screens/customers_list.dart';
import 'package:basic_bank_app/screens/insertCustomer.dart';
import 'package:basic_bank_app/widgets/customcard.dart';
import 'package:flutter/material.dart';
import '../dbHelper.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Customer> query = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        
        title: Text('Spark Co-operative Bank'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.info),
              onPressed: () async {
                DBHelper db = DBHelper();
                query = await db.getCustomer();
                Navigator.of(context).pushNamed(AdminDetailsScreen.routeNamed,
                    arguments: query[0]);
              })
        ],
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
             
              const Divider(
                color: Colors.purple,
                height: 20,
                thickness: 3,
                endIndent: 0,
              ),
              //SizedBox(height: 300,),
              Text(
                "Welcome! To The Spark Co-operative Bank",
                textAlign:TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                color: Colors.purple,
                  
                ),
              ),
              const Divider(
                color: Colors.purple,
                height: 20,
                thickness: 3,
                endIndent: 0,
              ),
               Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                elevation: 8,
                margin: EdgeInsets.all(3),
                color: Colors.purple[50],
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                    child: Image(
                      image: AssetImage("assets/images/logo.png" ),
                      height: 300,
                      width: 300,
                      fit: BoxFit.fill,
                    )),
              ),
              SizedBox(height: 50),
              CustomCard(
                icon: Icons.account_circle,

                title: 'View All Customers',
                navpage: () async {
                  DBHelper db = DBHelper();
                  query = await db.getCustomer();
                  Navigator.of(context)
                      .pushNamed(CustomersList.routeNamed, arguments: query);
                },
              ),
              CustomCard(
                icon: Icons.account_balance,
                title: 'Insert Customer',
                navpage: () {
                  Navigator.of(context).pushNamed(
                    InsertCustomer.routeNamed,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
