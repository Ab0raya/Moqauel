class Invoice {
  final String title;
  final double price;
  final String details;

  Invoice({
    required this.title,
    required this.price,
    required this.details,
  });
}

class InvoicePdf{
  final List<Invoice> invoices;
  final String ownerName;
  final String location;
  final String fileName;

  InvoicePdf({required this.invoices,required this.fileName, required this.ownerName, required this.location});
}