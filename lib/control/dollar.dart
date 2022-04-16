import 'package:dio/dio.dart';

// ignore: non_constant_identifier_names
Future getUSD_BRL() async {
  try {
    var response = await Dio().get(
      'https://free.currconv.com/api/v7/convert?q=USD_BRL&compact=ultra&apiKey=6bee5d2483bc3af7efc6',
      // 'www.google.com',
    );

    return (response.data["USD_BRL"]);
  } catch (e) {
    print(e);
  }
}
