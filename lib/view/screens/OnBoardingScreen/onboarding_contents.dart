import 'package:sunsetgardenapp/utils/appimages.dart';

class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title:
        "Each sunrise brings a new day filled with new hopes for a new beginning.", //  Languages.of(context)!.next,
    image: AppImages.welcomescreenillimage,
    desc:
        "Publish up your selfies to make yoursef \nmore beautiful with this app.",
  ),
  OnboardingContents(
    title:
        "It’s important to have good lighting (security cameras are a bonus) in common areas .",
    image: AppImages.welcomescreenillimagesec,
    desc:
        "But understanding the contributions our colleagues make to our teams and companies.",
  ),
  OnboardingContents(
    title:
        "Here is the step-by-step guide on how to create a simple booking calendar with your choice.",
    image: AppImages.welcomescreenillimagethree,
    desc:
        "Take control of notifications, collaborate live or on your own time.",
  ),
];
