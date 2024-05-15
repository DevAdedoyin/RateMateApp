class OnboardingModel {
  final String header;
  final String image;

  OnboardingModel({required this.header, required this.image});

  static List<OnboardingModel> listOfOnboardingModel = [
    OnboardingModel(
        header: "Easy to use currency conversion app.",
        image: "assets/images/onb0.png"),
    OnboardingModel(
        header: "Convert money from any currency of choice to another.",
        image: "assets/images/onb2.png"),
    OnboardingModel(
        header: "View historical data on currency conversion.",
        image: "assets/images/onb1.png"),
  ];
}
