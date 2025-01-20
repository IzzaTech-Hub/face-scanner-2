import 'package:face_scanner/app/routes/app_pages.dart';
import 'package:face_scanner/app/utills/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.AICHATVIEW, arguments: [false, '', '']);
        },
        child: Icon(Icons.smart_toy_sharp),
      ),
      // appBar: AppBar(
      //   centerTitle: true,
      //   backgroundColor: Colors.pink.shade50,
      //   title: Text(
      //     "Beauty Scanner",
      //     style: TextStyle(
      //         fontSize: SizeConfig.blockSizeHorizontal * 5,
      //         fontWeight: FontWeight.bold,
      //         color: Colors.black),
      //   ),
      //   // leading: Icon(Icons.menu),
      //   actions: [
      //     GestureDetector(
      //         onTap: () {
      //           Get.toNamed(Routes.WORKINGDEMOVIEW);
      //         },
      //         child: Icon(Icons.question_mark_rounded))
      //   ],
      // ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: SizeConfig.blockSizeVertical * 30,
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: SizeConfig.blockSizeVertical * 5,
                  width: SizeConfig.blockSizeHorizontal * 55,
                  decoration: BoxDecoration(
                      color: Color(0xFFE9A5B1),
                      border: Border.all(color: Color(0xFFDD87D9)),
                      borderRadius: BorderRadius.circular(
                          SizeConfig.blockSizeHorizontal * 6)),
                  child: Center(
                    child: Text(
                      "Face Beauty AI",
                      style: TextStyle(
                          fontSize: SizeConfig.blockSizeHorizontal * 6,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                          // color: Color(0xFFDD87D9)
                          ),
                    ),
                  ),
                ),
                // verticalSpace(SizeConfig.blockSizeVertical * 5),
                Container(
                  margin:
                      EdgeInsets.only(top: SizeConfig.blockSizeVertical * 5),
                  width: SizeConfig.blockSizeHorizontal * 80,
                  child: Center(
                    child: Text(
                      "Transform your skincare routine with the power of AI",
                      style: TextStyle(
                          fontSize: SizeConfig.blockSizeHorizontal * 5,
                          // fontWeight: FontWeight.bold,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: SizeConfig.blockSizeVertical * 2,
                bottom: SizeConfig.blockSizeVertical * 2,
                left: SizeConfig.blockSizeHorizontal * 4),
            child: Text(
              "Welcome Back,",
              style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal * 6,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2, // Number of containers in a row
              mainAxisSpacing: 10.0, // Spacing between rows
              crossAxisSpacing: 10.0, // Spacing between columns
              padding: EdgeInsets.all(10.0),

              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.FACEBEAUTYANALYSIS);
                  },
                  child: beauty_feauture(
                    Colors.teal.shade100,
                    Colors.teal.shade50,
                    Colors.teal.shade50,
                    Icons.face,
                    Colors.teal,
                    "Beauty Analysis",
                    "Discover your unique beauty profile! 😎",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.FACEREADING);
                  },
                  child: beauty_feauture(
                    Colors.orange.shade100,
                    Colors.orange.shade50,
                    Colors.orange.shade50,
                    Icons.visibility,
                    Colors.orange,
                    "Face Reading",
                    "Unveil your facial secrets! 🌟",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.CELEBRITYLOOK);
                  },
                  child: beauty_feauture(
                    Colors.blue.shade100,
                    Colors.blue.shade50,
                    Colors.blue.shade50,
                    Icons.people,
                    Colors.blue,
                    "Looks Like a Celebrity",
                    "Find your celeb twin! ✨",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.BEAUTYSCORE);
                  },
                  child: beauty_feauture(
                    Colors.red.shade100,
                    Colors.red.shade50,
                    Colors.red.shade50,
                    Icons.bar_chart,
                    Colors.red,
                    "Beauty Score Shutdown",
                    "Beauty isn’t just a score! 💖",
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text(
      //     "Face Scanner",
      //     style: TextStyle(
      //         fontSize: SizeConfig.blockSizeHorizontal * 5,
      //         fontWeight: FontWeight.bold),
      //   ),
      //   // leading: Icon(Icons.menu),
      //   actions: [
      //     GestureDetector(
      //         onTap: () {
      //           Get.toNamed(Routes.WORKINGDEMOVIEW);
      //         },
      //         child: Icon(Icons.question_mark_rounded))
      //   ],
      // ),
      // body: Column(
      //   children: [
      //     Center(
      //       child: GestureDetector(
      //         onTap: () {
      //           // Get.toNamed(Routes.FACEBEAUTYANALYSIS);
      //           Get.toNamed(Routes.BEAUTYSCORE);
      //         },
      //         child: Container(
      //           margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
      //           width: SizeConfig.blockSizeHorizontal * 92,
      //           height: SizeConfig.blockSizeVertical * 15,
      //           decoration: BoxDecoration(
      //               boxShadow: [
      //                 BoxShadow(
      //                   color: Colors.grey.shade400, // Shadow color
      //                   spreadRadius: 2, // Spread radius
      //                   blurRadius: 10, // Blur radius
      //                   offset: Offset(0, 5), // Offset in x and y direction
      //                 ),
      //               ],
      //               gradient: LinearGradient(colors: [
      //                 Color(0xFFBF04C3),
      //                 Color.fromARGB(255, 226, 134, 228)
      //               ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
      //               borderRadius: BorderRadius.circular(
      //                   SizeConfig.blockSizeHorizontal * 4)),
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceAround,
      //             children: [
      //               Container(
      //                 alignment: Alignment.center,
      //                 decoration: BoxDecoration(),
      //                 child: Image.asset(
      //                   width: SizeConfig.blockSizeHorizontal * 40,
      //                   AppImages.face_beauty,
      //                 ),
      //               ),
      //               Column(
      //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                 children: [
      //                   Container(
      //                     height: SizeConfig.blockSizeVertical * 10,
      //                     width: SizeConfig.blockSizeHorizontal * 20,
      //                     decoration: BoxDecoration(
      //                       borderRadius: BorderRadius.circular(
      //                           SizeConfig.blockSizeHorizontal * 7),
      //                     ),
      //                     child: Image.asset(
      //                       AppImages.beauty_score,
      //                       color: Colors.white,
      //                     ),
      //                   ),
      //                   Text(
      //                     "Beauty battle",
      //                     style: TextStyle(
      //                         fontSize: SizeConfig.blockSizeHorizontal * 4,
      //                         fontWeight: FontWeight.bold,
      //                         color: Colors.white),
      //                   )
      //                 ],
      //               )
      //             ],
      //           ),
      //         ),
      //       ),
      //     ),
      //     GestureDetector(
      //       onTap: () {
      //         // Get.toNamed(Routes.FACEREADING);
      //         Get.toNamed(Routes.CELEBRITYLOOK);
      //       },
      //       child: Container(
      //         margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
      //         width: SizeConfig.blockSizeHorizontal * 92,
      //         height: SizeConfig.blockSizeVertical * 15,
      //         decoration: BoxDecoration(
      //             boxShadow: [
      //               BoxShadow(
      //                 color: Colors.grey.shade400, // Shadow color
      //                 spreadRadius: 2, // Spread radius
      //                 blurRadius: 10, // Blur radius
      //                 offset: Offset(0, 5), // Offset in x and y direction
      //               ),
      //             ],
      //             gradient: LinearGradient(colors: [
      //               Color.fromARGB(255, 0, 201, 252),
      //               Color.fromARGB(255, 140, 223, 241),
      //             ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
      //             borderRadius: BorderRadius.circular(
      //                 SizeConfig.blockSizeHorizontal * 4)),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceAround,
      //           children: [
      //             Container(
      //               alignment: Alignment.bottomCenter,
      //               decoration: BoxDecoration(),
      //               child: Image.asset(
      //                 AppImages.celebrity_look,
      //                 height: SizeConfig.blockSizeVertical * 13,
      //               ),
      //             ),
      //             Column(
      //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //               children: [
      //                 Container(
      //                   height: SizeConfig.blockSizeVertical * 10,
      //                   width: SizeConfig.blockSizeHorizontal * 20,
      //                   decoration: BoxDecoration(
      //                     borderRadius: BorderRadius.circular(
      //                         SizeConfig.blockSizeHorizontal * 7),
      //                   ),
      //                   child: Image.asset(
      //                     AppImages.analysis,
      //                     color: Colors.black,
      //                   ),
      //                 ),
      //                 Text(
      //                   "Celebrity Match",
      //                   style: TextStyle(
      //                       fontSize: SizeConfig.blockSizeHorizontal * 4,
      //                       fontWeight: FontWeight.bold,
      //                       color: Colors.white),
      //                 )
      //               ],
      //             )
      //           ],
      //         ),
      //       ),
      //     ),

      //     // GestureDetector(
      //     //   onTap: () {
      //     //     Get.toNamed(Routes.FACEREADING);
      //     //   },
      //     //   child: Container(
      //     //     margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
      //     //     width: SizeConfig.blockSizeHorizontal * 92,
      //     //     height: SizeConfig.blockSizeVertical * 15,
      //     //     decoration: BoxDecoration(
      //     //         boxShadow: [
      //     //           BoxShadow(
      //     //             color: Colors.grey.shade400, // Shadow color
      //     //             spreadRadius: 2, // Spread radius
      //     //             blurRadius: 10, // Blur radius
      //     //             offset: Offset(0, 5), // Offset in x and y direction
      //     //           ),
      //     //         ],
      //     //         gradient: LinearGradient(colors: [
      //     //           Color.fromARGB(255, 0, 201, 252),
      //     //           Color.fromARGB(255, 140, 223, 241),
      //     //         ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
      //     //         borderRadius: BorderRadius.circular(
      //     //             SizeConfig.blockSizeHorizontal * 4)),
      //     //     child: Row(
      //     //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     //       children: [
      //     //         Container(
      //     //           alignment: Alignment.bottomCenter,
      //     //           decoration: BoxDecoration(),
      //     //           child: Image.asset(
      //     //             AppImages.face_reading,
      //     //             height: SizeConfig.blockSizeVertical * 13,
      //     //           ),
      //     //         ),
      //     //         Column(
      //     //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     //           children: [
      //     //             Container(
      //     //               height: SizeConfig.blockSizeVertical * 10,
      //     //               width: SizeConfig.blockSizeHorizontal * 20,
      //     //               decoration: BoxDecoration(
      //     //                 borderRadius: BorderRadius.circular(
      //     //                     SizeConfig.blockSizeHorizontal * 7),
      //     //               ),
      //     //               child: Image.asset(
      //     //                 AppImages.analysis,
      //     //                 color: Colors.black,
      //     //               ),
      //     //             ),
      //     //             Text(
      //     //               "Face Reading",
      //     //               style: TextStyle(
      //     //                   fontSize: SizeConfig.blockSizeHorizontal * 4,
      //     //                   fontWeight: FontWeight.bold,
      //     //                   color: Colors.white),
      //     //             )
      //     //           ],
      //     //         )
      //     //       ],
      //     //     ),
      //     //   ),
      //     // ),

      //     // GridView.count(
      //     //   crossAxisCount: 2,
      //     //   physics: NeverScrollableScrollPhysics(),
      //     //   shrinkWrap: true,
      //     //   padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 2),
      //     //   children: [
      //     //     GestureDetector(
      //     //       onTap: () {
      //     //         Get.toNamed(Routes.CELEBRITYLOOK);
      //     //       },
      //     //       child: scanner_modes(Color(0xFFD06810), Color(0xFFCA986F),
      //     //           AppImages.celebrity_look, "Looks like a", "Celebrity"),
      //     //     ),
      //     //     // scanner_modes(
      //     //     //     Color.fromARGB(255, 71, 216, 76),
      //     //     //     Color.fromARGB(255, 113, 209, 111),
      //     //     //     AppImages.facial_symmetry,
      //     //     //     "Facial Symmetery",
      //     //     //     ""),
      //     //     GestureDetector(
      //     //       onTap: () {
      //     //         Get.toNamed(Routes.BEAUTYSCORE);
      //     //       },
      //     //       child: scanner_modes(
      //     //           Color(0xFFBF04C3),
      //     //           Color.fromARGB(255, 226, 134, 228),
      //     //           AppImages.beauty_score,
      //     //           "Beauty Score",
      //     //           "Showdown"),
      //     //     ),

      //     //     // scanner_modes(
      //     //     // Color.fromARGB(255, 0, 201, 252),
      //     //     // Color.fromARGB(255, 140, 223, 241),
      //     //     //     AppImages.face_resemblance,
      //     //     //     "Facial",
      //     //     //     "Resemblance"),
      //     //     // GestureDetector(
      //     //     //   onTap: () {
      //     //     //     Get.toNamed(Routes.FACEREADING);
      //     //     //   },
      //     //     //   child: scanner_modes(
      //     //     //       Color(0xFF7E51FF),
      //     //     //       Color.fromARGB(255, 161, 134, 238),
      //     //     //       AppImages.face_reading,
      //     //     //       "Face Reading",
      //     //     //       ""),
      //     //     // ),
      //     //     // scanner_modes(
      //     //     // Color.fromARGB(255, 236, 240, 14),
      //     //     // Color.fromARGB(255, 228, 240, 102),
      //     //     //     AppImages.beauty_tips,
      //     //     //     "Beauty Tips",
      //     //     //     ""),
      //     //   ],
      //     // )
      //   ],
      // ),
    );
  }

  Container beauty_feauture(Color shadowColor, Color shimmerColor,
      Color imageBg, IconData icon, Color iconClr, String text1, String text2) {
    return Container(
      height: SizeConfig.blockSizeVertical * 15,
      width: SizeConfig.blockSizeHorizontal * 30,
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
        borderRadius: BorderRadius.circular(SizeConfig.blockSizeHorizontal * 6),
      ),
      child: Stack(
        children: [
          // Shimmer effect applied to the background of the container
          Shimmer.fromColors(
            baseColor: Colors.white, // Shimmer base color indigo
            highlightColor: shimmerColor,
            direction: ShimmerDirection.btt,
            // Shimmer highlight color lighter indigo
            child: Container(
              // height: SizeConfig.blockSizeVertical * 15,
              // width: SizeConfig.blockSizeHorizontal * 30,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(SizeConfig.blockSizeHorizontal * 6),
              ),
            ),
          ),
          // Content (text and icon) on top of the shimmer effect
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: SizeConfig.blockSizeVertical * 2,
                    left: SizeConfig.blockSizeHorizontal * 4),
                height: SizeConfig.blockSizeVertical * 6,
                width: SizeConfig.blockSizeHorizontal * 12,
                decoration: BoxDecoration(
                    color: imageBg,
                    borderRadius: BorderRadius.circular(
                        SizeConfig.blockSizeHorizontal * 2)),
                child: Icon(icon, color: iconClr),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: SizeConfig.blockSizeVertical * 2,
                    left: SizeConfig.blockSizeHorizontal * 3),
                child: Text(
                  text1,
                  style: TextStyle(
                      fontSize: SizeConfig.blockSizeHorizontal * 4,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: SizeConfig.blockSizeVertical * 0.5,
                    left: SizeConfig.blockSizeHorizontal * 3),
                child: Text(
                  text2,
                  style: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal * 3,
                    color: Colors.grey.shade600,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget scanner_modes(
      Color color1, Color color2, String image, String text1, String text2) {
    return Container(
      margin: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 2),
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(SizeConfig.blockSizeHorizontal * 6),
          gradient: LinearGradient(
              colors: [color1, color2],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: SizeConfig.blockSizeVertical * 10,
            width: SizeConfig.blockSizeHorizontal * 20,
            child: Image.asset(image),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text1,
                style: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal * 4,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                text2,
                style: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal * 4,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
