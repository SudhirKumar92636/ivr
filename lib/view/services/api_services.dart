// import 'dart:convert';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as https;
// import '../../modle/all_call_modles.dart' as allcalls;
// import '../../modle/all_incoming_modle.dart' as incoming;
// import '../../modle/all_outgoing_call_modles.dart' as outgoing;
//
// class ApiServices extends GetxController {
//   RxBool isLoading = false.obs;
//   RxList<incoming.Data> callList = <incoming.Data>[].obs;
//   RxList<outgoing.Data> outGoingCallList = <outgoing.Data>[].obs;
//   RxList<allcalls.Data> allCallList = <allcalls.Data>[].obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     getAllIncoming();
//     getOutGoingCall();
//     getAllCall();
//   }
//
//   Future<void> getAllIncoming() async {
//     isLoading.value = true;
//     var url = Uri.parse("https://callcenter.electionmaster.in/api/all-incoming-callnumber");
//
//     try {
//       var response = await https.post(url, body: {'user_id': '5'});
//       if (response.statusCode == 200) {
//         var data = incoming.AllInComingModles.fromJson(jsonDecode(response.body));
//         if (data.data != null) {
//           callList.value = data.data!;
//         }
//       }
//     } catch (ex) {
//       print("Error:---${ex.toString()}");
//     }
//     isLoading.value = false;
//   }
//
//   Future<void> getOutGoingCall() async {
//     isLoading.value = true;
//     var url = Uri.parse("https://callcenter.electionmaster.in/api/all-outgoing-callnumber");
//
//     try {
//       var response = await https.post(url, body: {'user_id': '1'});
//       if (response.statusCode == 200) {
//         var data = outgoing.OutgoingCallModle.fromJson(jsonDecode(response.body));
//         if (data.data != null) {
//           outGoingCallList.value = data.data!;
//         }
//       }
//     } catch (ex) {
//       print("Error:---${ex.toString()}");
//     }
//     isLoading.value = false;
//   }
//
//   Future<void> getAllCall() async {
//     isLoading.value = true;
//     var url = Uri.parse("https://callcenter.electionmaster.in/api/all-outgoing-callnumber");
//
//     try {
//       var response = await https.post(url, body: {'user_id': '1'});
//       if (response.statusCode == 200) {
//         var data = allcalls.GetAllDataModles.fromJson(jsonDecode(response.body));
//         if (data.data != null) {
//           allCallList.value = data.data!;
//         }
//       }
//     } catch (ex) {
//       print("Error:---${ex.toString()}");
//     }
//     isLoading.value = false;
//   }
//
// }








import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as https;
import '../../modle/all_call_modles.dart' as allcalls;
import '../../modle/all_incoming_modle.dart' as incoming;
import '../../modle/all_outgoing_call_modles.dart' as outgoing;

class ApiServices extends GetxController {
  RxBool isLoading = false.obs;

  // Incoming Call Data
  RxList<incoming.Data> callList = <incoming.Data>[].obs;
  RxInt incomingPage = 1.obs;
  RxBool incomingLastPage = false.obs;

  // Outgoing Call Data
  RxList<outgoing.Data> outGoingCallList = <outgoing.Data>[].obs;
  RxInt outgoingPage = 1.obs;
  RxBool outgoingLastPage = false.obs;

  // All Call Data
  RxList<allcalls.Data> allCallList = <allcalls.Data>[].obs;
  RxInt allCallPage = 1.obs;
  RxBool allCallLastPage = false.obs;

  @override
  void onInit() {
    super.onInit();
    getAllIncoming();
    getOutGoingCall();
    getAllCall();
  }

  Future<void> getAllIncoming() async {
    if (incomingLastPage.value) return;

    isLoading.value = true;
    var url = Uri.parse("https://callcenter.electionmaster.in/api/all-incoming-callnumber");

    try {
      var response = await https.post(
        url,
        body: {
          'user_id': '5',
          'page': incomingPage.value.toString(),
        },
      ).timeout(const Duration(seconds: 10), onTimeout: () {
        throw Exception('Incoming API timeout');
      });

      if (response.statusCode == 200) {
        var data = incoming.AllInComingModles.fromJson(jsonDecode(response.body));
        if (data.data != null && data.data!.isNotEmpty) {
          callList.addAll(data.data!);
          incomingPage.value++;
        } else {
          incomingLastPage.value = true;
        }
      }
    } catch (ex) {
      print("Incoming API Error: ${ex.toString()}");
    }

    isLoading.value = false;
  }

  Future<void> getOutGoingCall() async {
    if (outgoingLastPage.value) return;

    isLoading.value = true;
    var url = Uri.parse("https://callcenter.electionmaster.in/api/all-outgoing-callnumber");

    try {
      var response = await https.post(
        url,
        body: {
          'user_id': '1',
          'page': outgoingPage.value.toString(),
        },
      ).timeout(const Duration(seconds: 10), onTimeout: () {
        throw Exception('Outgoing API timeout');
      });

      if (response.statusCode == 200) {
        var data = outgoing.OutgoingCallModle.fromJson(jsonDecode(response.body));
        if (data.data != null && data.data!.isNotEmpty) {
          outGoingCallList.addAll(data.data!);
          outgoingPage.value++;
        } else {
          outgoingLastPage.value = true;
        }
      }
    } catch (ex) {
      print("Outgoing API Error: ${ex.toString()}");
    }

    isLoading.value = false;
  }

  Future<void> getAllCall() async {
    if (allCallLastPage.value) return;

    isLoading.value = true;
    var url = Uri.parse("https://callcenter.electionmaster.in/api/all-outgoing-callnumber");

    try {
      var response = await https.post(
        url,
        body: {
          'user_id': '1',
          'page': allCallPage.value.toString(),
        },
      ).timeout(const Duration(seconds: 10), onTimeout: () {
        throw Exception('All Call API timeout');
      });

      if (response.statusCode == 200) {
        var data = allcalls.GetAllDataModles.fromJson(jsonDecode(response.body));
        if (data.data != null && data.data!.isNotEmpty) {
          allCallList.addAll(data.data!);
          allCallPage.value++;
        } else {
          allCallLastPage.value = true;
        }
      }
    } catch (ex) {
      print("All Call API Error: ${ex.toString()}");
    }

    isLoading.value = false;
  }
}
