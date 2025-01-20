// import 'dart:io';
// import 'dart:math';
// import 'package:face_scanner/app/modules/home/controller/home_view_ctl.dart';
// import 'package:face_scanner/app/modules/home/views/helping_widgets/gems_widget.dart';
// import 'package:face_scanner/app/routes/app_pages.dart';
// import 'package:face_scanner/app/utills/colors.dart';
// import 'package:face_scanner/app/utills/gems_rate.dart';
// import 'package:face_scanner/app/utills/helping_methods.dart';
// import 'package:face_scanner/app/utills/rc_variables.dart';
// import 'package:face_scanner/app/utills/size_config.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_markdown/flutter_markdown.dart';
// import 'package:get/get.dart';
// import 'package:google_generative_ai/google_generative_ai.dart';
// import 'package:image_picker/image_picker.dart';

// final String _apiKey = RCVariables.GeminiAPIKey;
// // const String _apiKey = 'AIzaSyBfsg3ZEwnl0CRPYGBh1r_XhFu9tChvL5o';

// // void main() {
// //   runApp(const GenerativeAISample());
// // }

// class TempAichatView extends StatelessWidget {
//   const TempAichatView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return
//         // theme: ThemeData(
//         //   colorScheme: ColorScheme.fromSeed(
//         //     brightness: Brightness.dark,
//         //     seedColor: const Color.fromARGB(255, 171, 222, 244),
//         //   ),
//         //   useMaterial3: true,
//         // ),
//         Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(80),
//         child: AppBar(
//           title: Text('Beauty Coach'),
//           centerTitle: true,
//           leading: GestureDetector(
//               onTap: () {
//                 Get.back();
//               },
//               child: Icon(Icons.arrow_back_ios_new_rounded)),
//           actions: [
//             Padding(
//               padding: EdgeInsets.symmetric(
//                   horizontal: SizeConfig.blockSizeHorizontal * 2),
//               child: gems_widget(),
//             )
//           ],
//         ),
//         //  appThemeAppBar2(context, 'Response'),
//       ),
//       body: ChatWidget(apiKey: RCVariables.GeminiAPIKey),
//     );
//   }
// }

// // class ChatScreen extends StatefulWidget {
// //   const ChatScreen({super.key, required this.title});

// //   final String title;

// //   @override
// //   State<ChatScreen> createState() => _ChatScreenState();
// // }

// // class _ChatScreenState extends State<ChatScreen> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(widget.title),
// //       ),
// //       body: const ChatWidget(apiKey: _apiKey),
// //     );
// //   }
// // }

// class ChatWidget extends StatefulWidget {
//   const ChatWidget({
//     required this.apiKey,
//     super.key,
//   });

//   final String apiKey;

//   @override
//   State<ChatWidget> createState() => _ChatWidgetState();
// }

// class _ChatWidgetState extends State<ChatWidget> {
//   late final GenerativeModel _model;
//   late final ChatSession _chat;
//   final ScrollController _scrollController = ScrollController();
//   final TextEditingController _textController = TextEditingController();
//   final FocusNode _textFieldFocus = FocusNode();
//   final List<({Image? image, String? text, bool fromUser})> _generatedContent =
//       <({Image? image, String? text, bool fromUser})>[];
//   bool _loading = false;
//   bool isImageSelected = false;
//   File? imageFile;

//   List<String> startingMessages = [
//     "Hi there! I’m your AI Beauty Coach, here to help you look and feel your best. What beauty topic can I assist you with today?",
//     "Welcome! Whether it’s skincare, makeup tips, or haircare advice, I’m here to guide you. What’s on your beauty mind?",
//     "Hello! Let’s dive into the world of beauty. Are you looking for product recommendations, skincare routines, or wellness tips?",
//     "Hi! I specialize in all things beauty—from glowing skin to flawless makeup. What beauty goal are you working on today?",
//     "Welcome! I’m here to answer all your beauty-related questions. Let’s start—what’s your current beauty concern or curiosity?",
//     "Hey there! I’m your dedicated beauty coach. Is there a specific look or routine you want advice on today?",
//     "Hi! Ready to elevate your beauty game? Let’s talk about how I can help—what are you focusing on today?",
//     "Hello! Looking for expert beauty tips? Let me know if it’s skincare, haircare, or anything else beauty-related.",
//     "Hi! Beauty is my passion and expertise. What’s one beauty challenge or goal I can help you with today?",
//     "Hey there! Let’s unlock your beauty potential together. Tell me, what’s your top beauty question today?"
//   ];

