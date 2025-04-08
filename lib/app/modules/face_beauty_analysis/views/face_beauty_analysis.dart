import 'package:cached_network_image/cached_network_image.dart';
import 'package:face_scanner/app/data/beauty_analysis.dart';
import 'package:face_scanner/app/data/response_status.dart';
import 'package:face_scanner/app/modules/face_beauty_analysis/controller/face_beauty_analysis_ctl.dart';
import 'package:face_scanner/app/modules/home/views/helping_widgets/circular_graph.dart';
import 'package:face_scanner/app/providers/admob_ads_provider.dart';
import 'package:face_scanner/app/routes/app_pages.dart';
import 'package:face_scanner/app/utills/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

class FaceBeautyAnalysis extends GetView<FaceBeautyAnalysisCtl> {
  const FaceBeautyAnalysis({super.key});

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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                              onTap: () async {
                                await controller.pickImage(ImageSource.camera);
                                Get.back();
                                // Get.to(() => scanner_method());
                              },
                              child: _buildImageOption(
                                  Icons.camera_alt, 'Camera')),
                          GestureDetector(
                              onTap: () async {
                                await controller.pickImage(ImageSource.gallery);
                                Get.back();
                                // Get.to(() => scanner_method());
                              },
                              child: _buildImageOption(Icons.image, 'Gallery')),
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
      // appBar: AppBar(
      //   title: Text(
      //     "Face Beauty Analysis",
      //     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      //   ),
      //   leading: GestureDetector(
      //       onTap: () {
      //         Get.back();
      //       },
      //       child: Icon(Icons.arrow_back_ios_new_rounded)),
      // ),
      body: SingleChildScrollView(
        child: Column(
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
                            AdMobAdsProvider.instance.showInterstitialAd((){});
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
                              "Beauty Analysis",
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
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey),
                            ),
                          ),
                        ),
                      )),
              ],
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  verticalSpace(SizeConfig.blockSizeVertical * 1),
                  // [[[[[[Commented  By Jamal]]]]]] //
                  
                  // Obx(() => controller.selectedImage.value != null &&
                  //         controller.responseStatus.value == ResponseStatus.idle
                  //     ? GestureDetector(
                  //         onTap: () {
                            
                  //           controller.sendImageToGoogleAI(
                  //               controller.selectedImage.value!);
                  //         },
                  //         child: Container(
                  //           // margin: EdgeInsets.only(
                  //           //     top: SizeConfig.blockSizeVertical * 34.5,
                  //           //     left: SizeConfig.blockSizeHorizontal * 25),
                  //           height: SizeConfig.blockSizeVertical * 6,
                  //           width: SizeConfig.blockSizeHorizontal * 50,
                  //           decoration: BoxDecoration(
                  //               gradient: LinearGradient(
                  //                   colors: [Colors.pink.shade200, Colors.pink],
                  //                   begin: Alignment.topCenter,
                  //                   end: Alignment.bottomCenter),
                  //               border:
                  //                   Border.all(color: Colors.pink, width: 2),
                  //               borderRadius: BorderRadius.circular(
                  //                   SizeConfig.blockSizeHorizontal * 7)),
                  //           child: Center(
                  //             child: Text(
                  //               "Analyze Beauty",
                  //               style: TextStyle(
                  //                   fontSize:
                  //                       SizeConfig.blockSizeHorizontal * 5,
                  //                   // fontWeight: FontWeight.bold,
                  //                   color: Colors.white),
                  //             ),
                  //           ),
                  //         ),
                  //       )
                  //     : Container()),
                  Obx(() => controller.selectedImage.value != null &&
        controller.responseStatus.value == ResponseStatus.idle
    ? GestureDetector(
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
            // Proceed with sending the image if connected
            controller.sendImageToGoogleAI(controller.selectedImage.value!);
          } else {
            // Show an error dialog if there's no internet connection
            Get.defaultDialog(
              title: "No Internet 🚫",
              buttonColor: Colors.pink,
              content: Padding(
                padding: const EdgeInsets.all(8.0),
                
                child: Text("Please check your internet connection and try again❗",
                    style: TextStyle(color: Colors.red)),
              ),
              onConfirm: () {
                Get.back(); // Close the dialog
              },
              confirmTextColor: Colors.white,
            );
          }
        },
        child: Container(
          height: SizeConfig.blockSizeVertical * 6,
          width: SizeConfig.blockSizeHorizontal * 50,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.pink.shade200, Colors.pink],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
            border: Border.all(color: Colors.pink, width: 2),
            borderRadius: BorderRadius.circular(SizeConfig.blockSizeHorizontal * 7),
          ),
          child: Center(
            child: Text(
              "Analyze Beauty",
              style: TextStyle(
                fontSize: SizeConfig.blockSizeHorizontal * 5,
                color: Colors.white,
              ),
            ),
          ),
        ),
      )
    : Container()),
                
                
                  Obx(() {
                    switch (controller.responseStatus.value) {
                      case ResponseStatus.success:
                        return SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: SizeConfig.blockSizeVertical * 3),
                            // height: SizeConfig.blockSizeVertical * 50,
                            width: SizeConfig.screenWidth,
                            color: Colors.white,
                            child: Column(
                              children: [
                                // Row with Graph and List
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    // Graph on the left
                                    Center(
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Graph(
                                            size: SizeConfig.blockSizeVertical *
                                                25,
                                            color: Colors.pink,
                                            progress: controller.beauty_analysis
                                                    .value!.score *
                                                0.1,
                                          ),
                                          Container(
                                            height:
                                                SizeConfig.blockSizeVertical *
                                                    20,
                                            width:
                                                SizeConfig.blockSizeHorizontal *
                                                    33,
                                            decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                    colors: [
                                                      Color(0xFFFFA9DE),
                                                      Color(0xFFFFBFB3),
                                                      Color(0xFFDD87D9)
                                                    ],
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight),
                                                // color: Colors.teal.shade100,
                                                shape: BoxShape.circle),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Beauty Score",
                                                  style: TextStyle(
                                                      fontSize: SizeConfig
                                                              .blockSizeHorizontal *
                                                          4,
                                                      color: Colors.black),
                                                ),
                                                Text.rich(
                                                  TextSpan(
                                                    children: [
                                                      TextSpan(
                                                          text:
                                                              "${controller.beauty_analysis.value!.score}",
                                                          style: TextStyle(
                                                              fontSize: SizeConfig
                                                                      .blockSizeHorizontal *
                                                                  8,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Colors
                                                                  .black)),
                                                      TextSpan(
                                                        text: " /10",
                                                        style: TextStyle(
                                                            fontSize: SizeConfig
                                                                    .blockSizeHorizontal *
                                                                4,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // List on the right
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        simple_text("Gender"),
                                        bold_text(
                                            "${controller.beauty_analysis.value!.gender}"),
                                        simple_text("Age"),
                                        bold_text(
                                            "${controller.beauty_analysis.value!.age}"),
                                        simple_text("Glasses"),
                                        bold_text(
                                            "${controller.beauty_analysis.value!.glass ? "Yes" : "No"}"),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        simple_text("Smile"),
                                        bold_text(
                                            "${controller.beauty_analysis.value!.smile}%"),
                                        simple_text("Ethnicity"),
                                        bold_text(
                                            "${controller.beauty_analysis.value!.ethnicity}"),
                                        simple_text("Face Quality"),
                                        bold_text(
                                            "${controller.beauty_analysis.value!.faceQuality}%"),
                                      ],
                                    ),
                                  ],
                                ),
                                // Dummy Text below
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal:
                                        SizeConfig.blockSizeHorizontal * 3,
                                    vertical: SizeConfig.blockSizeVertical * 3,
                                  ),
                                  child: Text(
                                    "${controller.beauty_analysis.value!.face_description}",
                                    style: TextStyle(
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal * 4),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                // IconButton(
                                //     onPressed: () {
                                //       Get.toNamed(Routes.AICHATVIEW, arguments: [
                                //         true,
                                //         controller.beauty_analysis.value!
                                //             .face_description,
                                //         controller.beauty_analysis.value!
                                //             .face_description_solution_question
                                //       ]);
                                //     },
                                //     icon: Icon(
                                //       Icons.error_outline,
                                //       color: Colors.red,
                                //       size: 40,
                                //     ))
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(Routes.AICHATVIEW, arguments: [
                                      true,
                                      controller.beauty_analysis.value!
                                          .face_description,
                                      controller.beauty_analysis.value!
                                          .face_description_solution_question
                                    ]);
                                  },
                                  child: SizedBox(
                                    height: 60,
                                    // width: 50,
                                    child: Lottie.asset(
                                        "assets/lottie/error.json",
                                        fit: BoxFit.contain),
                                  ),
                                )

                                // Container(
                                //   height: SizeConfig.blockSizeVertical * 6,
                                //   decoration: BoxDecoration(
                                //       color: , shape: BoxShape.circle),
                                //   child: Icon(Icons.error_outline),
                                // )
                              ],
                            ),
                          ),
                        );

                      // Shimmer effect
                      case ResponseStatus.progress:
                        return SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: SizeConfig.blockSizeVertical * 3),
                            height: SizeConfig.blockSizeVertical * 50,
                            width: SizeConfig.screenWidth,
                            color: Colors.white,
                            child: Column(
                              children: [
                                // Row with Graph and List
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    // Graph on the left
                                    Center(
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Shimmer.fromColors(
                                            baseColor: Colors.grey.shade300,
                                            highlightColor:
                                                Colors.grey.shade100,
                                            direction: ShimmerDirection.btt,
                                            child: Graph(
                                              size:
                                                  SizeConfig.blockSizeVertical *
                                                      25,
                                              color: Colors.pink,
                                              progress: 0.5,
                                              // controller
                                              //         .beauty_analysis.value!.score *
                                              //     0.1,
                                            ),
                                          ),
                                          Container(
                                            height:
                                                SizeConfig.blockSizeVertical *
                                                    20,
                                            width:
                                                SizeConfig.blockSizeHorizontal *
                                                    33,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Beauty Score",
                                                  style: TextStyle(
                                                    fontSize: SizeConfig
                                                            .blockSizeHorizontal *
                                                        4,
                                                  ),
                                                ),
                                                Text.rich(
                                                  TextSpan(
                                                    children: [
                                                      TextSpan(
                                                          text: "",
                                                          // "${controller.beauty_analysis.value!.score}",
                                                          style: TextStyle(
                                                              fontSize: SizeConfig
                                                                      .blockSizeHorizontal *
                                                                  8,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                      TextSpan(
                                                        text: " /10",
                                                        style: TextStyle(
                                                            fontSize: SizeConfig
                                                                    .blockSizeHorizontal *
                                                                4,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // List on the right
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        simple_text("Gender"),
                                        shimmer_effect(
                                            SizeConfig.blockSizeHorizontal *
                                                10),
                                        simple_text("Age"),
                                        shimmer_effect(
                                          SizeConfig.blockSizeHorizontal * 6,
                                        ),
                                        simple_text("Glasses"),
                                        shimmer_effect(
                                          SizeConfig.blockSizeHorizontal * 10,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        simple_text("Smile"),
                                        shimmer_effect(
                                          SizeConfig.blockSizeHorizontal * 9,
                                        ),
                                        simple_text("Ethnicity"),
                                        shimmer_effect(
                                          SizeConfig.blockSizeHorizontal * 13,
                                        ),
                                        simple_text("Face Quality"),
                                        shimmer_effect(
                                          SizeConfig.blockSizeHorizontal * 19,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                // Dummy Text below
                                Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal:
                                          SizeConfig.blockSizeHorizontal * 3,
                                      vertical:
                                          SizeConfig.blockSizeVertical * 4.5,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        shimmer_effect(
                                            SizeConfig.blockSizeHorizontal *
                                                90),
                                        verticalSpace(
                                            SizeConfig.blockSizeVertical * 1),
                                        shimmer_effect(
                                            SizeConfig.blockSizeHorizontal *
                                                85),
                                        verticalSpace(
                                            SizeConfig.blockSizeVertical * 1),
                                        shimmer_effect(
                                            SizeConfig.blockSizeHorizontal *
                                                75), // Shorter line
                                        verticalSpace(
                                            SizeConfig.blockSizeVertical * 1),
                                        shimmer_effect(
                                            SizeConfig.blockSizeHorizontal *
                                                88),
                                        verticalSpace(
                                            SizeConfig.blockSizeVertical * 1),
                                        shimmer_effect(
                                            SizeConfig.blockSizeHorizontal *
                                                78), // Shorter line
                                        verticalSpace(
                                            SizeConfig.blockSizeVertical * 1),
                                        shimmer_effect(
                                            SizeConfig.blockSizeHorizontal *
                                                80),
                                        verticalSpace(
                                            SizeConfig.blockSizeVertical * 1),
                                        shimmer_effect(
                                            SizeConfig.blockSizeHorizontal *
                                                55), // Much shorter line
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        );
                      // Center(
                      //   child: Shimmer.fromColors(
                      //     baseColor: Colors.grey.shade300,
                      //     highlightColor: Colors.grey.shade100,
                      //     child: Container(
                      //       height: SizeConfig.blockSizeVertical * 50,
                      //       width: SizeConfig.screenWidth,
                      //       decoration: BoxDecoration(color: Colors.white),
                      //     ),
                      //   ),
                      // );
                      case ResponseStatus.failed:
                        return Center(
                          child: Text(
                            "Failed to load data",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                            ),
                          ),
                        );
                      case ResponseStatus.idle:
                        return Container(); // Add idle state handling if needed
                      default:
                        return Container();
                    }
                  }),
                ],
              ),
            ),
          ],
        ),
      ),

      // SingleChildScrollView(
      //   child: Container(
      //     // height: SizeConfig.blockSizeVertical * 43,
      //     width: SizeConfig.screenWidth,
      //     decoration: BoxDecoration(
      //       gradient: LinearGradient(colors: [
      //         Color(0xFFFFA9DE),
      //         Color(0xFFFFBFB3),
      //         Color(0xFFDD87D9)
      //       ], begin: Alignment.topLeft, end: Alignment.bottomRight),
      //       borderRadius: BorderRadius.only(
      //           bottomRight: Radius.circular(
      //             SizeConfig.blockSizeHorizontal * 2,
      //           ),
      //           bottomLeft: Radius.circular(
      //             SizeConfig.blockSizeHorizontal * 2,
      //           )),
      //       border: Border.all(color: Color(0xFFDD87D9)),
      //     ),
      //     child: Column(
      //       children: [
      //         Row(
      //           children: [
      //             GestureDetector(
      //               onTap: () {
      //                 Get.back();
      //               },
      //               child: Container(
      //                 margin: EdgeInsets.only(
      //                     left: SizeConfig.blockSizeHorizontal * 4,
      //                     top: SizeConfig.blockSizeVertical * 1),
      //                 height: SizeConfig.blockSizeVertical * 8,
      //                 width: SizeConfig.blockSizeHorizontal * 9,
      //                 decoration: BoxDecoration(
      //                   color: Color(0xFFE9A5B1),
      //                   shape: BoxShape.circle,
      //                   border: Border.all(color: Color(0xFFDD87D9)),
      //                 ),
      //                 child: Icon(
      //                   Icons.arrow_back_ios_new_rounded,
      //                   color: Colors.black,
      //                 ),
      //               ),
      //             ),
      //             Container(
      //               margin: EdgeInsets.only(
      //                   left: SizeConfig.blockSizeHorizontal * 10,
      //                   top: SizeConfig.blockSizeVertical * 1),
      //               height: SizeConfig.blockSizeVertical * 5,
      //               width: SizeConfig.blockSizeHorizontal * 55,
      //               decoration: BoxDecoration(
      //                   color: Color(0xFFE9A5B1),
      //                   border: Border.all(color: Color(0xFFDD87D9)),
      //                   borderRadius: BorderRadius.circular(
      //                       SizeConfig.blockSizeHorizontal * 6)),
      //               child: Center(
      //                 child: Text(
      //                   "Beauty Analysis",
      //                   style: TextStyle(
      //                       fontSize: SizeConfig.blockSizeHorizontal * 6,
      //                       fontWeight: FontWeight.bold,
      //                       color: Colors.black
      //                       // color: Color(0xFFDD87D9)
      //                       ),
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //         Obx(
      //           () => Stack(
      //             children: [
      //               controller.selectedImage.value != null
      //                   ? Container(
      //                       width: SizeConfig.blockSizeHorizontal * 50,
      //                       height: SizeConfig.blockSizeVertical * 23,
      //                       decoration: BoxDecoration(
      //                         shape: BoxShape.circle,
      //                         border: Border.all(color: Colors.white, width: 3),
      //                       ),
      //                       child: CircleAvatar(
      //                         radius: SizeConfig.blockSizeHorizontal *
      //                             25, // Half of container size
      //                         backgroundColor: Colors.grey.shade200,
      //                         backgroundImage:
      //                             FileImage(controller.selectedImage.value!),
      //                       ),
      //                     )
      //                   : Container(
      //                       width: SizeConfig.blockSizeHorizontal * 50,
      //                       height: SizeConfig.blockSizeVertical * 23,
      //                       decoration: BoxDecoration(
      //                         shape: BoxShape.circle,
      //                         border: Border.all(color: Colors.white, width: 3),
      //                       ),
      //                       child: CircleAvatar(
      //                         radius: SizeConfig.blockSizeHorizontal * 25,
      //                         backgroundColor: Colors.grey.shade200,
      //                         child: Text(
      //                           "Add Image",
      //                           style:
      //                               TextStyle(fontSize: 18, color: Colors.grey),
      //                         ),
      //                       ),
      //                     ),
      //               // controller.selectedImage.value != null
      //               //     ? Container(
      //               //         // width: double.infinity,
      //               //         // height: 300,
      //               //         width: SizeConfig.blockSizeHorizontal * 50,

      //               //         height: SizeConfig.blockSizeVertical * 20,
      //               //         decoration: BoxDecoration(
      //               //             color: Colors.grey.shade200,
      //               //             shape: BoxShape.circle,
      //               //             border:
      //               //                 Border.all(color: Colors.white, width: 3)),
      //               //         child: Image.file(
      //               //           controller.selectedImage.value!,
      //               //           fit: BoxFit.fill,
      //               //         ),
      //               //       )
      //               //     : Container(
      //               //         // width: double.infinity,
      //               //         width: SizeConfig.blockSizeHorizontal * 50,
      //               //         // height: 300,
      //               //         height: SizeConfig.blockSizeVertical * 25,
      //               //         decoration: BoxDecoration(
      //               //             color: Colors.grey.shade200,
      //               //             shape: BoxShape.circle,
      //               //             border:
      //               //                 Border.all(color: Colors.white, width: 3)),
      //               //         child: Center(
      //               //           child: Text(
      //               //             "Add Image",
      //               //             style:
      //               //                 TextStyle(fontSize: 18, color: Colors.grey),
      //               //           ),
      //               //         ),
      //               //       ),
      //               // Positioned(
      //               //   right: 16.0,
      //               //   bottom: 16.0,
      //               //   child: FloatingActionButton(
      //               //     onPressed: () {
      //               //       showDialog(
      //               //           context: context,
      //               //           builder: (BuildContext context) {
      //               //             return AlertDialog(
      //               //               shape: RoundedRectangleBorder(
      //               //                   borderRadius: BorderRadius.circular(8)),
      //               //               content: Column(
      //               //                 mainAxisSize: MainAxisSize.min,
      //               //                 children: [
      //               //                   Text(
      //               //                     'Choose Image',
      //               //                     style: TextStyle(
      //               //                       fontSize: 20,
      //               //                       fontWeight: FontWeight.bold,
      //               //                     ),
      //               //                   ),
      //               //                   Row(
      //               //                     mainAxisAlignment:
      //               //                         MainAxisAlignment.spaceEvenly,
      //               //                     children: [
      //               //                       GestureDetector(
      //               //                           onTap: () async {
      //               //                             await controller.pickImage(
      //               //                                 ImageSource.camera);
      //               //                             Get.back();
      //               //                             // Get.to(() => scanner_method());
      //               //                           },
      //               //                           child: _buildImageOption(
      //               //                               Icons.camera_alt, 'Camera')),
      //               //                       GestureDetector(
      //               //                           onTap: () async {
      //               //                             await controller.pickImage(
      //               //                                 ImageSource.gallery);
      //               //                             Get.back();
      //               //                             // Get.to(() => scanner_method());
      //               //                           },
      //               //                           child: _buildImageOption(
      //               //                               Icons.image, 'Gallery')),
      //               //                     ],
      //               //                   ),
      //               //                 ],
      //               //               ),
      //               //             );
      //               //           });
      //               //     },
      //               //     shape: RoundedRectangleBorder(
      //               //         borderRadius: BorderRadius.circular(16)),
      //               //     backgroundColor: Colors.teal,
      //               //     child: Icon(
      //               //       Icons.add_photo_alternate_outlined,
      //               //       color: Colors.white,
      //               //     ),
      //               //   ),
      //               // ),
      //             ],
      //           ),
      //         ),
      //         verticalSpace(SizeConfig.blockSizeVertical * 2),
      //         Obx(() => controller.selectedImage.value != null &&
      //                 controller.responseStatus.value == ResponseStatus.idle
      //             ? GestureDetector(
      //                 onTap: () {
      //                   controller.sendImageToGoogleAI(
      //                       controller.selectedImage.value!);
      //                 },
      //                 child: Container(
      //                   height: SizeConfig.blockSizeVertical * 6,
      //                   width: SizeConfig.blockSizeHorizontal * 50,
      //                   decoration: BoxDecoration(
      //                       gradient: LinearGradient(
      //                           colors: [Colors.pink.shade300, Colors.pink],
      //                           begin: Alignment.topCenter,
      //                           end: Alignment.bottomCenter),
      //                       border: Border.all(color: Colors.pink, width: 2),
      //                       borderRadius: BorderRadius.circular(
      //                           SizeConfig.blockSizeHorizontal * 7)),
      //                   child: Center(
      //                     child: Text(
      //                       "Analyze Beauty",
      //                       style: TextStyle(
      //                           fontSize: SizeConfig.blockSizeHorizontal * 5,
      //                           // fontWeight: FontWeight.bold,
      //                           color: Colors.white),
      //                     ),
      //                   ),
      //                 ),
      //               )
      //             : Container()),
      //         Obx(() {
      //           switch (controller.responseStatus.value) {
      //             case ResponseStatus.success:
      //               return SingleChildScrollView(
      //                 child: Container(
      //                   padding: EdgeInsets.symmetric(
      //                       vertical: SizeConfig.blockSizeVertical * 3),
      //                   // height: SizeConfig.blockSizeVertical * 50,
      //                   width: SizeConfig.screenWidth,
      //                   color: Colors.white,
      //                   child: Column(
      //                     children: [
      //                       // Row with Graph and List
      //                       Row(
      //                         crossAxisAlignment: CrossAxisAlignment.center,
      //                         mainAxisAlignment: MainAxisAlignment.spaceAround,
      //                         children: [
      //                           // Graph on the left
      //                           Center(
      //                             child: Stack(
      //                               alignment: Alignment.center,
      //                               children: [
      //                                 Graph(
      //                                   size: SizeConfig.blockSizeVertical * 25,
      //                                   color: Colors.pink,
      //                                   progress: controller
      //                                           .beauty_analysis.value!.score *
      //                                       0.1,
      //                                 ),
      //                                 Container(
      //                                   height:
      //                                       SizeConfig.blockSizeVertical * 20,
      //                                   width:
      //                                       SizeConfig.blockSizeHorizontal * 33,
      //                                   decoration: BoxDecoration(
      //                                       gradient: LinearGradient(
      //                                           colors: [
      //                                             Color(0xFFFFA9DE),
      //                                             Color(0xFFFFBFB3),
      //                                             Color(0xFFDD87D9)
      //                                           ],
      //                                           begin: Alignment.topLeft,
      //                                           end: Alignment.bottomRight),
      //                                       // color: Colors.teal.shade100,
      //                                       shape: BoxShape.circle),
      //                                   child: Column(
      //                                     mainAxisAlignment:
      //                                         MainAxisAlignment.center,
      //                                     children: [
      //                                       Text(
      //                                         "Beauty Score",
      //                                         style: TextStyle(
      //                                             fontSize: SizeConfig
      //                                                     .blockSizeHorizontal *
      //                                                 4,
      //                                             color: Colors.black),
      //                                       ),
      //                                       Text.rich(
      //                                         TextSpan(
      //                                           children: [
      //                                             TextSpan(
      //                                                 text:
      //                                                     "${controller.beauty_analysis.value!.score}",
      //                                                 style: TextStyle(
      //                                                     fontSize: SizeConfig
      //                                                             .blockSizeHorizontal *
      //                                                         8,
      //                                                     fontWeight:
      //                                                         FontWeight.bold,
      //                                                     color: Colors.black)),
      //                                             TextSpan(
      //                                               text: " /10",
      //                                               style: TextStyle(
      //                                                   fontSize: SizeConfig
      //                                                           .blockSizeHorizontal *
      //                                                       4,
      //                                                   fontWeight:
      //                                                       FontWeight.bold,
      //                                                   color: Colors.black),
      //                                             ),
      //                                           ],
      //                                         ),
      //                                       ),
      //                                     ],
      //                                   ),
      //                                 ),
      //                               ],
      //                             ),
      //                           ),
      //                           // List on the right
      //                           Column(
      //                             crossAxisAlignment: CrossAxisAlignment.start,
      //                             children: [
      //                               simple_text("Gender"),
      //                               bold_text(
      //                                   "${controller.beauty_analysis.value!.gender}"),
      //                               simple_text("Age"),
      //                               bold_text(
      //                                   "${controller.beauty_analysis.value!.age}"),
      //                               simple_text("Glasses"),
      //                               bold_text(
      //                                   "${controller.beauty_analysis.value!.glass ? "Yes" : "No"}"),
      //                             ],
      //                           ),
      //                           Column(
      //                             crossAxisAlignment: CrossAxisAlignment.start,
      //                             children: [
      //                               simple_text("Smile"),
      //                               bold_text(
      //                                   "${controller.beauty_analysis.value!.smile}%"),
      //                               simple_text("Ethnicity"),
      //                               bold_text(
      //                                   "${controller.beauty_analysis.value!.ethnicity}"),
      //                               simple_text("Face Quality"),
      //                               bold_text(
      //                                   "${controller.beauty_analysis.value!.faceQuality}%"),
      //                             ],
      //                           ),
      //                         ],
      //                       ),
      //                       // Dummy Text below
      //                       Padding(
      //                         padding: EdgeInsets.symmetric(
      //                           horizontal: SizeConfig.blockSizeHorizontal * 3,
      //                           vertical: SizeConfig.blockSizeVertical * 3,
      //                         ),
      //                         child: Text(
      //                           "${controller.beauty_analysis.value!.face_description}",
      //                           style: TextStyle(
      //                               fontSize:
      //                                   SizeConfig.blockSizeHorizontal * 4),
      //                           textAlign: TextAlign.left,
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               );

      //             // Shimmer effect
      //             case ResponseStatus.progress:
      //               return SingleChildScrollView(
      //                 child: Container(
      //                   padding: EdgeInsets.symmetric(
      //                       vertical: SizeConfig.blockSizeVertical * 3),
      //                   height: SizeConfig.blockSizeVertical * 50,
      //                   width: SizeConfig.screenWidth,
      //                   color: Colors.white,
      //                   child: Column(
      //                     children: [
      //                       // Row with Graph and List
      //                       Row(
      //                         crossAxisAlignment: CrossAxisAlignment.center,
      //                         mainAxisAlignment: MainAxisAlignment.spaceAround,
      //                         children: [
      //                           // Graph on the left
      //                           Center(
      //                             child: Stack(
      //                               alignment: Alignment.center,
      //                               children: [
      //                                 Shimmer.fromColors(
      //                                   baseColor: Colors.grey.shade300,
      //                                   highlightColor: Colors.grey.shade100,
      //                                   direction: ShimmerDirection.btt,
      //                                   child: Graph(
      //                                     size:
      //                                         SizeConfig.blockSizeVertical * 25,
      //                                     color: Colors.pink,
      //                                     progress: 0.5,
      //                                     // controller
      //                                     //         .beauty_analysis.value!.score *
      //                                     //     0.1,
      //                                   ),
      //                                 ),
      //                                 Container(
      //                                   height:
      //                                       SizeConfig.blockSizeVertical * 20,
      //                                   width:
      //                                       SizeConfig.blockSizeHorizontal * 33,
      //                                   decoration: BoxDecoration(
      //                                       color: Colors.white,
      //                                       shape: BoxShape.circle),
      //                                   child: Column(
      //                                     mainAxisAlignment:
      //                                         MainAxisAlignment.center,
      //                                     children: [
      //                                       Text(
      //                                         "Beauty Score",
      //                                         style: TextStyle(
      //                                           fontSize: SizeConfig
      //                                                   .blockSizeHorizontal *
      //                                               4,
      //                                         ),
      //                                       ),
      //                                       Text.rich(
      //                                         TextSpan(
      //                                           children: [
      //                                             TextSpan(
      //                                                 text: "",
      //                                                 // "${controller.beauty_analysis.value!.score}",
      //                                                 style: TextStyle(
      //                                                     fontSize: SizeConfig
      //                                                             .blockSizeHorizontal *
      //                                                         8,
      //                                                     fontWeight:
      //                                                         FontWeight.bold)),
      //                                             TextSpan(
      //                                               text: " /10",
      //                                               style: TextStyle(
      //                                                   fontSize: SizeConfig
      //                                                           .blockSizeHorizontal *
      //                                                       4,
      //                                                   fontWeight:
      //                                                       FontWeight.bold),
      //                                             ),
      //                                           ],
      //                                         ),
      //                                       ),
      //                                     ],
      //                                   ),
      //                                 ),
      //                               ],
      //                             ),
      //                           ),
      //                           // List on the right
      //                           Column(
      //                             crossAxisAlignment: CrossAxisAlignment.start,
      //                             children: [
      //                               simple_text("Gender"),
      //                               shimmer_effect(
      //                                   SizeConfig.blockSizeHorizontal * 10),
      //                               simple_text("Age"),
      //                               shimmer_effect(
      //                                 SizeConfig.blockSizeHorizontal * 6,
      //                               ),
      //                               simple_text("Glasses"),
      //                               shimmer_effect(
      //                                 SizeConfig.blockSizeHorizontal * 10,
      //                               ),
      //                             ],
      //                           ),
      //                           Column(
      //                             crossAxisAlignment: CrossAxisAlignment.start,
      //                             children: [
      //                               simple_text("Smile"),
      //                               shimmer_effect(
      //                                 SizeConfig.blockSizeHorizontal * 9,
      //                               ),
      //                               simple_text("Ethnicity"),
      //                               shimmer_effect(
      //                                 SizeConfig.blockSizeHorizontal * 13,
      //                               ),
      //                               simple_text("Face Quality"),
      //                               shimmer_effect(
      //                                 SizeConfig.blockSizeHorizontal * 19,
      //                               ),
      //                             ],
      //                           ),
      //                         ],
      //                       ),
      //                       // Dummy Text below
      //                       Padding(
      //                           padding: EdgeInsets.symmetric(
      //                             horizontal:
      //                                 SizeConfig.blockSizeHorizontal * 3,
      //                             vertical: SizeConfig.blockSizeVertical * 4.5,
      //                           ),
      //                           child: Column(
      //                             crossAxisAlignment: CrossAxisAlignment.start,
      //                             children: [
      //                               shimmer_effect(
      //                                   SizeConfig.blockSizeHorizontal * 90),
      //                               verticalSpace(
      //                                   SizeConfig.blockSizeVertical * 1),
      //                               shimmer_effect(
      //                                   SizeConfig.blockSizeHorizontal * 85),
      //                               verticalSpace(
      //                                   SizeConfig.blockSizeVertical * 1),
      //                               shimmer_effect(
      //                                   SizeConfig.blockSizeHorizontal *
      //                                       75), // Shorter line
      //                               verticalSpace(
      //                                   SizeConfig.blockSizeVertical * 1),
      //                               shimmer_effect(
      //                                   SizeConfig.blockSizeHorizontal * 88),
      //                               verticalSpace(
      //                                   SizeConfig.blockSizeVertical * 1),
      //                               shimmer_effect(
      //                                   SizeConfig.blockSizeHorizontal *
      //                                       78), // Shorter line
      //                               verticalSpace(
      //                                   SizeConfig.blockSizeVertical * 1),
      //                               shimmer_effect(
      //                                   SizeConfig.blockSizeHorizontal * 80),
      //                               verticalSpace(
      //                                   SizeConfig.blockSizeVertical * 1),
      //                               shimmer_effect(
      //                                   SizeConfig.blockSizeHorizontal *
      //                                       55), // Much shorter line
      //                             ],
      //                           )),
      //                     ],
      //                   ),
      //                 ),
      //               );
      //             // Center(
      //             //   child: Shimmer.fromColors(
      //             //     baseColor: Colors.grey.shade300,
      //             //     highlightColor: Colors.grey.shade100,
      //             //     child: Container(
      //             //       height: SizeConfig.blockSizeVertical * 50,
      //             //       width: SizeConfig.screenWidth,
      //             //       decoration: BoxDecoration(color: Colors.white),
      //             //     ),
      //             //   ),
      //             // );
      //             case ResponseStatus.failed:
      //               return Center(
      //                 child: Text(
      //                   "Failed to load data",
      //                   style: TextStyle(
      //                     color: Colors.red,
      //                     fontSize: 16,
      //                   ),
      //                 ),
      //               );
      //             case ResponseStatus.idle:
      //               return Container(); // Add idle state handling if needed
      //             default:
      //               return Container();
      //           }
      //         }),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }

  Shimmer shimmer_effect(double width) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: SizeConfig.blockSizeVertical * 1,
        width: width,
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(4)),
      ),
    );
  }

  Text bold_text(String bold_text_1) {
    return Text(
      bold_text_1,
      style: TextStyle(
          fontSize: SizeConfig.blockSizeHorizontal * 3.5,
          fontWeight: FontWeight.bold,
          color: Colors.black),
    );
  }

  Text simple_text(String simple_text_1) {
    return Text(
      simple_text_1,
      style: TextStyle(
          fontSize: SizeConfig.blockSizeHorizontal * 3.5,
          fontStyle: FontStyle.italic),
    );
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

  // Widget scanner_method() {
  //   return GetX<FaceReadingCtl>(
  //     builder: (controller) {
  //       return Container(
  //         height: SizeConfig.screenHeight,
  //         width: SizeConfig.screenWidth,
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             // Circular frame with the image inside
  //             Stack(
  //               alignment: Alignment.center,
  //               children: [
  //                 DottedBorder(
  //                   borderType: BorderType.Circle,
  //                   color: Colors.greenAccent,
  //                   strokeWidth: 2,
  //                   dashPattern: [6, 3],
  //                   child: Container(
  //                     width: 200,
  //                     height: 200,
  //                   ),
  //                 ),
  //                 CircleAvatar(
  //                   radius: 95,
  //                   backgroundColor: Colors.white,
  //                   backgroundImage: controller.selectedImage.value != null
  //                       ? FileImage(controller.selectedImage.value!)
  //                       : null,
  //                 ),
  //                 Positioned(
  //                   top: 0,
  //                   left: 0,
  //                   child: Container(
  //                     width: SizeConfig.blockSizeHorizontal * 10,
  //                     height: SizeConfig.blockSizeVertical * 5,
  //                     decoration: BoxDecoration(
  //                       border: Border(
  //                         top: BorderSide(color: Colors.greenAccent, width: 4),
  //                         left: BorderSide(color: Colors.greenAccent, width: 4),
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //                 Positioned(
  //                   top: 0,
  //                   right: 0,
  //                   child: Container(
  //                     width: SizeConfig.blockSizeHorizontal * 10,
  //                     height: SizeConfig.blockSizeVertical * 5,
  //                     decoration: BoxDecoration(
  //                       border: Border(
  //                         top: BorderSide(color: Colors.greenAccent, width: 4),
  //                         right:
  //                             BorderSide(color: Colors.greenAccent, width: 4),
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //                 Positioned(
  //                   bottom: 0,
  //                   left: 0,
  //                   child: Container(
  //                     width: SizeConfig.blockSizeHorizontal * 10,
  //                     height: SizeConfig.blockSizeVertical * 5,
  //                     decoration: BoxDecoration(
  //                       border: Border(
  //                         bottom:
  //                             BorderSide(color: Colors.greenAccent, width: 4),
  //                         left: BorderSide(color: Colors.greenAccent, width: 4),
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //                 Positioned(
  //                   bottom: 0,
  //                   right: 0,
  //                   child: Container(
  //                     width: SizeConfig.blockSizeHorizontal * 10,
  //                     height: SizeConfig.blockSizeVertical * 5,
  //                     decoration: BoxDecoration(
  //                       border: Border(
  //                         bottom:
  //                             BorderSide(color: Colors.greenAccent, width: 4),
  //                         right:
  //                             BorderSide(color: Colors.greenAccent, width: 4),
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //                 // Scanning line with animation
  //                 Positioned(
  //                   top: controller.animationController.value * 180,
  //                   child: Container(
  //                     width: 180,
  //                     height: 2,
  //                     color: Colors.greenAccent,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             SizedBox(height: 30),
  //             Text(
  //               'SCANNING...',
  //               style: TextStyle(
  //                 color: Colors.greenAccent,
  //                 fontSize: 24,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //             SizedBox(height: 20),
  //             // Progress bar with animation
  //             Container(
  //               width: 250,
  //               height: 20,
  //               decoration: BoxDecoration(
  //                 border: Border.all(color: Colors.greenAccent),
  //                 borderRadius: BorderRadius.circular(5),
  //               ),
  //               child: Row(
  //                 children: List.generate(20, (index) {
  //                   return Expanded(
  //                     child: Container(
  //                       margin: EdgeInsets.symmetric(horizontal: 1),
  //                       color: index < (controller.scanningProgress.value ~/ 5)
  //                           ? Colors.greenAccent
  //                           : Colors.black,
  //                     ),
  //                   );
  //                 }),
  //               ),
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }
}
