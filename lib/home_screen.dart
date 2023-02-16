import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:dio/dio.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var cryptoName = 'No Name';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCryptoData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3a0ca3),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(width: double.infinity),
            Image(
              image: AssetImage('assets/images/az-logo.png'),
              width: 200.0,
            ),
            SizedBox(height: 5.0),
            Text(
              'AZ CoinCap API',
              style: TextStyle(
                fontSize: 22.0,
                color: Color(0xffc75af6),
                fontFamily: 'LatoBold',
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Loading...',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10.0),
            loadingPreview(),
            Text(cryptoName),
          ],
        ),
      ),
    );
  }

  loadingPreview() {
    return SpinKitThreeBounce(
      color: Colors.white,
      size: 20.0,
    );
  }

  getCryptoData() async {
    var response = await Dio().get('http://api.coincap.io/v2/assets');
    setState(() {
      cryptoName = response.data[0]['id'];
      print('object123');
    });
  }
}
