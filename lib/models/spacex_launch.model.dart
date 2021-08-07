import 'package:flutter/rendering.dart';


// Model class for SpaceX Launch Data
class SpaceXLaunch {
  // id of the launch
  String id;
  // url of the patch
  String patchURL;
  // details of the launch
  String details;
  // name of the launch
  String name;
  // local date of the launch
  String date;
  // status of launch [true] => success, [false] => failed
  bool success;
  // flickr images of launch
  List gallery;

  SpaceXLaunch({
    required this.id,
    required this.patchURL,
    required this.details,
    required this.name,
    required this.date,
    required this.success,
    required this.gallery,
  });

  factory SpaceXLaunch.fromData(Map<String, dynamic> data) {
    return SpaceXLaunch(
      id: data["id"],
      patchURL: data["patchURL"],
      details: data["details"],
      name: data["name"],
      date: data["date"],
      success: data["success"],
      gallery: data["gallery"]
    );
  }

  String toString() {
    return {
        "patchURL": patchURL,
        "gallery": gallery,
        "details": details,
        "date": date,
        "name": name,
        "id": id,
        "success": success
      }.toString();
  }
}
