// import 'package:avatar_glow/avatar_glow.dart';
// import 'package:flutter/material.dart';
// import 'package:speech_to_text/speech_to_text.dart';
//
// class MissedCallsScreens extends StatefulWidget {
//   const MissedCallsScreens({super.key});
//
//   @override
//   State<MissedCallsScreens> createState() => _MissedCallsScreensState();
// }
//
// class _MissedCallsScreensState extends State<MissedCallsScreens> {
//   bool isListening = false;
//   String text = "Hold The Button and Start Speaking";
//   SpeechToText speechToText = SpeechToText();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: const Icon(Icons.start_rounded),
//         backgroundColor: Colors.blue,
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       floatingActionButton: AvatarGlow(
//         startDelay: const Duration(milliseconds: 1000),
//         glowColor: Colors.blueAccent,
//         glowShape: BoxShape.circle,
//         animate: isListening,
//         curve: Curves.fastOutSlowIn,
//         duration: const Duration(milliseconds: 100),
//         repeat: true,
//         child: Material(
//           elevation: 20.0,
//           shape: const CircleBorder(),
//           color: Colors.transparent,
//           child: GestureDetector(
//             onTapDown: (_) async {
//               if (!isListening) {
//                 var available = await speechToText.initialize();
//                 if (available) {
//                   setState(() {
//                     isListening = true;
//                   });
//                   speechToText.listen(
//                     onResult: (result) {
//                       setState(() {
//                         text = result.recognizedWords;
//                       });
//                     },
//                   );
//                 }
//               }
//             },
//             onTapUp: (_) {
//               setState(() {
//                 isListening = false;
//               });
//               speechToText.stop();
//             },
//             child: CircleAvatar(
//               radius: 30,
//               backgroundColor: Colors.blueAccent,
//               child: Icon(isListening ? Icons.mic : Icons.mic_none, color: Colors.white),
//             ),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height * 0.7,
//           alignment: Alignment.center,
//           padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//           margin: const EdgeInsets.only(bottom: 150),
//           child: Text(
//             text,
//             style: const TextStyle(
//               fontSize: 24,
//               color: Colors.black54,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