//   @override
//   void initState() {
//     super.initState();
//     // Select a random starting message
//     final random = Random();
//     String randomMessage =
//         startingMessages[random.nextInt(startingMessages.length)];

//     // Add the random message to the generated content
//     _generatedContent.add((image: null, text: randomMessage, fromUser: false));
//     _model = GenerativeModel(
//       model: 'gemini-1.5-flash-latest',
//       apiKey: widget.apiKey,
//       generationConfig: GenerationConfig(
//         temperature: 1,
//         topK: 40,
//         topP: 0.95,
//         maxOutputTokens: 1000,
//         responseMimeType: 'text/plain',
//       ),
//       systemInstruction: Content.system(
//           '''You are an AI Beauty Coach specializing in all aspects of beauty, including skincare, haircare, makeup, grooming, and wellness tips that enhance beauty. Your expertise is strictly limited to beauty-related topics.

// If a user asks a question or starts a discussion unrelated to beauty, politely but firmly decline to answer. Use a response such as:
// 'I’m here to provide expert advice on beauty-related topics. For other subjects, I recommend consulting a specialist in that field.'

// Always aim to keep the conversation focused on beauty. If the user strays from the topic, gently guide them back with relevant beauty-related questions or suggestions. For example, you might say:
// 'Let’s talk about your skincare routine—what products are you currently using?'

// To maintain engagement and conversational continuity, conclude your responses with a follow-up question related to beauty. Your goal is to ensure the user stays interested and supported in their beauty journey. Avoid engaging in discussions that are not related to beauty under any circumstances.
// '''
//           // "You are a dedicated beauty coach. Your sole purpose is to provide expert beauty advice, including skincare, haircare, makeup, grooming, and wellness tips that enhance beauty. If a query is unrelated to beauty, politely but firmly decline to answer while keeping the conversation focused on beauty. Do not engage in off-topic discussions under any circumstances."
//           // 'You are an expert dietician. Generate your response as short as posible and to the point. no need to explain every thing only the necessary elements that are being asked'
//           ),
//     );
//     _chat = _model.startChat();
//   }

//   void _scrollDown() {
//     WidgetsBinding.instance.addPostFrameCallback(
//       (_) => _scrollController.animateTo(
//         _scrollController.position.maxScrollExtent,
//         duration: const Duration(
//           milliseconds: 750,
//         ),
//         curve: Curves.easeOutCirc,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final textFieldDecoration = InputDecoration(
//       contentPadding: const EdgeInsets.all(15),
//       hintText: 'Enter message...',
//       hintStyle: TextStyle(color: Colors.grey.shade500),
//       border: OutlineInputBorder(
//         borderRadius: const BorderRadius.all(
//           Radius.circular(14),
//         ),
//         borderSide: BorderSide(
//           color: Theme.of(context).colorScheme.secondary,
//         ),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: const BorderRadius.all(
//           Radius.circular(28),
//         ),
//         borderSide: BorderSide(
//           color: AppColors.primaryColor,
//         ),
//       ),
//     );

