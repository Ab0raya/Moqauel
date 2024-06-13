import 'package:flutter/material.dart';

import '../../data/models/invoice.dart';

class InvoiceState {
  final int cardsCount;
  final List<TextEditingController> serviceTextControllers;
  final List<TextEditingController> priceTextControllers;
  final List<TextEditingController> detailsTextControllers;
  final List<Invoice> invoices;

  InvoiceState({
    required this.cardsCount,
    required this.serviceTextControllers,
    required this.priceTextControllers,
    required this.detailsTextControllers,
    required this.invoices,
  });

  factory InvoiceState.initial() {
    return InvoiceState(
      cardsCount: 1,
      serviceTextControllers: [TextEditingController()],
      priceTextControllers: [TextEditingController()],
      detailsTextControllers: [TextEditingController()],
      invoices: [],
    );
  }

  InvoiceState copyWith({
    int? cardsCount,
    List<TextEditingController>? serviceTextControllers,
    List<TextEditingController>? priceTextControllers,
    List<TextEditingController>? detailsTextControllers,
    List<Invoice>? invoices,
  }) {
    return InvoiceState(
      cardsCount: cardsCount ?? this.cardsCount,
      serviceTextControllers: serviceTextControllers ?? this.serviceTextControllers,
      priceTextControllers: priceTextControllers ?? this.priceTextControllers,
      detailsTextControllers: detailsTextControllers ?? this.detailsTextControllers,
      invoices: invoices ?? this.invoices,
    );
  }
}
