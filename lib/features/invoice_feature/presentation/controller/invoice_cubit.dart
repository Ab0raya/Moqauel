import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../data/models/invoice.dart';

import 'invoice_state.dart';

class InvoiceCubit extends Cubit<InvoiceState> {
  InvoiceCubit() : super(InvoiceState.initial());

  void addCard() {
    final newServiceController = TextEditingController();
    final newPriceController = TextEditingController();
    final newDetailsController = TextEditingController();

    final updatedServiceControllers = List<TextEditingController>.from(state.serviceTextControllers)..add(newServiceController);
    final updatedPriceControllers = List<TextEditingController>.from(state.priceTextControllers)..add(newPriceController);
    final updatedDetailsControllers = List<TextEditingController>.from(state.detailsTextControllers)..add(newDetailsController);

    emit(state.copyWith(
      cardsCount: state.cardsCount + 1,
      serviceTextControllers: updatedServiceControllers,
      priceTextControllers: updatedPriceControllers,
      detailsTextControllers: updatedDetailsControllers,
    ));
  }

  void generateInvoices() {
    final invoices = List<Invoice>.generate(state.cardsCount, (index) {
      return Invoice(
        title: state.serviceTextControllers[index].text,
        price: double.tryParse(state.priceTextControllers[index].text) ?? 0.0,
        details: state.detailsTextControllers[index].text,
      );
    });

    emit(state.copyWith(invoices: invoices));
  }

  @override
  Future<void> close() {
    for (var controller in state.serviceTextControllers) {
      controller.dispose();
    }
    for (var controller in state.priceTextControllers) {
      controller.dispose();
    }
    for (var controller in state.detailsTextControllers) {
      controller.dispose();
    }
    return super.close();
  }
}
