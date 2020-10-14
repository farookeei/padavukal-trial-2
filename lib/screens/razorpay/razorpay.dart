import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:padavukal/providers/course.dart';
import 'package:padavukal/providers/models/coursePayment.dart';
import 'package:padavukal/providers/models/user_model.dart.dart';
import 'package:padavukal/providers/user.dart';
import 'package:padavukal/screens/tabsScreen/tabs_screen.dart';
import 'package:padavukal/widgets/errornotifire/errorMessage.dart';
import 'package:padavukal/widgets/loading/loading.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorPay extends StatefulWidget {
  static const routeName = "/razorpay";

  final int courseId;

  RazorPay({this.courseId = 2});

  @override
  _RazorPayState createState() => _RazorPayState();
}

class _RazorPayState extends State<RazorPay> {
  // List<String> desc = [
  //   "Try premium",
  //   "Can't use all packages",
  // ];
  Razorpay _razorpay;
  List<CoursePaymentModel> _courspaymnetData;
  bool _isLoading = true;
  bool _errorMsg = false;

  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  void trailPlan() async {
    errorMessage(scaffold: _scaffoldkey, message: 'You selected trail Plan');
    User currentUser =
        Provider.of<UserProvider>(context, listen: false).currentUser;
    Provider.of<CourseProvider>(context, listen: false)
        .paymentMethod(userToken: currentUser.token);
    Navigator.of(context).pushReplacementNamed(TabsScreen.routeName);
  }

  void opencheckout({double totalAmount}) {
    if (totalAmount == 0) {
      trailPlan();
      return;
    }
    var options = {
      "key": "rzp_live_4tQLJUVyCfO4T8",
      "amount": totalAmount * 100,
      "name": "Padavukal",
      "description": "Select Plan",
      "prefil": {"contact": "", "email": ""},
      "external": {
        "wallets": ["paytm"]
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      errorMessage(scaffold: _scaffoldkey, message: 'paymnet Error happened');
      log(e);
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print("SUCCESS" + response.paymentId);
    errorMessage(scaffold: _scaffoldkey, message: 'Paymnet Success');
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print("ERROR" + response.message + response.toString());
    errorMessage(scaffold: _scaffoldkey, message: 'Error Occured');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print("EXTERNAL WALLET" + response.walletName);
    errorMessage(scaffold: _scaffoldkey, message: 'External vallet');
  }

  //*! the id from courseScreen is passed here **********
  Future<void> fetchData() async {
    await Provider.of<CourseProvider>(context, listen: false)
        .coursePackage(id: widget.courseId)
        .catchError((e) => setState(() => _errorMsg = true));
    _courspaymnetData =
        Provider.of<CourseProvider>(context, listen: false).coursePaymnetData;
    setState(() => _isLoading = false);
    if (_courspaymnetData == null) {
      setState(() => _errorMsg = true);
    }
  }

  @override
  void didChangeDependencies() {
    fetchData();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldkey,
      body: SafeArea(
        child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            child: _isLoading
                ? LoadingWidget(title: 'Loading Payment')
                : _errorMsg
                    ? Text('Error Occured',
                        style: Theme.of(context).textTheme.headline5)
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Packages",
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          SizedBox(height: 20),
                          Container(
                            height: deviceSize.height * 0.8,
                            margin: EdgeInsets.all(20),
                            child: ListView.builder(
                                itemCount: _courspaymnetData.length,
                                itemBuilder: (ctx, i) {
                                  return Container(
                                    margin: EdgeInsets.all(20),
                                    child: OutlineButton(
                                      onPressed: () => opencheckout(
                                          totalAmount: double.parse(
                                              _courspaymnetData[i].amount)),
                                      padding: EdgeInsets.all(50),
                                      borderSide:
                                          BorderSide(color: Colors.blue),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            _courspaymnetData[i].name,
                                            style: Theme.of(context)
                                                .primaryTextTheme
                                                .headline6,
                                          ),
                                          // Text(
                                          //   desc[i],
                                          //   style: onboardSubitleStyle,
                                          // ),
                                          SizedBox(height: 20),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                  "For  ${_courspaymnetData[i].amount}"),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      )),
      ),
    );
  }
}

//  onTap: () => opencheckout(
//                                 totalAmount: double.parse(
//                                     _courspaymnetData[index].amount)),

//  Text(
// '${_courspaymnetData[index].duration.toString()} Days')

//                         title: Text(_courspaymnetData[index].name),
// subtitle: Text(_courspaymnetData[index].amount),
