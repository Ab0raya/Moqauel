import 'package:flutter/material.dart';
import 'package:shoghl/core/utils/styles.dart';
class Tagarob extends StatelessWidget {
  const Tagarob({super.key, required this.accData});
  final List<Map> accData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  Center(
        child: Column(
          children: [
            Text('${accData[accData.length-1]['ownerName']}',style: Styles.headingTextStyle,),
            Text('${accData[accData.length-1]['locationName']}',style: Styles.headingTextStyle,),
            Text('${accData[accData.length-1]['accountId']}',style: Styles.headingTextStyle,),
            Text('${accData[accData.length-1]['lastEdit']}',style: Styles.headingTextStyle,),
            Text('${accData[accData.length-1]['totalIncome']}',style: Styles.headingTextStyle,),
          ],
        ),
      ),
    );
  }
}
