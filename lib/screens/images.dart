import 'package:cats_facts/model/images.dart';
import 'package:flutter/material.dart';
import '../remote_services/remote_services_images.dart';

class CatImages extends StatefulWidget {
  const CatImages({Key? key}) : super(key: key);

  @override
  State<CatImages> createState() => _CatImagesState();
}

class _CatImagesState extends State<CatImages> {
  List<Images> myImage = [];
  loaddata() async {
    myImage = (await RemoteServicesImages().getImage())!;
  }

  @override
  void initState() {
    loaddata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            itemCount: 10,
            itemBuilder: (BuildContext ctx, index) {
              return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15)),
                child: InkWell(
                  onTap: () {
                    print('tapped');
                  },
                  child: Image.network(myImage[index].url.toString()),
                ),
              );
            }),
      )
    ])));
  }
}
