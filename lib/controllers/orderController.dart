import 'package:tawsel/controllers/authController.dart';
import 'package:tawsel/controllers/userController.dart';
import 'package:tawsel/models/order.dart';
import 'package:tawsel/services/fireDb.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  Rx<List<OrderModel>> orderList = Rx<List<OrderModel>>();
  Rx<List<OrderModel>> allOrderList = Rx<List<OrderModel>>();

  var orderStatus = 'جاهز'.obs;
  var sumAmount = 0.obs;

  List<OrderModel> get orders => orderList.value;
  List<OrderModel> get allOrders => allOrderList.value;

  @override
  @mustCallSuper
  void onInit() async {
    //var fireUser = Get.find<AuthController>().user;
    clear();

    /* Get.find<UserController>().user =
        await FireDb().getUser(uid: Get.find<AuthController>().user.uid);
    var user = Get.find<UserController>().user;

    orderList.bindStream(FireDb().orderStream(user.id));*/

    allOrderList.bindStream(FireDb().allOrderStream(
        status: orderStatus.value)); //stream coming from firebase For todo List

    super.onInit();
  }

  void orderByUser({String userId}) {
    orderList.bindStream(FireDb().orderStreamByUserId(userId));
  }

  // String printOrder() {
  //   return 'printController' + sumAmount.toString();
  // }

  void streamStatus({String status}) {
    allOrderList.bindStream(FireDb().allOrderStream(status: orderStatus.value));
  }

  void clear() {
    this.orderList.value = List<OrderModel>();
  }
}