//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//             child: _apiKey.isNotEmpty
//                 ? ListView.builder(
//                     controller: _scrollController,
//                     itemBuilder: (context, idx) {
//                       final content = _generatedContent[idx];
//                       return MessageWidget(
//                         text: content.text,
//                         image: content.image,
//                         isFromUser: content.fromUser,
//                       );
//                     },
//                     itemCount: _generatedContent.length,
//                   )
//                 : ListView(
//                     children: const [
//                       Text(
//                           "Taking a quick pause. Refreshing things for you! 🌈⏳"
//                           // 'No API key found. Please provide an API Key using '
//                           // "'--dart-define' to set the 'API_KEY' declaration.",
//                           ),
//                     ],
//                   ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(
//               vertical: 12,
//               horizontal: 15,
//             ),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     cursorColor: AppColors.primaryColor,
//                     autofocus: true,
//                     focusNode: _textFieldFocus,
//                     decoration: textFieldDecoration,
//                     controller: _textController,
//                     onSubmitted: _sendChatMessage,
//                   ),
//                 ),
//                 const SizedBox.square(dimension: 5),
//                 //-----------------Image code Commented Below-----------------------------///
//                 // InkWell(
//                 //   onTap: !_loading
//                 //       ? () async {
//                 //           // _sendImagePrompt(_textController.text);
//                 //           if (!isImageSelected) {
//                 //             pickImageFromGallery();
//                 //           } else {
//                 //             setState(() {
//                 //               isImageSelected = false;
//                 //             });
//                 //           }
//                 //         }
//                 //       : null,
//                 //   child: isImageSelected
//                 //       ? Container(
//                 //           width: 30,
//                 //           height: 30,
//                 //           decoration: BoxDecoration(
//                 //             border: Border.all(color: Colors.black, width: 1),
//                 //             borderRadius: BorderRadius.circular(8),
//                 //           ),
//                 //           child: ClipRRect(
//                 //             borderRadius: BorderRadius.circular(
//                 //                 8), // Match the container's borderRadius
//                 //             child: Image.file(
//                 //               imageFile!,
//                 //               fit: BoxFit.cover,
//                 //             ),
//                 //           ),
//                 //         )
//                 //       : Icon(Icons.image,
//                 //           size: 30,
//                 //           color: _loading
//                 //               ? AppColors.primaryColor
//                 //               : AppColors.primaryColor),
//                 // ),

//                 if (!_loading)
//                   Stack(
//                     clipBehavior: Clip.none,
//                     children: [
//                       // Icon(Icons.send, size: 30, color: AppColors.primaryColor),
//                       IconButton(
//                         onPressed: () async {
//                           _sendChatMessage(_textController.text);
//                         },
//                         icon: Icon(Icons.send,
//                             size: 30, color: AppColors.primaryColor),
//                       ),
//                       Positioned(
//                         top: 3,
//                         right: -5,
//                         child: Container(
//                           padding: EdgeInsets.all(4),
//                           decoration: BoxDecoration(
//                             color: Colors.red,
//                             shape: BoxShape.circle,
//                           ),
//                           child: Text(
//                             'x${GEMS_RATE.BeautyCoach}',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 10,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   )
//                 // IconButton(
//                 //   onPressed: () async {
//                 //     _sendChatMessage(_textController.text);
//                 //   },
//                 //   icon: Icon(Icons.send,
//                 //       size: 30, color: AppColors.primaryColor),
//                 // )
//                 else
//                   const CircularProgressIndicator(),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Future<void> pickImageFromGallery() async {
//     final ImagePicker picker = ImagePicker();
//     try {
//       final XFile? image = await picker.pickImage(source: ImageSource.gallery);
//       if (image != null) {
//         setState(() {
//           imageFile = File(image.path);
//           isImageSelected = true;
//         });

//         print('Image Path: ${image.path}');
//         print('Image seted');
//         // sendImageToGoogleAI(imageFile);
//       }
//     } catch (e) {
//       print('Failed to pick image: $e');
//     }
//   }

//   Future<void> _sendImagePrompt(String message) async {
//     setState(() {
//       _loading = true;
//     });
//     try {
//       Uint8List imgBytes = await imageFile!.readAsBytes();
//       // ByteData catBytes = await imageFile!.readAsBytes();
//       // ByteData catBytes = await imageFile.readAsBytes();
//       // ByteData catBytes = await rootBundle.load('assets/images/cat.jpg');
//       // ByteData sconeBytes = await rootBundle.load('assets/images/scones.jpg');
//       // ByteData catBytes = await rootBundle.load('assets/images/cat.jpg');
//       final content = [
//         Content.multi([
//           TextPart(message),
//           // The only accepted mime types are image/*.
//           DataPart('image/jpeg', imgBytes.buffer.asUint8List()),
//         ])
//       ];
//       _generatedContent.add((
//         // image: Image.asset("assets/cat.jpg"),
//         image: Image.file(imageFile!),
//         text: message,
//         fromUser: true
//       ));
//       // _generatedContent.add((
//       //   image: Image.asset("assets/scones.jpg"),
//       //   text: null,
//       //   fromUser: true
//       // ));

