import 'package:basic_bank_app/screens/modal.dart';

import '../widgets/customcard.dart';
import 'package:flutter/material.dart';

class CustomerDetailsScreen extends StatefulWidget {
  static const routeNamed = '/CustomerDetails';

  @override
  _CustomerDetailsScreenState createState() => _CustomerDetailsScreenState();
}

class _CustomerDetailsScreenState extends State<CustomerDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var query = ModalRoute.of(context).settings.arguments as List;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Account Details"),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10,50, 10, 10),
        child: Column(
          
          children: <Widget>[
            
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(
                "assets/images/customer.png",
              ),
            ),
            SizedBox(height: 30,),
            Text(
              query[1],
              
              style: TextStyle(
                fontSize: 30,
                color: Colors.black87,
                fontWeight: FontWeight.bold
              ),
            ),
            // const Divider(
            //   color: Colors.black,
            //   height: 20,
            //   thickness: 3,
            //   endIndent: 0,
            // ),
            SizedBox(height: 40,),
            CustomCard(
              icon: Icons.account_box,
              title: 'Account No: ${query[0]}',
            ),
            CustomCard(
              icon: Icons.account_balance_wallet,
              title: 'Balance: Rs.${query[2]}',
            ),
            SizedBox(height: 50),
            RaisedButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (ctxt) {
                      return GestureDetector(
                          onTap: () {},
                          child: NewTransaction(
                            customerId: query[0],
                            customerName: query[1],
                            customerBalance: query[2],
                          ),
                          behavior: HitTestBehavior.opaque);
                    });
              },
              padding: EdgeInsets.all(13),
              child: Text('Transfer Money',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
              color: Colors.purple,
            )
          ],
        ),
      ),
    );
  }
}
