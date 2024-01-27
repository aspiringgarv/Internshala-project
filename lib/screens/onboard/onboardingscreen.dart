

import 'package:flutter/material.dart';
import 'package:internshala_assignment/constants/imagepath.dart';
import 'package:provider/provider.dart';


import '../../constants/text_strings.dart';
import 'onboardProvider.dart';
import 'onboardingpage.dart';
import 'onboardbutton.dart';
class SOnboarding extends StatelessWidget {
  const SOnboarding({super.key});

  @override
  Widget build(BuildContext context) {

    bool isdark = Theme.of(context).brightness == Brightness.dark;
    return Consumer<SonboardProvider>(
      builder: (BuildContext context, SonboardProvider sop, Widget? child) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Stack(
              children: [
                PageView(
            
                  controller: sop.controller,
                  onPageChanged: (int pageIndex) {
                    // Use a new context within the callback
                   sop.updatepage(pageIndex);
                  },
                  children: [
                    SOnboardingPage(
                      title: TTexts.onBoardingTitle1,
                      image: Timagepath.onboard1,
                      subtitle: TTexts.onBoardingSubTitle1,
                    ),
                    SOnboardingPage(
                      title: TTexts.onBoardingTitle2,
                      image: Timagepath.onboard2,
                      subtitle: TTexts.onBoardingSubTitle2,
                    ),
                    SOnboardingPage(
                      title: TTexts.onBoardingTitle3,
                      image: Timagepath.onboard3,
                      subtitle: TTexts.onBoardingSubTitle3,
                    ),
                  ],
                ),
                const Onboardingskip(),
                bootompageslider(isdark: isdark),
                Nextbutton(isdark: isdark),
              ],
            ),
          ),
        );
      },
    );
  }
}

