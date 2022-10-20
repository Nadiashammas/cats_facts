import 'dart:convert';

import '../model/images.dart';
import 'package:http/http.dart' as http;

class RemoteServicesImages {
  Future<List<Images>?> getImage() async {
    var client = http.Client();
    var uri = Uri.parse(
        'https://api.thecatapi.com/v1/images/search?limit=10&breed_ids=beng&api_key=live_avWuY1SJaa6HDEh43dErPZf70CmK3S2ozk8NYOkVwZ6SKFf32VmcI0PqURTo1t2p');
    var responce = await client.get(uri);
    if (responce.statusCode == 200) {
      var json = responce.body;
      return imagesFromJson(json);
    }
  }
}