//       var response = await _model.generateContent(content);
//       var text = response.text;
//       _generatedContent.add((image: null, text: text, fromUser: false));

//       if (text == null) {
//         _showError('No response from API.');
//         return;
//       } else {
//         setState(() {
//           _loading = false;
//           isImageSelected = false;
//           _scrollDown();
//         });
//       }
//     } catch (e) {
//       _showError(e.toString());
//       setState(() {
//         _loading = false;
//       });
//     } finally {
//       _textController.clear();
//       setState(() {
//         _loading = false;
//       });
//       _textFieldFocus.requestFocus();
//     }
//   }

//   Future<void> _sendChatMessage(String message) async {
//     print("Send Chat..");
//     if (GEMS_RATE.remianingGems.value >= GEMS_RATE.BeautyCoach) {
//       print("Gems Available.");
//     } else {
//       print("Gems Not Available.");

//       // Show a toast message for insufficient gems
//       HelpingMethods.instance.ShowNoGemsToast();
//       Get.toNamed(Routes.GEMSVIEW);
//       return;
//     }

//     print("Sending message..");

//     setState(() {
//       _loading = true;
//     });
//     if (isImageSelected) {
//       _sendImagePrompt(message);
//     } else {
//       try {
//         _generatedContent.add((image: null, text: message, fromUser: true));
//         final response = await _chat.sendMessage(
//           Content.text(message),
//         );
//         final text = response.text;
//         _generatedContent.add((image: null, text: text, fromUser: false));

//         if (text == null) {
//           _showError('No response from API.');
//           return;
//         } else {
//           /////////////
//           ///
//           HomeViewCtl homeViewCtl = Get.find();
//           homeViewCtl.decreaseGEMS(GEMS_RATE.BeautyCoach);

//           setState(() {
//             _loading = false;
//             _scrollDown();
//           });
//         }
//       } catch (e) {
//         _showError(e.toString());
//         setState(() {
//           _loading = false;
//         });
//       } finally {
//         _textController.clear();
//         setState(() {
//           _loading = false;
//         });
//         _textFieldFocus.requestFocus();
//       }
//     }
//   }

//   void _showError(String message) {
//     showDialog<void>(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('Something went wrong'),
//           content: SingleChildScrollView(
//             child: SelectableText(message),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text('OK'),
//             )
//           ],
//         );
//       },
//     );
//   }
// }

// class MessageWidget extends StatelessWidget {
//   const MessageWidget({
//     super.key,
//     this.image,
//     this.text,
//     required this.isFromUser,
//   });

//   final Image? image;
//   final String? text;
//   final bool isFromUser;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment:
//           isFromUser ? MainAxisAlignment.end : MainAxisAlignment.start,
//       children: [
//         Flexible(
//             child: Container(
//                 constraints:
//                     BoxConstraints(maxWidth: SizeConfig.screenWidth * 0.75),
//                 decoration: BoxDecoration(
//                   color: isFromUser
//                       // ? AppThemeColors.onPrimary2
//                       // : AppThemeColors.onPrimary1,
//                       ? AppColors.primaryColorShade100
//                       : Colors.grey.shade300,
//                   borderRadius: BorderRadius.circular(18),
//                 ),
//                 padding: const EdgeInsets.symmetric(
//                   vertical: 15,
//                   horizontal: 20,
//                 ),
//                 margin: const EdgeInsets.only(bottom: 8),
//                 child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       if (image case final image?)
//                         Padding(
//                             padding: EdgeInsets.only(bottom: 10), child: image),
//                       if (text case final text?)
//                         MarkdownBody(
//                           data: text,
//                           //   styleSheet: isFromUser
//                           //       ? MarkdownStyleSheet()
//                           //       : MarkdownStyleSheet(
//                           //           p: const TextStyle(
//                           //               color: Colors.white), // Paragraph text color
//                           //           h1: const TextStyle(
//                           //               color: Colors.white), // Header 1 color
//                           //           h2: const TextStyle(
//                           //               color: Colors.white), // Header 2 color
//                           //           strong: const TextStyle(
//                           //               color: Colors.white), // Bold text color
//                           //           em: const TextStyle(color: Colors.white),
//                           //         ),
//                         ),
//                     ]))),
//       ],
//     );
//   }
// }
