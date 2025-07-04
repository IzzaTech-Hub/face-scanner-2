import 'package:face_scanner/app/modules/beauty_score/controller/beauty_score_ctl.dart';
import 'package:face_scanner/app/providers/admob_ads_provider.dart';
import 'package:face_scanner/app/routes/app_pages.dart';
import 'package:face_scanner/app/utills/CM.dart';
import 'package:face_scanner/app/utills/app_strings.dart';
import 'package:face_scanner/app/utills/images.dart';
import 'package:face_scanner/app/utills/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class BeautyScore extends GetView<BeautyScoreCtl> {
   BeautyScore({super.key});

    // // // Native Ad Implementation start // // //

  //? commented by jamal start
  NativeAd? nativeAd;
  RxBool nativeAdIsLoaded = false.obs;

  initNative() {
    nativeAd = NativeAd(
      adUnitId: AppStrings.ADMOB_NATIVE,
      request: AdRequest(),
      // factoryId: ,
      nativeTemplateStyle:
          NativeTemplateStyle(templateType: TemplateType.medium),
      listener: NativeAdListener(
        onAdLoaded: (Ad ad) {
          print('$NativeAd loaded.');

          nativeAdIsLoaded.value = true;
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('$NativeAd failedToLoad: $error');
          ad.dispose();
        },
        onAdOpened: (Ad ad) => print('$NativeAd onAdOpened.'),
        onAdClosed: (Ad ad) => print('$NativeAd onAdClosed.'),
      ),
    )..load();
  }
  //? commented by jamal end

  /// Native Ad Implemntation End ///

  
  @override
  Widget build(BuildContext context) {
initNative();
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     "Beauty Score",
      //     style: TextStyle(
      //       fontSize: 24,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      //   centerTitle: true,
      //   leading: GestureDetector(
      //       onTap: () {
      //         Get.back();
      //       },
      //       child: Icon(Icons.arrow_back_ios_new_rounded)),
      // ),
      body: Column(
        children: [
          Container(
            height: SizeConfig.screenHeight,
            width: SizeConfig.screenWidth,
            child: Column(
              children: [
                // SafeArea(
                //   child: Row(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       GestureDetector(
                //         onTap: () {
                //           Get.back();
                //         },
                //         child: Container(
                //           margin: EdgeInsets.only(
                //             left: SizeConfig.blockSizeHorizontal * 4,
                //           ),
                //           height: SizeConfig.blockSizeVertical * 8,
                //           width: SizeConfig.blockSizeHorizontal * 10,
                //           decoration: BoxDecoration(
                //             color: Color(0xFFE9A5B1),
                //             shape: BoxShape.circle,
                //             border: Border.all(color: Color(0xFFDD87D9)),
                //           ),
                //           child: Icon(
                //             Icons.arrow_back_ios_new_rounded,
                //             color: Colors.black,
                //           ),
                //         ),
                //       ),
                //       Container(
                //         margin: EdgeInsets.only(
                //             left: SizeConfig.blockSizeHorizontal * 10,
                //             top: SizeConfig.blockSizeVertical * 1),
                //         height: SizeConfig.blockSizeVertical * 5,
                //         width: SizeConfig.blockSizeHorizontal * 55,
                //         decoration: BoxDecoration(
                //             color: Color(0xFFE9A5B1),
                //             border: Border.all(color: Color(0xFFDD87D9)),
                //             borderRadius: BorderRadius.circular(
                //                 SizeConfig.blockSizeHorizontal * 6)),
                //         child: Center(
                //           child: Text(
                //             "Beauty Score",
                //             style: TextStyle(
                //                 fontSize: SizeConfig.blockSizeHorizontal * 6,
                //                 fontWeight: FontWeight.bold,
                //                 color: Colors.black
                //                 // color: Color(0xFFDD87D9)
                //                 ),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),

                Expanded(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: SizeConfig.blockSizeVertical * 40,
                            width: SizeConfig.screenWidth,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Color(0xFFFFA9DE),
                                    Color(0xFFFFBFB3),
                                    Color(0xFFDD87D9)
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
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
                                        left:
                                            SizeConfig.blockSizeHorizontal * 4,
                                      ),
                                      height: SizeConfig.blockSizeVertical * 8,
                                      width:
                                          SizeConfig.blockSizeHorizontal * 10,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFE9A5B1),
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Color(0xFFDD87D9)),
                                      ),
                                      child: Icon(
                                        Icons.arrow_back_ios_new_rounded,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left:
                                            SizeConfig.blockSizeHorizontal * 10,
                                        top: SizeConfig.blockSizeVertical * 1),
                                    height: SizeConfig.blockSizeVertical * 5,
                                    width: SizeConfig.blockSizeHorizontal * 55,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFE9A5B1),
                                        border: Border.all(
                                            color: Color(0xFFDD87D9)),
                                        borderRadius: BorderRadius.circular(
                                            SizeConfig.blockSizeHorizontal *
                                                6)),
                                    child: Center(
                                      child: Text(
                                        "Beauty Analysis",
                                        style: TextStyle(
                                            fontSize:
                                                SizeConfig.blockSizeHorizontal *
                                                    6,
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
                          left_beauty(context),
                          right_beauty(context),
                        ],
                      ),
                      verticalSpace(SizeConfig.blockSizeVertical * 2),
                      Obx(
                  () =>  
                  AdMobAdsProvider.instance.isAdEnable.value
                          ? Center(
                              child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal:
                                          SizeConfig.blockSizeHorizontal * 5),
                                  child: NativeAdMethed(
                                      nativeAd, nativeAdIsLoaded)),
                            )
                          : Container(),
                )
                    ],
                  ),
                ),
                GestureDetector(
                  // [[[[[[[[[[[[[[[Commented By Jamal]]]]]]]]]]]]]]]//
                  // onTap: () async {
                  //   // Check if images are picked before navigating
                  //   if (controller.selectedImage1.value != null &&
                  //       controller.selectedImage2.value != null) {
                  //     await controller.compareImages();

                  //     Get.toNamed(
                  //       Routes.BEAUTYSCORERESULT,
                  //       // arguments can be passed here if needed
                  //     );
                  //   } else {
                  //     // Show an error message
                  //     Get.snackbar(
                  //       "Error",
                  //       "Please select both images before comparing.",
                  //       snackPosition: SnackPosition.BOTTOM,
                  //       backgroundColor: Colors.redAccent,
                  //       colorText: Colors.white,
                  //     );
                  //   }
                  // },
//                   onTap: () async {
//   // Show a dialog to inform the user that the internet connection is being checked
//   Get.defaultDialog(
//     title: "Checking Internet 🚩",
//     buttonColor: Colors.pink,
//     content: Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         CircularProgressIndicator(),
//         SizedBox(width: 10),
//         Text("Checking your connection..."),
//       ],
//     ),
//     barrierDismissible: false, // Prevent dismissing the dialog
//   );

//   // Create an instance of InternetConnectionChecker using the named constructor
//   final connectionChecker = InternetConnectionChecker.createInstance();
//   final isConnected = await connectionChecker.hasConnection;

//   // Close the checking dialog
//   Get.back();

//   if (isConnected) {
//     // Check if images are picked before navigating
//     if (controller.selectedImage1.value != null &&
//         controller.selectedImage2.value != null) {
//       await controller.compareImages();

//       Get.toNamed(
//         Routes.BEAUTYSCORERESULT,
//         // arguments can be passed here if needed
//       );
//     } else {
//       // Show an error message if images are not selected
//       Get.snackbar(
//         "Error",
//         "Please select both images before comparing.",
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Colors.redAccent,
//         colorText: Colors.white,
//       );
//     }
//   } else {
//     // Show an error message if no internet connection
//     Get.defaultDialog(
//       title: "No Internet 🚫",
//       buttonColor: Colors.pink,
//       content: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Text("Please check your internet connection and try again ❗",
//             style: TextStyle(color: Colors.red)),
//       ),
//       onConfirm: () {
//         Get.back(); // Close the dialog
//       },
//       confirmTextColor: Colors.white,
//     );
//   }
// },
onTap: () async {
  // Check if images are picked before checking the internet connection
  if (controller.selectedImage1.value != null &&
      controller.selectedImage2.value != null) {
    
    // Show a dialog to inform the user that the internet connection is being checked
    Get.defaultDialog(
      title: "Checking Internet 🚩",
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

    // Create an instance of InternetConnectionChecker
    final connectionChecker = InternetConnectionChecker.createInstance();
    final isConnected = await connectionChecker.hasConnection;

    // Close the checking dialog
    Get.back();

    if (isConnected) {
      // Proceed to compare images
      await controller.compareImages();
      Get.toNamed(Routes.BEAUTYSCORERESULT);
    } else {
      // Show an error message if no internet connection
      Get.defaultDialog(
        title: "No Internet 🚫",
        buttonColor: Colors.pink,
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Please check your internet connection and try again ❗",
            style: TextStyle(color: Colors.red),
          ),
        ),
        onConfirm: () {
          Get.back(); // Close the dialog
        },
        confirmTextColor: Colors.white,
      );
    }
  } else {
    // Show an error message if images are not selected
    Get.snackbar(
      "Error",
      "Please select both images before comparing.",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.redAccent,
      colorText: Colors.white,
    );
  }
},

                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: SizeConfig.blockSizeVertical *10,
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
                    // height: SizeConfig.blockSizeVertical * 7.5,
                    // width: SizeConfig.blockSizeHorizontal * 80,
                    // decoration: BoxDecoration(
                    //   // color: Colors.teal,
                    //   color: Theme.of(Get.context!).primaryColor,
                    //   borderRadius: BorderRadius.circular(
                    //     SizeConfig.blockSizeHorizontal * 4,
                    //   ),
                    // ),
                    child: Center(
                      child: Text(
                        "Compare",
                        style: TextStyle(
                          fontSize: SizeConfig.blockSizeHorizontal * 5,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),

             

                
              
              ],
            ),
          ),
         
              
        ],
      ),
    );
  }

  Widget left_beauty(BuildContext context) {
    return Obx(
      () => Positioned(
        left: SizeConfig.blockSizeHorizontal * 5,
        top: SizeConfig.blockSizeVertical * 16,
        child: Transform.rotate(
          angle: -0.3,
          alignment: Alignment.topLeft,
          child: GestureDetector(
            onTap: () {
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
                                    await controller
                                        .pickImage1(ImageSource.camera);

                                    Get.back();
                                    // Get.to(() => scanner_method());
                                  },
                                  child: _buildImageOption(
                                      Icons.camera_alt, 'Camera')),
                              GestureDetector(
                                  onTap: () async {
                                    await controller
                                        .pickImage1(ImageSource.gallery);
                                    Get.back();
                                    // Get.to(() => scanner_method());
                                  },
                                  child: _buildImageOption(
                                      Icons.image, 'Gallery')),
                            ],
                          ),
                        ],
                      ),
                    );
                  });
            },
            child: Container(
              height: SizeConfig.blockSizeVertical * 23,
              width: SizeConfig.blockSizeHorizontal * 45,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400, // Shadow color
                      spreadRadius: 2, // Spread radius
                      blurRadius: 10, // Blur radius
                      offset: Offset(0, 5), // Offset in x and y direction
                    ),
                  ],
                  color: Colors.white,
                  border: Border.all(color: Color(0xFFDD87D9)),
                  borderRadius: BorderRadius.circular(
                      SizeConfig.blockSizeHorizontal * 13)),
              child: Stack(
                children: [
                  controller.selectedImage1.value != null
                      ? Container()
                      : Positioned(
                          left: SizeConfig.blockSizeHorizontal * 35,
                          top: SizeConfig.blockSizeVertical * 3,
                          child: Icon(
                            Icons.add_circle,
                            color: Colors.grey,
                          )),
                  controller.selectedImage1.value != null
                      ? Container(
                          width: double.infinity,
                          height: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  SizeConfig.blockSizeHorizontal * 13),
                              border:
                                  Border.all(color: Colors.white, width: 3)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                SizeConfig.blockSizeHorizontal * 13),
                            child: Image.file(
                              controller.selectedImage1.value!,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )
                      : Positioned(
                          top: SizeConfig.blockSizeVertical * 3.5,
                          left: SizeConfig.blockSizeHorizontal * 6,
                          child: Image.asset(
                            AppImages.user,
                            height: SizeConfig.blockSizeVertical * 15,
                            width: SizeConfig.blockSizeHorizontal * 32,
                          ),
                        )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget right_beauty(BuildContext context) {
    return Obx(
      () => Positioned(
        left: SizeConfig.blockSizeHorizontal * 54,
        top: SizeConfig.blockSizeVertical * 9,
        child: Transform.rotate(
          angle: 0.3,
          alignment: Alignment.topLeft,
          child: GestureDetector(
            onTap: () {
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
                                    await controller
                                        .pickImage2(ImageSource.camera);
                                    Get.back();
                                    // Get.to(() => scanner_method());
                                  },
                                  child: _buildImageOption(
                                      Icons.camera_alt, 'Camera')),
                              GestureDetector(
                                  onTap: () async {
                                    await controller
                                        .pickImage2(ImageSource.gallery);
                                    Get.back();
                                    // Get.to(() => scanner_method());
                                  },
                                  child: _buildImageOption(
                                      Icons.image, 'Gallery')),
                            ],
                          ),
                        ],
                      ),
                    );
                  });
            },
            child: Container(
              height: SizeConfig.blockSizeVertical * 23,
              width: SizeConfig.blockSizeHorizontal * 45,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400, // Shadow color
                      spreadRadius: 2, // Spread radius
                      blurRadius: 10, // Blur radius
                      offset: Offset(0, 5), // Offset in x and y direction
                    ),
                  ],
                  color: Colors.white,
                  border: Border.all(color: Color(0xFFDD87D9)),
                  borderRadius: BorderRadius.circular(
                      SizeConfig.blockSizeHorizontal * 13)),
              child: Stack(
                children: [
                  controller.selectedImage2.value != null
                      ? Container()
                      : Positioned(
                          left: SizeConfig.blockSizeHorizontal * 35,
                          top: SizeConfig.blockSizeVertical * 3,
                          child: Icon(
                            Icons.add_circle,
                            color: Colors.grey,
                          )),
                  controller.selectedImage2.value != null
                      ? Container(
                          width: double.infinity,
                          height: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  SizeConfig.blockSizeHorizontal * 13),
                              border:
                                  Border.all(color: Colors.white, width: 3)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                SizeConfig.blockSizeHorizontal * 13),
                            child: Image.file(
                              controller.selectedImage2.value!,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )
                      : Positioned(
                          top: SizeConfig.blockSizeVertical * 3.5,
                          left: SizeConfig.blockSizeHorizontal * 6,
                          child: Image.asset(
                            AppImages.user,
                            height: SizeConfig.blockSizeVertical * 15,
                            width: SizeConfig.blockSizeHorizontal * 32,
                          ),
                        )
                ],
              ),
            ),
          ),
        ),
      ),
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
}
