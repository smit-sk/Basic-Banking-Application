import '../model/customer.dart';
import 'package:flutter/material.dart';
import '../dbHelper.dart';

class InsertCustomer extends StatefulWidget {
  static const routeNamed = '/transactionDetails';

  @override
  _InsertCustomerState createState() => _InsertCustomerState();
}

class _InsertCustomerState extends State<InsertCustomer> {
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();

  String _customerName = '';
  double _customerBalance = 0.0;

  final _employeeNameController = TextEditingController();
  final _employeeBalanceController = TextEditingController();

  DBHelper db;

  @override
  void initState() {
    db = DBHelper();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Add a new customer'),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                Form(
                  key: _formStateKey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10, bottom: 10,top:15),
                        child: TextFormField(
                          onSaved: (value) {
                            _customerName = value;
                          },
                          keyboardType: TextInputType.name,
                          controller: _employeeNameController,
                          decoration: InputDecoration(
                            labelText: "Full Name",
                            
                            fillColor: Colors.blue,
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10, bottom: 10,top:10),
                        child: TextFormField(
                          onSaved: (value) {
                            _customerBalance = double.parse(value);
                          },
                          keyboardType: TextInputType.name,
                          controller: _employeeBalanceController,
                          decoration: InputDecoration(
                            labelText: "Intial Balance",
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                RaisedButton(
                  onPressed: () async {
                    _formStateKey.currentState.save();
                    db.insertCustomer(Customer(
                        id: null,
                        name: _customerName,
                        balance: _customerBalance));
                    _employeeNameController.text = '';
                    _employeeBalanceController.text = 0.0.toString();
                  },
                  color: Colors.purple,
                  padding: EdgeInsets.all(10),
                  
                  child: Text('Add Customer', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
