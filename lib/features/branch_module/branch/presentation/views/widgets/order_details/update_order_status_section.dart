import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/models/update_order_request_model.dart';
import '../../../../../../../core/utils/dialog_manager_overlay.dart';
import '../../../../../../../core/utils/show_toast.dart';
import '../../../model_views/order_details_cubit/order_details_cubit.dart';
import '../../../model_views/update_status_cubit/update_order_status_cubit.dart';
import '../../../model_views/update_status_cubit/update_order_status_states.dart';
import '../../../../../../../core/widgets/filled_button_widget.dart';
import '../../../model_views/order_status/order_status_cubit.dart';
import '../../../model_views/order_status/order_status_states.dart';
import '../../../../../../addresses/presentation/views/widgets/dropdown_button_form_field_widget.dart';
import 'order_details_container.dart';

class UpdateOrderStatusSection extends StatefulWidget {
  const UpdateOrderStatusSection(
      {super.key, required this.orderStatusId, required this.orderId});
  final String orderStatusId;
  final String orderId;

  @override
  State<UpdateOrderStatusSection> createState() =>
      _UpdateOrderStatusSectionState();
}

class _UpdateOrderStatusSectionState extends State<UpdateOrderStatusSection> {
  late String _selectedStatusId;

  @override
  void initState() {
    super.initState();
    _selectedStatusId = widget.orderStatusId;
  }

  @override
  Widget build(BuildContext context) {
    final orderStatus = context.read<OrderStatusCubit>().state;
    return orderStatus is OrderStatusSuccessState
        ? OrderDetailsContainer(
            widget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButtonFormFieldWidget(
                  selectedValue: widget.orderStatusId,
                  items: orderStatus.orderStatus
                      .map(
                        (e) => DropdownMenuItem(
                          value: e.id,
                          child: Text(e.enName ?? ''),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedStatusId = value;
                    });
                  },
                  hint: 'Select Staus',
                ),
                const SizedBox(height: 15),
                BlocListener<UpdateOrderStatusCubit, UpdateOrderStatusStates>(
                  listener: (context, state) async {
                    if (state is UpdateOrderStatusLoadingState) {
                      DialogManagerOverlay.showDialogWithMessage(context);
                    } else if (state is UpdateOrderStatusSuccessState) {
                      await context
                          .read<OrderDetailsCubit>()
                          .getOrderDetails(widget.orderId, false);

                      DialogManagerOverlay.closeDialog();
                    } else if (state is UpdateOrderStatusFailureState) {
                      DialogManagerOverlay.closeDialog();
                      showToast(context: context, msg: state.errorMessage);
                    }
                  },
                  child: SizedBox(
                    width: double.infinity,
                    child: FilledButtonWidget(
                      onPress: _selectedStatusId != widget.orderStatusId
                          ? () {
                              context
                                  .read<UpdateOrderStatusCubit>()
                                  .updateOrder(
                                    UpdateOrderRequestModel(
                                      orderId: widget.orderId,
                                      statusId: _selectedStatusId,
                                    ),
                                  );
                            }
                          : null,
                      widget: const Text('Update'),
                    ),
                  ),
                ),
              ],
            ),
          )
        : const SizedBox();
  }
}
