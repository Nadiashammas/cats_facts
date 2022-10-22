import 'package:cats_facts/model/images.dart';
import 'package:flutter/material.dart';
import '../remote_services/remote_services_images.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';
import 'package:image_downloader/image_downloader.dart';

class CatImages extends StatefulWidget {
  const CatImages({Key? key}) : super(key: key);

  @override
  State<CatImages> createState() => _CatImagesState();
}

class _CatImagesState extends State<CatImages> {
  bool loading = true;
  List<Images> myImage = [];
  loaddata() async {
    myImage = (await RemoteServicesImages().getImage())!;
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    loaddata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return CircularProgressIndicator();
    }

    return SafeArea(
        child: Scaffold(
            body: Stack(children: [
      Container(
        height: double.infinity,
        width: double.infinity,
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: 20,
            itemBuilder: (BuildContext ctx, index) {
              return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15)),
                child: InkWell(
                  onTap: () {},
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        FullScreenWidget(
                            child: Column(
                          children: [
                            Image.network(myImage[index].url.toString()),
                            ElevatedButton(
                                onPressed: () {
                                  ImageDownloader.downloadImage(
                                      myImage[index].url);
                                },
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateColor.resolveWith(
                                            (states) => Colors.black26)),
                                child: Text("save")),
                          ],
                        )),
                      ],
                    ),
                  ),
                ),
              );
            }),
      )
    ])));
  }
}
