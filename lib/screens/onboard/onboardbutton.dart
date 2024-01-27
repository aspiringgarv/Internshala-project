import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'onboardProvider.dart';
class Onboardingskip extends StatelessWidget {
  const Onboardingskip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SonboardProvider>(
      builder: (context, sonboardProvider, child) {
        return Positioned(
          top: kToolbarHeight,
          right: 10,
          child: GestureDetector(
            onTap: () {
              sonboardProvider.tappedskip();
            },
            child: Text(
              'Skip',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        );
      },
    );
  }
}

class Nextbutton extends StatelessWidget {
  const Nextbutton({
    Key? key,
    required this.isdark,
  }) : super(key: key);

  final bool isdark;

  @override
  Widget build(BuildContext context) {
    return Consumer<SonboardProvider>(
      builder: (BuildContext con, sonboardProvider, child) {
        return Positioned(
          right: 13,
          bottom: 10,
          child: GestureDetector(
            onTap: () {
              sonboardProvider.tappednext(con);
            },
            child: Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: isdark ? Colors.white : Colors.black,
              ),
              child: Center(
                child: Icon(
                  Icons.navigate_next,
                  color: isdark ? Colors.black : Colors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class bootompageslider extends StatelessWidget {
  const bootompageslider({
    super.key,
    required this.isdark,
  });

  final bool isdark;

  @override
  Widget build(BuildContext context) {
    return Consumer<SonboardProvider>(builder: (BuildContext context, SonboardProvider value, Widget? child) {
      return Positioned(
          bottom: 10,
          left: 10,
          child: SmoothPageIndicator(
            controller: value.controller,
            count: 3,
            onDotClicked: (index){
              value.updatepage(index);
            },
            effect: ExpandingDotsEffect(activeDotColor: isdark?Colors.white:Colors.black,
              dotHeight: 6,

            ),
          ));
    },);
  }
}
