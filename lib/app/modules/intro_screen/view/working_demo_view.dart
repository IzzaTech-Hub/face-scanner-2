import 'package:applovin_max/applovin_max.dart';
import 'package:face_scanner/app/routes/app_pages.dart';
import 'package:face_scanner/app/utills/app_strings.dart';
import 'package:face_scanner/app/utills/images.dart';
import 'package:face_scanner/app/utills/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkingDemoView extends StatelessWidget {
  const WorkingDemoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      // backgroundColor: Colors.pink.shade50,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 4),
            child: Text(
              "How it Works ?",
              style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal * 8,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 4),
            child: Text(
              "Follow these simple steps to get started",
              style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal * 4,
                  color: Colors.grey.shade600),
            ),
          ),
          verticalSpace(SizeConfig.blockSizeVertical * 4),
          buildStepCard(
              Colors.blue.shade100,
              Colors.blue.shade50,
              Colors.blue.shade200,
              Icons.face,
              "Scan your face",
              "Take a quick selfie and let our AI analyze your unique features🌟",
              Colors.blue),
          buildStepCard(
              Colors.amber.shade100,
              Colors.amber.shade50,
              Colors.amber.shade200,
              Icons.align_vertical_bottom_outlined,
              "Get your beauty report",
              "Recieve a detailed analysis of your skin type and concerns🎁",
              Colors.amber),
          buildStepCard(
              Colors.purple.shade100,
              Colors.purple.shade50,
              Colors.purple.shade200,
              Icons.games_outlined,
              "Get Gems",
              "Get custom routines and product recommendation just for you❤️",
              Colors.purple),
          Center(
            child: GestureDetector(
              onTap: () {
                Get.offNamed(Routes.HOMEVIEW);
              },
              child: Container(
                margin: EdgeInsets.only(
                  top: SizeConfig.blockSizeVertical * 5,
                ),
                height: SizeConfig.blockSizeVertical * 6,
                width: SizeConfig.blockSizeHorizontal * 50,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.pink.shade200, Colors.pink],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter),
                    border: Border.all(color: Colors.pink, width: 2),
                    borderRadius: BorderRadius.circular(
                        SizeConfig.blockSizeHorizontal * 7)),
                child: Center(
                  child: Text(
                    "Lets start",
                    style: TextStyle(
                        fontSize: SizeConfig.blockSizeHorizontal * 5,
                        // fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          
        ],
      ),
    );
  }

  Widget buildStepCard(Color shadowColor, Color color1, Color borderColor,
      IconData icon, String text1, String text2, Color imageColor) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
        height: SizeConfig.blockSizeVertical * 17,
        width: SizeConfig.blockSizeHorizontal * 92,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: shadowColor, // Shadow color
                spreadRadius: 0, // Spread radius
                blurRadius: 5, // Blur radius
                offset: Offset(0, 5), // Offset in x and y direction
              ),
            ],
            color: Colors.white,
            borderRadius:
                BorderRadius.circular(SizeConfig.blockSizeHorizontal * 6)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: SizeConfig.blockSizeVertical * 7,
              width: SizeConfig.blockSizeHorizontal * 15,
              decoration: BoxDecoration(
                  color: color1,
                  border: Border.all(color: borderColor),
                  borderRadius: BorderRadius.circular(
                      SizeConfig.blockSizeHorizontal * 5)),
              child: Center(
                child: SizedBox(
                  height: SizeConfig.blockSizeVertical * 4,
                  child: Icon(
                    icon,
                    color: imageColor,
                  ),
                  //  Image.asset(
                  //   image,
                  //   color: imageColor,
                  // ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text1,
                  style: TextStyle(
                      fontSize: SizeConfig.blockSizeHorizontal * 4.5,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                verticalSpace(SizeConfig.blockSizeVertical * 1),
                Container(
                  width: SizeConfig.blockSizeHorizontal * 60,
                  child: Text(
                    text2,
                    style: TextStyle(
                        fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                        color: Colors.grey.shade600),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
