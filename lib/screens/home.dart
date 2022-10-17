import 'package:flutter/material.dart';
import 'package:translator/translator.dart';
import '../model/cates.dart';
import '../remote_services/remote_services.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String fact = '';
  Cats? myCat;
  bool loading = false;
  GoogleTranslator translator = GoogleTranslator();

  loaddata() async {
    myCat = await RemoteServices().getFact();
    fact = myCat!.fact.toString();
  }

  void translate() {
    translator.translate(fact, to: "ar").then((output) {
      setState(() {
        fact = output.text;
        loaddata();
      });
    });
  }

  @override
  void initState() {
    loaddata();
    super.initState();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.network(
                'https://i.pinimg.com/originals/18/84/d4/1884d4e8ec9560ebac194d2da56474c2.jpg',
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.85,
            child: Center(
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.transparent)),
                  onPressed: () {
                    setState(() {
                      loaddata();
                      loading = true;
                    });
                  },
                  child: const Text(
                    'Facts in English',
                    style: TextStyle(fontSize: 20, letterSpacing: 1),
                  )),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.85,
            left: MediaQuery.of(context).size.width * 0.55,
            child: Center(
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.transparent)),
                  onPressed: () {
                    // showDataAlert();
                    translate();
                  },
                  child: const Text(
                    'Facts in Arabic',
                    style: TextStyle(fontSize: 20, letterSpacing: 1),
                  )),
            ),
          ),
          Visibility(
            visible: loading,
            replacement: const Center(child: CircularProgressIndicator()),
            child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: myCat != null
                    ? Container(
                        color: Colors.white54,
                        // width: 200,
                        height: MediaQuery.of(context).size.height * 0.33,
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              //if myCat is not null
                              (fact),
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    : const Card(
                        //if myCat is null
                        child: Text("Error while getting messages."),
                      )),
          ),
        ]),
      ),
    );
  }

  // showDataAlert() {
  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.all(
  //               Radius.circular(
  //                 20.0,
  //               ),
  //             ),
  //           ),
  //           contentPadding: EdgeInsets.only(
  //             top: 10.0,
  //           ),
  //           title: Text(
  //             "الترجمة",
  //             style: TextStyle(fontSize: 24.0),
  //           ),
  //           content: Container(
  //             height: 400,
  //             child: SingleChildScrollView(
  //               padding: const EdgeInsets.all(8.0),
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: <Widget>[
  //                   Padding(
  //                     padding: const EdgeInsets.all(8.0),
  //                     child: Text(
  //                       (fact.translate(to: 'ar').toString()),
  //                       style: TextStyle(fontSize: 18),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         );
  //       });
  // }
}
