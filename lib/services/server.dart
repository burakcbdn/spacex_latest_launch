import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spacex_latest_launch/models/spacex_launch.model.dart';

class Server {
  static const String URL = "https://api.spacexdata.com/v4/launches/latest";

  static Future<Map<String, dynamic>> getLaunchData() async {
    http.Response response = await http.get(Uri.parse(URL));

 

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return {};
    }
  }

  static Future<SpaceXLaunch> createLaunchModel() async {
    Map<String, dynamic> launchData = await getLaunchData();
    if (launchData != {}) {
      String patchURL = launchData["links"]["patch"]["small"];
      List gallery = launchData["links"]["flickr"]["original"];
      String details = launchData["details"];
      String dateLocal = launchData["date_local"];
      String name = launchData["name"];
      String id = launchData["id"];
      bool success = launchData["success"];

      List dateList = dateLocal.split("T").first.split("-");
      String time = dateLocal.split("T").last;

      String date = "${dateList[2]}/${dateList[1]}/${dateList[0]}";


      List timeList = time.split(":");

      time = timeList[0] + ":" + timeList[1];

      Map<String, dynamic> data = {
        "patchURL": patchURL,
        "gallery": gallery,
        "details": details,
        "date": date + " " + time,
        "name": name,
        "id": id,
        "success": success
      };

      return SpaceXLaunch.fromData(data);
    } else {
      throw "cannot fetch data";
    }
  }
}
