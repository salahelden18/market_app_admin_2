import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/models/pagination_model.dart';
import '../../data/models/order_model.dart';
import '../../data/models/order_filter_obj.dart';
import '../../data/services/order_service.dart';
import 'orders_state.dart';

class OrdersCubit extends Cubit<OrderStates> {
  OrdersCubit(this._orderServiceSignalR)
      : super(const OrderStates(isLoading: true));

  final OrderServiceSignalR _orderServiceSignalR;
  List<OrderModel> orders = [];
  PaginationModel? pagination;

  int currentPage = 1;
  bool isLoading = false;
  bool hasMore = true;

  Future<void> startConnection() async {
    await _orderServiceSignalR.startConnection();
  }

  Future<void> getOrders(String branchId) async {
    print('calling get Orders');
    if (isLoading || !hasMore) {
      return;
    }

    emit(state.copyWith(isLoading: true));
    OrderFilterObj orderFilterObj =
        OrderFilterObj(branchId: branchId, page: currentPage);
    currentPage++;
    isLoading = true;
    await _orderServiceSignalR.getOrders(orderFilterObj);
    isLoading = false;
  }

  void listenForOrders() {
    _orderServiceSignalR.listenForOrders(
      (order) {
        orders = order.orders;
        pagination = order.pagination;
        hasMore = pagination?.hasNextPage ?? false;

        emit(
          state.copyWith(
            orders: orders,
            pagination: pagination,
            isLoading: false,
          ),
        );
      },
    );
  }

  void listenForNewOrder() {
    _orderServiceSignalR.listenForNewOrders(
      (newOrder) {
        orders = [newOrder, ...orders];
        pagination = pagination != null
            ? pagination!.copyWith(totalCount: state.pagination!.totalCount + 1)
            : pagination;

        // Emit the new state with updated orders
        emit(state.copyWith(
            orders: orders, pagination: pagination, isLoading: false));
      },
    );
  }

  void listenForUpdateOrder() {
    print('entered here and started listening for updates');
    _orderServiceSignalR.listenForUpdateOrder(
      (updateOrder) {
        // Find the index of the updated order in the list
        int index = orders.indexWhere((order) => order.id == updateOrder.id);
        if (index != -1) {
          orders[index] =
              orders[index].copyWith(orderStatusModel: updateOrder.orderStatus);
          emit(state.copyWith(orders: orders, isLoading: false));
        }
      },
    );
  }
}
