import 'dart:convert';

import '../model/cates.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  Future<Cats?> getFact() async {
    var client = http.Client();
    var uri = Uri.parse('https://catfact.ninja/fact');
    var responce = await client.get(uri);
    if (responce.statusCode == 200) {
      var json = responce.body;
      return catsFromJson(json);
    }
  }
}
