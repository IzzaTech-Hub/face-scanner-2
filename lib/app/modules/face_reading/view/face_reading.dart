import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:face_scanner/app/data/response_status.dart';
import 'package:face_scanner/app/modules/face_reading/controller/face_reading_ctl.dart';
import 'package:face_scanner/app/modules/home/views/scanner_widget.dart';
import 'package:face_scanner/app/utills/images.dart';
import 'package:face_scanner/app/utills/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class FaceReading extends GetView<FaceReadingCtl> {
  const FaceReading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Choose Image',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // [[[[[[[[[[[[[[Commented By Jamal]]]]]]]]]]]]]] //
        //               Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //                 children: [
        //                   GestureDetector(
        //                       onTap: () async {
        //                         // await controller.pickImage(ImageSource.camera);
        //                         // Get.back();
        //                         // Get.to(() => ScannerWidget());
        //                          File? image = await controller.pickImage(ImageSource.camera);
        // Get.back();
        // if (image != null) {
        //   Get.to(() => ScannerWidget());
        // }
        //                       },
        //                       child: _buildImageOption(
        //                           Icons.camera_alt, 'Camera')),
        //                   GestureDetector(
        //                       onTap: () async {
        //                         // await controller.pickImage(ImageSource.gallery);
        //                         // Get.back();

        //                         // Get.to(() => ScannerWidget());
        //                          File? image = await controller.pickImage(ImageSource.gallery);
        // Get.back();
        // if (image != null) {
        //   Get.to(() => ScannerWidget());
        // }
        //                       },
        //                       child: _buildImageOption(Icons.image, 'Gallery')),
        //                 ],
        //               ),
        Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    GestureDetector(
      onTap: () async {
        // Show a dialog to inform the user that the internet connection is being checked
        Get.defaultDialog(
          title: "Checking Internet🚩",
           buttonColor: Colors.pink,
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 10),
              Text("Checking your connection..."),
            ],
          ),
          barrierDismissible: false, // Prevent dismissing the dialog
        );

        // Create an instance of InternetConnectionChecker using the named constructor
        final connectionChecker = InternetConnectionChecker.createInstance();
        final isConnected = await connectionChecker.hasConnection;

        // Close the checking dialog
        Get.back();

        if (isConnected) {
          // Proceed with picking image from camera
          File? image = await controller.pickImage(ImageSource.camera);
          Get.back();
          if (image != null) {
            Get.to(() => ScannerWidget());
          }
        } else {
          // Show an error dialog if there's no internet connection
          Get.defaultDialog(
            title: "No Internet 🚫",
             buttonColor: Colors.pink,
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Please check your internet connection and try again ❗",
                  style: TextStyle(color: Colors.red)),
            ),
            onConfirm: () {
              Get.back(); // Close the dialog
            },
            confirmTextColor: Colors.white,
          );
        }
      },
      child: _buildImageOption(Icons.camera_alt, 'Camera'),
    ),
    GestureDetector(
      onTap: () async {
        // Show a dialog to inform the user that the internet connection is being checked
        Get.defaultDialog(
          title: "Checking Internet🚩",
           buttonColor: Colors.pink,
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 10),
              Text("Checking your connection..."),
            ],
          ),
          barrierDismissible: false, // Prevent dismissing the dialog
        );

        // Create an instance of InternetConnectionChecker using the named constructor
        final connectionChecker = InternetConnectionChecker.createInstance();
        final isConnected = await connectionChecker.hasConnection;

        // Close the checking dialog
        Get.back();

        if (isConnected) {
          // Proceed with picking image from gallery
          File? image = await controller.pickImage(ImageSource.gallery);
          Get.back();
          if (image != null) {
            Get.to(() => ScannerWidget());
          }
        } else {
          // Show an error dialog if there's no internet connection
          Get.defaultDialog(
            title: "No Internet 🚫",
             buttonColor: Colors.pink,
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Please check your internet connection and try again.❗",
                  style: TextStyle(color: Colors.red)),
            ),
            onConfirm: () {
              Get.back(); // Close the dialog
            },
            confirmTextColor: Colors.white,
          );
        }
      },
      child: _buildImageOption(Icons.image, 'Gallery'),
    ),
  ],
),

                   
                    ],
                  ),
                );
              });
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: Colors.pink,
        child: Icon(
          Icons.add_photo_alternate_outlined,
          color: Colors.white,
        ),
      ),

      bottomNavigationBar:
          Obx(() => controller.responseStatus.value == ResponseStatus.success
              ? BottomNavigationBar(
                  currentIndex: controller.selectedIndex.value,
                  onTap: controller.changeTabIndex,
                  items: [
                    nav_bar(AppImages.face, "Face"),
                    nav_bar(AppImages.lips, "Lips"),
                    nav_bar(AppImages.eyes, "Eyes"),
                    nav_bar(AppImages.nose, "Nose"),
                    nav_bar(AppImages.eyebrows, "EyeBrows"),
                  ],
                  selectedItemColor: Colors.pink,
                  unselectedItemColor: Colors.grey,
                )
              : Container(
                  height: 0,
                )),
      // appBar: AppBar(
      //   title: Text(
      //     "Face Reading",
      //     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      //   ),
      //   leading: GestureDetector(
      //       onTap: () {
      //         Get.back();
      //       },
      //       child: Icon(Icons.arrow_back_ios_new_rounded)),
      // ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: SizeConfig.blockSizeVertical * 38,
                width: SizeConfig.screenWidth,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0xFFFFA9DE),
                    Color(0xFFFFBFB3),
                    Color(0xFFDD87D9)
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(
                        SizeConfig.blockSizeHorizontal * 2,
                      ),
                      bottomLeft: Radius.circular(
                        SizeConfig.blockSizeHorizontal * 2,
                      )),
                  border: Border.all(color: Color(0xFFDD87D9)),
                ),
                child: SafeArea(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 4,
                          ),
                          height: SizeConfig.blockSizeVertical * 8,
                          width: SizeConfig.blockSizeHorizontal * 10,
                          decoration: BoxDecoration(
                            color: Color(0xFFE9A5B1),
                            shape: BoxShape.circle,
                            border: Border.all(color: Color(0xFFDD87D9)),
                          ),
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 10,
                            top: SizeConfig.blockSizeVertical * 1),
                        height: SizeConfig.blockSizeVertical * 5,
                        width: SizeConfig.blockSizeHorizontal * 55,
                        decoration: BoxDecoration(
                            color: Color(0xFFE9A5B1),
                            border: Border.all(color: Color(0xFFDD87D9)),
                            borderRadius: BorderRadius.circular(
                                SizeConfig.blockSizeHorizontal * 6)),
                        child: Center(
                          child: Text(
                            "Face Reading",
                            style: TextStyle(
                                fontSize: SizeConfig.blockSizeHorizontal * 6,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                                // color: Color(0xFFDD87D9)
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Obx(() => controller.selectedImage.value != null
                  ? Positioned(
                      top: SizeConfig.blockSizeVertical * 11,
                      left: SizeConfig.blockSizeHorizontal * 25,
                      child: Container(
                        width: SizeConfig.blockSizeHorizontal * 50,
                        height: SizeConfig.blockSizeVertical * 23,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 3),
                        ),
                        child: CircleAvatar(
                          radius: SizeConfig.blockSizeHorizontal *
                              25, // Half of container size
                          backgroundColor: Colors.grey.shade200,
                          backgroundImage:
                              FileImage(controller.selectedImage.value!),
                        ),
                      ),
                    )
                  : Positioned(
                      top: SizeConfig.blockSizeVertical * 11,
                      left: SizeConfig.blockSizeHorizontal * 25,
                      child: Container(
                        width: SizeConfig.blockSizeHorizontal * 50,
                        height: SizeConfig.blockSizeVertical * 23,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 3),
                        ),
                        child: CircleAvatar(
                          radius: SizeConfig.blockSizeHorizontal * 25,
                          backgroundColor: Colors.grey.shade200,
                          child: Text(
                            "Add Image",
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                        ),
                      ),
                    )),
            ],
          ),
          verticalSpace(SizeConfig.blockSizeVertical * 3),
          Obx(() => controller.responseStatus.value == ResponseStatus.success
              ? Container(
                  height: 240,
                  width: 350,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      controller.selectedFeature.value,
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                )
              : Container()),
        ],
      ),
      // SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       Obx(
      //         () => Stack(
      //           children: [
      //             controller.selectedImage.value != null
      //                 ? Container(
      //                     width: double.infinity,
      //                     height: 300,
      //                     child: Image.file(
      //                       controller.selectedImage.value!,
      //                       fit: BoxFit.fill,
      //                     ),
      //                   )
      //                 : Container(
      //                     width: double.infinity,
      //                     height: 300,
      //                     decoration:
      //                         BoxDecoration(color: Colors.grey.shade200),
      //                     child: Center(
      //                       child: Text(
      //                         "Add Image",
      //                         style:
      //                             TextStyle(fontSize: 18, color: Colors.grey),
      //                       ),
      //                     ),
      //                   ),
      //             Positioned(
      //               right: 16.0,
      //               bottom: 16.0,
      //               child: FloatingActionButton(
      //                 onPressed: () {
      //                   showDialog(
      //                       context: context,
      //                       builder: (BuildContext context) {
      //                         return AlertDialog(
      //                           shape: RoundedRectangleBorder(
      //                               borderRadius: BorderRadius.circular(8)),
      //                           content: Column(
      //                             mainAxisSize: MainAxisSize.min,
      //                             children: [
      //                               Text(
      //                                 'Choose Image',
      //                                 style: TextStyle(
      //                                   fontSize: 20,
      //                                   fontWeight: FontWeight.bold,
      //                                 ),
      //                               ),
      //                               Row(
      //                                 mainAxisAlignment:
      //                                     MainAxisAlignment.spaceEvenly,
      //                                 children: [
      //                                   GestureDetector(
      //                                       onTap: () async {
      //                                         await controller.pickImage(
      //                                             ImageSource.camera);
      //                                         Get.back();

      //                                         Get.to(() => ScannerWidget());
      //                                       },
      //                                       child: _buildImageOption(
      //                                           Icons.camera_alt, 'Camera')),
      //                                   GestureDetector(
      //                                       onTap: () async {
      //                                         await controller.pickImage(
      //                                             ImageSource.gallery);
      //                                         Get.back();

      //                                         Get.to(() => ScannerWidget());
      //                                       },
      //                                       child: _buildImageOption(
      //                                           Icons.image, 'Gallery')),
      //                                 ],
      //                               ),
      //                             ],
      //                           ),
      //                         );
      //                       });
      //                 },
      //                 shape: RoundedRectangleBorder(
      //                     borderRadius: BorderRadius.circular(16)),
      //                 backgroundColor: Colors.teal,
      //                 child: Icon(
      //                   Icons.add_photo_alternate_outlined,
      //                   color: Colors.white,
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //       verticalSpace(16),
      //       Obx(() => controller.responseStatus.value == ResponseStatus.success
      //           ? Container(
      //               height: 240,
      //               width: 350,
      //               decoration: BoxDecoration(
      //                   color: Colors.white,
      //                   borderRadius: BorderRadius.circular(16)),
      //               child: Padding(
      //                 padding: EdgeInsets.all(16),
      //                 child: Text(
      //                   controller.selectedFeature.value,
      //                   style: TextStyle(fontSize: 16, color: Colors.black),
      //                 ),
      //               ),
      //             )
      //           : Container()),
      //     ],
      //   ),
      // ),
    );
  }

  BottomNavigationBarItem nav_bar(String image, String text) {
    return BottomNavigationBarItem(
        icon: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(SizeConfig.blockSizeHorizontal * 1),
            ),
            child: Image.asset(
              image,
              width: SizeConfig.blockSizeHorizontal * 9,
              fit: BoxFit.fill,
            )),
        label: text);
  }

  Widget _buildImageOption(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon,
            color: Colors.pink, size: SizeConfig.blockSizeHorizontal * 10),
        verticalSpace(SizeConfig.blockSizeVertical * 1),
        Text(label,
            style: TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 3.5)),
      ],
    );
  }
}
