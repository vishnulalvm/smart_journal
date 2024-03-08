import 'package:flutter/material.dart';

Widget notificationWidgerTile(){
  return const ListTile(
    tileColor: Colors.white,
    title: Text('next meet@10am in Sunday'),
    leading: Icon(Icons.alarm),
    trailing: Icon(Icons.close),
  );
}