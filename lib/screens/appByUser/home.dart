import 'package:tawsel/controllers/authController.dart';
import 'package:tawsel/controllers/themeController.dart';
import 'package:tawsel/controllers/orderController.dart';
import 'package:tawsel/controllers/userController.dart';
import 'package:tawsel/models/user.dart';
import 'package:tawsel/screens/appByUser/orderInput.dart';
import 'package:tawsel/services/fireDb.dart';
import 'package:tawsel/widgets/orderCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tawsel/widgets/orderAlert.dart';

class Home extends StatelessWidget {
  final AuthController _authController = Get.find();

  final ThemeController _themeController = Get.put(ThemeController());

  getLightIcon() {
    if (_themeController.themeChange) {
      return Icon(Icons.lightbulb);
    } else {
      return Icon(Icons.lightbulb_outline);
    }
  }

  getUserName() {
    return GetX<UserController>(
      init: Get.put(UserController()),
      initState: (_) async {
        Get.find<UserController>().user =
            await FireDb().getUser(uid: Get.find<AuthController>().user.uid);
      },
      builder: (_userController) {
        return Text((_userController.user == null)
            ? ""
            : _userController.user.name.toString());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: getUserName(),
        centerTitle: true,
        actions: [
          Obx(
            () => IconButton(
              icon: getLightIcon(),
              onPressed: () {
                if (Get.isDarkMode) {
                  Get.changeTheme(ThemeData.light());
                  _themeController.themeChange = false;
                } else {
                  Get.changeTheme(ThemeData.dark());
                  _themeController.themeChange = true;
                }
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              _authController.logOut();
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // OrderAlert().addOrderDialog();
          Get.to(OrderInput());
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Orders",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          GetX<OrderController>(
            init: Get.put<OrderController>(OrderController()),
            builder: (OrderController orderController) {
              if (orderController != null && orderController.orders != null) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: orderController.orders.length,
                    itemBuilder: (_, index) {
                      return OrderCard(
                          uid: _authController.user.uid,
                          order: orderController.orders[index]);
                    },
                  ),
                );
              } else {
                return Container(
                    child: Center(
                        child: CircularProgressIndicator(
                  value: 10,
                )));
              }
            },
          )
        ],
      ),
    );
  }
}
