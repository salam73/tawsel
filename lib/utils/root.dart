import 'package:tawsel/controllers/authController.dart';
import 'package:tawsel/controllers/userController.dart';
import 'package:tawsel/models/user.dart';
import 'package:tawsel/screens/OrdersListByUser.dart';
import 'package:tawsel/screens/adminScreen/adminHome.dart';
import 'package:tawsel/screens/appByUser/home.dart';
import 'package:tawsel/screens/auth/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tawsel/screens/appByUser/orderInput.dart';
import 'package:tawsel/screens/ordersList.dart';
import 'package:tawsel/screens/userList.dart';
import 'package:tawsel/testing/mainTest.dart';
import 'package:tawsel/testing/test2.dart';

class Root extends GetWidget<AuthController> {
  //Just For Switching to Home to Login
  UserModel userModel = UserModel();
  @override
  Widget build(BuildContext context) {
    return GetX<AuthController>(
      initState: (_) async {
        Get.put<UserController>(UserController());
      },
      builder: (_) {
        if (Get.find<AuthController>().user != null) {
          // var user = Get.find<AuthController>().user;

          //    print(user['isAdmin'].toString());
          //return Home();
          // return Test2();
          //return MainTest();
          return AdminHome();
          // return OrdersList();
          // return UserList();
          // return OrderInput(
          //     //  userId: user.uid,
          //     );
        } else {
          // return Test2();
          // return AdminHome();
          // return MainTest();
          return AdminHome();
        }
      },
    );
  }
}
