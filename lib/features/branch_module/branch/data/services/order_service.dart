import 'dart:convert';

import '../models/order_model.dart';
import '../models/update_order_real_time_model.dart';

import '../models/order_response_model.dart';
import '../../../../../core/constants/endpoint_constants.dart';
import '../models/order_filter_obj.dart';
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

  void listenForUpdateOrder(Function(UpdateOrderRealTimeModel) callback) {
    _hubConnection.on(
      'updateOrder',
      (arguments) {
        dynamic ordersJson = arguments![0];
        var decodedJson = jsonDecode(ordersJson);

        UpdateOrderRealTimeModel updateOrderRealTimeModel =
            UpdateOrderRealTimeModel.fromJson(decodedJson);

        callback(updateOrderRealTimeModel);
      },
    );
  }
}
