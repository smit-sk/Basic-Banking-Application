import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function navpage;

  CustomCard({this.icon, this.title, this.navpage});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Card(
        //color: Colors.purple[100],
        shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.purple, width: 3),
        borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          leading: Icon(
            icon,
            color: Colors.purple,
            size: 60,
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.purple,
            ),
          ),
          onTap: navpage,
        ),
      ),
    );
  }
}
