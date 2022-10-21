import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/constants/size_form.dart';
import 'package:project/ui/widgets/appbar/custom_appbar.dart';

class LegendsPage extends StatelessWidget {
  const LegendsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = Get.height;
    double width = Get.width;
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppbar(title: 'leyendas'),
      body: SingleChildScrollView(physics: BouncingScrollPhysics(),
        padding: const EdgeInsets.all(SizeForm.margin),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(width: 3.0, color: Colors.black,),
            ),
            height: height * 0.15,
            width: width*0.8,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('legend title', style: TextStyle(fontSize: 18.0),),
                  Text('legend title', style: TextStyle(fontSize: 18.0),),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
