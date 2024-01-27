import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internshala_assignment/backend/datafromapi/data.dart';
import 'package:internshala_assignment/constants/imagepath.dart';
import 'package:internshala_assignment/screens/searchscreen/upperplacablewidgets.dart';
import 'Appbar.dart';
import 'customizedjobtile.dart';

class Tsearchscreen extends StatefulWidget {
  static bool toggle = true;
  const Tsearchscreen({super.key});
  @override
  State<Tsearchscreen> createState() => _TsearchscreenState();
}

class _TsearchscreenState extends State<Tsearchscreen> {
  @override
  void initState() {
    super.initState();
  }

  void update(String string) {
    if (string.isEmpty) {
      setState(() {
        if (Tsearchscreen.toggle == false) {
          l = [];
          Tsearchscreen.toggle = true;
        } else {
          l = [];
          Tsearchscreen.toggle = false;
        }
      });
    } else {
      setState(() {
        Tsearchscreen.toggle = false;
      });
    }
  }

  void searchmap(String name) {
    List<dynamic> id = Tapidata.mp['data']['internship_ids'];
    l = [];
    for (int i = 0; i < id.length; i++) {
      String s =
          Tapidata.mp['data']['internships_meta'][id[i].toString()]['title'];
      if (s.compareTo(name) == 1) {
        l.add(Tapidata.mp['data']['internships_meta'][id[i].toString()]);
      }
    }
  }

  List<Map<String, dynamic>> l = [];
  @override
  Widget build(BuildContext context) {
    bool isdark = Theme.of(context).brightness == Brightness.dark;
    Color colortemplate = isdark ? Colors.white : Colors.black;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 170,
                minHeight: 110,
              ),
              child: Column(
                children: [
                  Tappbar(
                      colortemplate: colortemplate,
                      menu: () {},
                      bookmark: () {},
                      search: () {
                        setState(() {
                          update("");
                        });
                      },
                      messages: () {},
                      textfieldchanged: (String string) {
                        update(string);
                        searchmap(string);

                        update(string);
                      }),
                  const SizedBox(
                    height: 30,
                  ),
                  Tfilterbutton(ontap: () {}),
                  Text(
                    '${Tapidata.mp['data']['internships_meta'].length} total internships',
                    style: const TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
            Divider(
              color: isdark ? Colors.white38 : Colors.grey,
              height: 1,
              thickness: 2,
            ),
            Tapidata.mp['status'] == 200
                ? Visibility(
                    child: !Tsearchscreen.toggle
                        ? Expanded(
                            child: ListView.builder(
                                itemCount: l.length,
                                itemBuilder: (context, i) {
                                  return Tcustomizedtile(
                                          title: l[i]['title'],
                                          color: Colors.transparent,
                                          company_name: l[i]['company_name'],
                                          workfromhome: true,
                                          start_date: l[i]['start_date'],
                                          duration: l[i]['duration'],
                                          stipened: l[i]['stipend']['salary'],
                                          apply: () {},
                                          viewDetails: () {},
                                        );
                                }))
                        : Expanded(
                            child: ListView.builder(
                                itemCount: Tapidata
                                    .mp['data']['internships_meta'].length,
                                itemBuilder: (context, i) {
                                  int id =
                                      Tapidata.mp['data']['internship_ids'][i];
                                  return Tcustomizedtile(
                                    title: Tapidata.mp['data']
                                            ['internships_meta'][id.toString()]
                                        ['title'],
                                    color: Colors.transparent,
                                    company_name: Tapidata.mp['data']
                                            ['internships_meta'][id.toString()]
                                        ['company_name'],
                                    workfromhome: Tapidata.mp['data']
                                            ['internships_meta'][id.toString()]
                                        ['work_from_home'],
                                    start_date: Tapidata.mp['data']
                                            ['internships_meta'][id.toString()]
                                        ['start_date'],
                                    duration: Tapidata.mp['data']
                                            ['internships_meta'][id.toString()]
                                        ['duration'],
                                    stipened: Tapidata.mp['data']
                                            ['internships_meta'][id.toString()]
                                        ['stipend']['salary'],
                                    apply: () {},
                                    viewDetails: () {},
                                  );
                                })),
                  )
                : Expanded(
                    child: Center(
                        child: Image(
                      image: AssetImage(Timagepath.loading),
                      height: 200,
                      width: 200,
                    )),
                  ),
          ],
        ),
      ),
    );
  }
}
