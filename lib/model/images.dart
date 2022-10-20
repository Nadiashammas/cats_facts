// To parse this JSON data, do
//
//     final images = imagesFromJson(jsonString);

import 'dart:convert';

List<Images> imagesFromJson(String str) =>
    List<Images>.from(json.decode(str).map((x) => Images.fromJson(x)));

String imagesToJson(List<Images> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Images {
  Images({
    required this.id,
    required this.url,
    required this.width,
    required this.height,
  });

  String id;
  String url;
  int width;
  int height;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        id: json["id"],
        url: json["url"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "width": width,
        "height": height,
      };
}
