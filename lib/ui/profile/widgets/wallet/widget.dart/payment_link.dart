import 'package:flutter/material.dart';
import 'package:izle/utils/my_prefs.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentLinkScreen extends StatefulWidget {
  @override
  State<PaymentLinkScreen> createState() => _PaymentLinkScreenState();
}

class _PaymentLinkScreenState extends State<PaymentLinkScreen> {
  _launchURLBrowser() async {
    const url = 'https://flutterdevs.com/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURLApp() async {
    String url = '${MyPref.paymentLink}';
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: true, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    _launchURLApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: _launchURLApp,
          child: Center(
            child: Text(MyPref.paymentLink),
          ),
        ),
      ),
    );
  }
}
