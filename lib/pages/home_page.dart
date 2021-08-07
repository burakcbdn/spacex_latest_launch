import 'package:flutter/material.dart';
import 'package:spacex_latest_launch/widgets/detail_text_item.dart';
import 'package:spacex_latest_launch/pages/error_view.dart';
import 'package:spacex_latest_launch/widgets/image_view.dart';
import 'package:spacex_latest_launch/widgets/loading_indicator.dart';
import 'package:spacex_latest_launch/services/server.dart';
import 'package:spacex_latest_launch/models/spacex_launch.model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SpaceXLaunch? spaceXLaunch;
  bool error = false;

  void fetchData() async {
    try {
      var result = await Server.createLaunchModel();
      setState(() {
        spaceXLaunch = result;
      });
    } catch (e) {
      setState(() {
        error = true;
      });
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void refresh() {
    setState(() {
      spaceXLaunch = null;
      error = false;
    });

    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        title: Text("SpaceX Latest Launch",
            style: TextStyle(color: Colors.blue, fontSize: 22)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: refresh, icon: Icon(Icons.refresh, color: Colors.blue))
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: spaceXLaunch != null
            ? RefreshIndicator(
                onRefresh: () async {
                  refresh();
                },
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          height: 250,
                          width: 250,
                          child: Image.network(spaceXLaunch!.patchURL),
                        ),
                      ),
                      SizedBox(height: 10),
                      DetailTextItem(text: spaceXLaunch!.name, title: "Name: "),
                      SizedBox(height: 5),
                      DetailTextItem(text: spaceXLaunch!.id, title: "ID: "),
                      SizedBox(height: 5),
                      DetailTextItem(text: spaceXLaunch!.date, title: "Date: "),
                      SizedBox(height: 5),
                      DetailTextItem(
                        text: spaceXLaunch!.success ? "Success" : "Failed",
                        title: "Status: ",
                        isStatus: true,
                        status: spaceXLaunch!.success,
                      ),
                      SizedBox(height: 10),
                      ImageView(gallery: spaceXLaunch!.gallery),
                      SizedBox(height: 15),
                      Text(
                        spaceXLaunch!.details,
                        style: TextStyle(
                          fontSize: 18,
                          height: 1.5,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(height: 50),
                    ],
                  ),
                ),
              )
            : !error
                ? Center(
                    child: CustomLoadingIndicator(),
                  )
                : ErrorView(),
      ),
    );
  }
}
