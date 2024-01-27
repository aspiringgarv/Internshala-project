import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tcustomizedtile extends StatelessWidget {
  final String title;
  final Color color;
  final String company_name;
  final bool workfromhome;
  final String start_date;
  final String duration;
  final String stipened;
  final void Function() apply;
  final void Function() viewDetails;
  Tcustomizedtile({
    super.key,
    required this.title,
    required this.color,
    required this.company_name,
    required this.workfromhome,
    required this.start_date,
    required this.duration,
    required this.stipened,
    required this.apply,
    required this.viewDetails,
  });

  @override
  Widget build(BuildContext context) {
    bool isdark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
        ),
        padding:
            const EdgeInsets.only(bottom: 10, top: 10, left: 15, right: 10),
        height: 270,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 2, left: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 2, left: 5),
              child: Text(company_name,
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: isdark ? Colors.white : Colors.black54)),
            ),
            workfromhome == true
                ? Padding(
                    padding: const EdgeInsets.only(left: 5, top: 4),
                    child: Row(
                      children: [
                        const Icon(CupertinoIcons.home),
                        Text(" Work from home",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: isdark ? Colors.white : Colors.black))
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(left: 5, top: 4),
                    child: Row(
                      children: [
                        Icon(CupertinoIcons.building_2_fill),
                        Text(" On site",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: isdark ? Colors.white : Colors.black))
                      ],
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.only(left: 5, top: 4),
              child: Row(
                children: [
                  Text(start_date,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: isdark ? Colors.white : Colors.grey)),
                  const SizedBox(
                    width: 30,
                  ),
                  const Icon(Icons.calendar_today),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(duration,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: isdark ? Colors.white : Colors.grey)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, top: 4),
              child: Row(
                children: [
                  Text(stipened,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: isdark ? Colors.white : Colors.grey)),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Divider(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: viewDetails,
                  child: SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: const Center(
                        child: Text(
                      'View details',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    )),
                  ),
                ),
                GestureDetector(
                  onTap: apply,
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.3,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: const Center(
                        child: Text(
                      'Apply now',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
