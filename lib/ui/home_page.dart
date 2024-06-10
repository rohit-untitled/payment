// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';
// import 'package:http/http.dart' as http;

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   late Razorpay _razorpay;
//   TextEditingController amountController = TextEditingController();

//   @override
//   void initState() {
//     _razorpay = Razorpay();
//     _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
//     _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
//     _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
//     super.initState();
//   }

//   void _handlePaymentSuccess(PaymentSuccessResponse response) {
//     // Do something when payment succeeds
//     print("Payment Done");
//   }

//   void _handlePaymentError(PaymentFailureResponse response) {
//     // Do something when payment fails
//     print("Payment Failed");
//   }

//   void _handleExternalWallet(ExternalWalletResponse response) {
//     // Do something when an external wallet is selected
//   }

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Gateway Payment",
//           style: TextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//             letterSpacing: 0.5,
//           ),
//         ),
//         backgroundColor: Colors.blue, // Use an iOS-like color
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10.0),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.4),
//                       spreadRadius: 3,
//                       blurRadius: 8,
//                       offset: Offset(0, 2),
//                     ),
//                   ],
//                 ),
//                 child: TextField(
//                   controller: amountController,
//                   keyboardType: TextInputType.number,
//                   style: TextStyle(fontSize: 18),
//                   decoration: InputDecoration(
//                     hintText: "Enter Amount",
//                     hintStyle: TextStyle(color: Colors.grey),
//                     border: OutlineInputBorder(
//                       borderSide: BorderSide.none,
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     contentPadding: EdgeInsets.all(16),
//                   ),
//                 ),
//               ),
//             ),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.green,
//                 padding: EdgeInsets.symmetric(horizontal: 35, vertical: 16),
//                 textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30.0),
//                 ),
//                 elevation: 10,
//               ),
//               onPressed: () async {
//                 var responseData;

//                 Future<Map<String, dynamic>> createOrder(
//                     int quantity, String stickerID) async {
//                   final String url =
//                       "https://zulu-be.onrender.com/create-order";

//                   // Create the request body
//                   Map<String, dynamic> requestBody = {
//                     'quantity': 1,
//                     'stickerID': "2fbAEfAlFyKDnhvKNIa7",
//                   };

//                   try {
//                     // Make the POST request
//                     http.Response response = await http.post(
//                       Uri.parse(url),
//                       body: json.encode(requestBody),
//                       headers: <String, String>{
//                         'Content-Type': 'application/json; charset=UTF-8',
//                       },
//                     );

//                     // Check the response status code
//                     if (response.statusCode == 200) {
//                       // If the request is successful, you can handle the response here
//                       responseData = json.decode(response.body);
//                       // Handle the response data as needed
//                       return responseData;
//                     } else {
//                       // If the request fails, throw an error
//                       throw Exception(
//                           "Failed to create the order. Status code: ${response.statusCode}");
//                     }
//                   } catch (e) {
//                     // Catch any errors that occur during the request
//                     print("Error creating order: $e");
//                     throw Exception("Failed to create the order: $e");
//                   }
//                 }

//                 //var x = await createOrder(1, "2fbAEfAlFyKDnhvKNIa7");
//                 //print(x);
//                 // / Make payment
//                 // var options = {
//                 //   'key': "rzp_test_UCBnFk2YkVboaC",
//                 //   'amount': (int.parse(amountController.text) * 100).toString(),
//                 //   'name': 'Tamater',
//                 //   'description': 'Testing',
//                 //   'timeout': 300,
//                 //   'prefill': {
//                 //     'contact': '7980030764',
//                 //     'email': 'rohit.untitled@gmail.com',
//                 //   },
//                 // };
//                 print(responseData);
//                 var options = {
//                   'key': 'rzp_test_FnfO8gmSTTXd5K',
//                   'amount': responseData['amount'],
//                   'currency': "INR",
//                   'name': "IcuroLife",
//                   "order_id": responseData['id'],
//                   'description': "Payment for Your Product",
//                 };
//                 _razorpay.open(options);
//               },
//               child: Text(
//                 "Pay",
//                 style: TextStyle(
//                   fontSize: 24,
//                   letterSpacing: 2,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _razorpay.clear();
//     super.dispose();
//   }
// }

// new one

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Razorpay _razorpay;
  TextEditingController amountController = TextEditingController();

  @override
  void initState() {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    print("Payment Done");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    print("Payment Failed");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }

  Future<Map<String, dynamic>> createOrder(
      int quantity, String stickerID) async {
    final String url = "https://zulu-be.onrender.com/create-order";

    // Create the request body
    Map<String, dynamic> requestBody = {
      'quantity': quantity,
      'stickerID': stickerID,
    };

    try {
      // Make the POST request
      http.Response response = await http.post(
        Uri.parse(url),
        body: json.encode(requestBody),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      // Check the response status code
      if (response.statusCode == 200) {
        // If the request is successful, you can handle the response here
        Map<String, dynamic> responseData = json.decode(response.body);
        // Handle the response data as needed
        return responseData;
      } else {
        // If the request fails, throw an error
        throw Exception(
            "Failed to create the order. Status code: ${response.statusCode}");
      }
    } catch (e) {
      // Catch any errors that occur during the request
      print("Error creating order: $e");
      throw Exception("Failed to create the order: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Gateway Payment",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        backgroundColor: Colors.blue, // Use an iOS-like color
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 3,
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    hintText: "Enter Amount",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    contentPadding: EdgeInsets.all(16),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 35, vertical: 16),
                textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                elevation: 10,
              ),
              onPressed: () async {
                try {
                  // Call the asynchronous createOrder function to get the response
                  Map<String, dynamic> responseData =
                      await createOrder(1, "2fbAEfAlFyKDnhvKNIa7");

                  // Once the response is available, construct the options for Razorpay
                  var options = {
                    'key': 'rzp_test_FnfO8gmSTTXd5K',
                    'amount': responseData['amount'],
                    'currency': "INR",
                    'name': "IcuroLife",
                    "order_id": responseData['id'],
                    'description': "Payment for Your Product",
                  };

                  // Open the Razorpay payment dialog with the options
                  _razorpay.open(options);
                } catch (e) {
                  // Handle any exceptions that occur during the process
                  print("Error processing payment: $e");
                }
              },
              child: Text(
                "Pay",
                style: TextStyle(
                  fontSize: 24,
                  letterSpacing: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }
}
