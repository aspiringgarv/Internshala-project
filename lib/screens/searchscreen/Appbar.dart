import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internshala_assignment/screens/searchscreen/search.dart';
import 'package:internshala_assignment/screens/searchscreen/upperplacablewidgets.dart';

class Tappbar extends StatefulWidget {

  static bool visible = false;
  final Color colortemplate;
  final void Function() menu;
  final void Function() search;
  final void Function() bookmark;
  final void Function() messages;
  final void Function(String)? textfieldchanged;
  const Tappbar({
    super.key,
    required this.colortemplate,
    required this.menu,
    required this.bookmark,
    required this.search,
    required this.messages,
    required this.textfieldchanged,
  });

  @override
  State<Tappbar> createState() => _TappbarState();
}

class _TappbarState extends State<Tappbar> {
TextEditingController controller = TextEditingController();
@override
  void dispose() {
    // TODO: implement dispose
  controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Ticonbuttoncutomized(
              icon: Icons.menu,
              x: widget.colortemplate,
              ontap: widget.menu,
            ),
            Visibility(
              visible: !Tsearchscreen.toggle,
              child: Container(
                padding: EdgeInsets.only(top: 10),
                width: MediaQuery.of(context).size.width*0.5,
                // height: 100,
                child:  SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: "Enter Job title to Search",
                    ),
                    controller: controller,
                    onChanged: widget.textfieldchanged,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: (Tsearchscreen.toggle),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                ),
                child: Text(
                  "Internships",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Ticonbuttoncutomized(
              icon: Icons.search,
              x: widget.colortemplate,
              ontap: widget.search,
            ),
            Ticonbuttoncutomized(
              icon: Icons.bookmark_outline,
              x: widget.colortemplate,
              ontap: widget.bookmark,
            ),
            Ticonbuttoncutomized(
              icon: Icons.messenger_outline,
              x: widget.colortemplate,
              ontap: widget.messages,
            ),
          ],
        )
      ],
    );
  }


}
