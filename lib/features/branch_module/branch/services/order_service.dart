import 'dart:convert';

import 'package:market_app_web_2/features/branch_module/branch/data/models/order_model.dart';

import '../data/models/order_response_model.dart';
import '../../../../core/constants/endpoint_constants.dart';
import '../data/models/order_filter_obj.dart';
import 'package:signalr_netcore/signalr_client.dart';

class OrderServiceSignalR {
  late HubConnection _hubConnection;

  Future<void> startConnection() async {
    try {
      _hubConnection =
          HubConnectionBuilder().withUrl(EndpointConstants.ordersReal).build();

      await _hubConnection.start();
    } catch (e) {
      print(e.toString());
    }
  }

  Future getOrders(OrderFilterObj orderFilterObj) async {
    final order = jsonEncode(orderFilterObj.toJson());
    await _hubConnection.invoke('GetOrders', args: [order]);
  }

  void listenForOrders(Function(OrderResponseModel) callback) {
    _hubConnection.on(
      "ReceiveOrders",
      (arguments) {
        dynamic ordersJson = arguments![0];
        var decodedJson = jsonDecode(ordersJson);
        print(decodedJson);

        OrderResponseModel orderResponseModel =
            OrderResponseModel.fromJson(decodedJson);

        callback(orderResponseModel);
      },
    );
  }

  void listenForNewOrders(Function(OrderModel) callback) {
    _hubConnection.on(
      'newOrder',
      (arguments) {
        dynamic ordersJson = arguments![0];
        var decodedJson = jsonDecode(ordersJson);
        print(decodedJson);

        OrderModel orderModel = OrderModel.fromJson(decodedJson);

        callback(orderModel);
      },
    );
  }
}
