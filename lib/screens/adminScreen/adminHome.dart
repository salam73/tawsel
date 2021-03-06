import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tawsel/screens/adminScreen/sortOrderByCity.dart';
import 'package:tawsel/screens/adminScreen/sortOrdersByDate.dart';
import 'package:tawsel/screens/ordersList.dart';
import 'package:tawsel/screens/userList.dart';
import 'package:tawsel/testing/mainTest.dart';

class AdminHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('شركة'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RaisedButton(
                onPressed: () {
                  Get.to(UserList());
                },
                child: Text('المحلات'),
              ),
              RaisedButton(
                onPressed: () {
                  Get.to(SortOrdersByDate());
                },
                child: Text('التاريخ'),
              ),
              RaisedButton(
                onPressed: () {
                  Get.to(SortOrdersByCity());
                },
                child: Text('محافظات'),
              ),
              RaisedButton(
                onPressed: () {
                  Get.to(MainTest());
                },
                child: Text('الجدول'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
