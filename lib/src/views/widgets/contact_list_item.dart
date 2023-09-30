import 'package:flutter/material.dart';
import '../../model/record.dart';
class ContactListItem extends StatelessWidget {


  const ContactListItem({Key? key, required this.record}) : super(key: key);
  final Records record;


  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(record.photo),


        ),
        title: Text(record.name),
        subtitle: Text(record.address),





        trailing: Column(
          children: [

            SizedBox(
              height: 8,
        ),],) );




  }
}

