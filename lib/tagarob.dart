// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:shoghl/constants/media_query.dart';
// import 'package:shoghl/constants/spacing.dart';
// import 'constants/colors.dart';
// import 'core/utils/styles.dart';
// import 'core/utils/widgets/text_form_field.dart';
//
// class DataEntryForm extends StatefulWidget {
//   @override
//   State<DataEntryForm> createState() => _DataEntryFormState();
// }
//
// class _DataEntryFormState extends State<DataEntryForm> {
//   int cardsCount = 1;
//   List<TextEditingController> serviceTextController = [];
//   List<TextEditingController> priceTextController = [];
//   List<TextEditingController> detailsTextController = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _initializeControllers();
//   }
//
//   void _initializeControllers() {
//     serviceTextController =
//         List.generate(cardsCount, (index) => TextEditingController());
//     priceTextController =
//         List.generate(cardsCount, (index) => TextEditingController());
//     detailsTextController =
//         List.generate(cardsCount, (index) => TextEditingController());
//   }
//
//   void _addController() {
//     setState(() {
//       cardsCount++;
//       serviceTextController.add(TextEditingController());
//       priceTextController.add(TextEditingController());
//       detailsTextController.add(TextEditingController());
//     });
//   }
//
//   @override
//   void dispose() {
//     for (var controller in serviceTextController) {
//       controller.dispose();
//     }
//     for (var controller in priceTextController) {
//       controller.dispose();
//     }
//     for (var controller in detailsTextController) {
//       controller.dispose();
//     }
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           'إنشاء فاتورة',
//           style: Styles.textStyle37.copyWith(color: DarkMode.kPrimaryColor),
//         ),
//         leading: IconButton(
//           onPressed: _addController,
//           icon: const Icon(Icons.add),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               // for(int i = 0 ; i < serviceTextController.length;i++){
//               //   print('services');
//               //   print(serviceTextController[i].text);
//               //   print('price');
//               //   print(priceTextController[i].text);
//               //   print('details');
//               //   print(detailsTextController[i].text);
//               // }
//               Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DisplayData(serviceTextController: serviceTextController, priceTextController: priceTextController, detailsTextController: detailsTextController)));
//             },
//             icon: const Icon(CupertinoIcons.forward),
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: cardsCount,
//               itemBuilder: (context, index) {
//                 return Container(
//                   width: getScreenWidth(context),
//                   height: getScreenHeight(context) * 0.26,
//                   margin: const EdgeInsets.all(20),
//                   padding: const EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(16),
//                     border: Border.all(
//                       color: DarkMode.kPrimaryColor,
//                     ),
//                   ),
//                   child: Column(
//                     children: [
//                       Text(
//                         '${index + 1}',
//                         style: Styles.textStyle37
//                             .copyWith(color: DarkMode.kPrimaryColor),
//                       ),
//                       10.sh,
//                       CustomTextFormField(
//                         hint: 'الخدمة',
//                         icon: CupertinoIcons.wrench_fill,
//                         controller: serviceTextController[index],
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'من فضلك ادخل التفاصيل';
//                           }
//                           return null;
//                         },
//                       ),
//                       5.sh,
//                       CustomTextFormField(
//                         hint: 'السعر',
//                         icon: Icons.price_change,
//                         controller: priceTextController[index],
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'من فضلك ادخل التفاصيل';
//                           }
//                           return null;
//                         },
//                       ),
//                       5.sh,
//                       CustomTextFormField(
//                         hint: 'التفاصيل',
//                         icon: Icons.extension_rounded,
//                         controller: detailsTextController[index],
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'من فضلك ادخل التفاصيل';
//                           }
//                           return null;
//                         },
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class DisplayData extends StatelessWidget {
//   const DisplayData(
//       {super.key,
//       required this.serviceTextController,
//       required this.priceTextController,
//       required this.detailsTextController});
//
//   final List<TextEditingController> serviceTextController;
//   final List<TextEditingController> priceTextController;
//   final List<TextEditingController> detailsTextController;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Expanded(
//               child: ListView.builder(
//                 itemCount: serviceTextController.length,
//             itemBuilder: (context, index) {
//               return Container(
//                 width: getScreenWidth(context),
//                 height: getScreenHeight(context) * 0.26,
//                 margin: const EdgeInsets.all(20),
//                 padding: const EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(16),
//                   border: Border.all(
//                     color: DarkMode.kPrimaryColor,
//                   ),
//                 ),
//                 child: Column(
//                   children: [
//                     Text(
//                       serviceTextController[index].text,
//                       style: Styles.textStyle37
//                           .copyWith(color: DarkMode.kPrimaryColor),
//                     ),
//                     10.sh,
//                     Text(
//                       priceTextController[index].text,
//                       style: Styles.textStyle37
//                           .copyWith(color: DarkMode.kPrimaryColor),
//                     ),
//                     10.sh,
//                     Text(
//                       detailsTextController[index].text,
//                       style: Styles.textStyle37
//                           .copyWith(color: DarkMode.kPrimaryColor),
//                     ),
//                     10.sh,
//                   ],
//                 ),
//               );
//             },
//           )),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

import 'features/invoice_feature/data/models/invoice.dart';

class InvoiceListScreen extends StatelessWidget {
  final List<Invoice> invoices;

  InvoiceListScreen({required this.invoices});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Invoices'),
      ),
      body: ListView.builder(
        itemCount: invoices.length,
        itemBuilder: (context, index) {
          final invoice = invoices[index];
          return ListTile(
            title: Text(invoice.title),
            subtitle: Text('Price: ${invoice.price}\nDetails: ${invoice.details}'),
          );
        },
      ),
    );
  }
}
