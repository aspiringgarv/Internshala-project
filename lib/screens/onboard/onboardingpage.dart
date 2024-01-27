import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SOnboardingPage extends StatelessWidget {
  final String image,title,subtitle;
  const SOnboardingPage({
    super.key
  ,required this.title,required this.subtitle,required this.image
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
            height: MediaQuery.of(context).size.height*0.6,
            width: MediaQuery.of(context).size.width *0.8,
            image: AssetImage(image)),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,

          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10,),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}