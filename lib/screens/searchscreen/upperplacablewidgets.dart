import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Ticonbuttoncutomized extends StatelessWidget {
  final IconData icon;
  final Color x;
 final  void Function() ontap;
   const Ticonbuttoncutomized({super.key,required this.icon,required this.x,required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
        child: Icon(
          icon,
          color: x,
          
        ),
      ),
    );
  }
}

class Tfilterbutton extends StatelessWidget {
  final  void Function() ontap;
  const Tfilterbutton({super.key, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 45,
        width: 90,
        decoration:  BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Colors.blue,width: 2),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Row(children: [Icon(Icons.filter_alt_outlined,color: Colors.blue,size: 27,),Text('Filters',style: TextStyle(fontSize: 17,color: Colors.blue),)],),
      ),
    );
  }
}

