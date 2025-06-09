import 'package:flutter/material.dart';
import 'package:penger/components/button.dart';
import 'package:penger/models/slides.dart';
import 'package:penger/resources/apcolors.dart';
import 'package:penger/resources/app_routes.dart';
import 'package:penger/resources/appstyles.dart';

class Walkthrought extends StatefulWidget {
  const Walkthrought({super.key});
  @override
  State<Walkthrought> createState() => _WalkthroughtState();
}

class _WalkthroughtState extends State<Walkthrought> {
  PageController pageController = PageController();
  int currentPage = 0;
  List<Slide> slides = [
    Slide(
      title: "Gain full control of your money",
      image: "assets/images/walkingthrought1.png",
      description: "Become your own money manager and make every cent count",
    ),
    Slide(
      title: "Know where your money goes",
      image: "assets/images/walkingthrought2.png",
      description:
          "Track your transaction easily, with categories and financial report",
    ),
    Slide(
      title: "Planning ahead",
      image: "assets/images/walkingthrought3.png",
      description: "Setup your budget for each category so you in control",
    ),
  ];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.bgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: PageView.builder(
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              controller: pageController,
              itemCount: slides.length,
              itemBuilder: (context, index) {
                return ListView(
                  padding: const EdgeInsets.all(24),
                  shrinkWrap: true,
                  children: [
                    Center(child: Image.asset(slides[index].image,width: MediaQuery.of(context).size.width/1.5)),
                    SizedBox(height: 24),
                    Text(
                      slides[index].title,
                      style: Appstyles.title1(),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16),
                    Text(
                      slides[index].description,
                      style: Appstyles.regular1(color: Appcolors.light20),
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                indicators(currentPage),
                SizedBox(height: 24),
                Buttoncomponent(label: 'Sign Up', buttonType: 'primary',
                onPressed: ()=>Navigator.of(context).pushNamed(AppRoutes.signup) ),
                SizedBox(height: 16),
                Buttoncomponent(label: 'Login', buttonType: 'secondary',
                onPressed: ()=>Navigator.of(context).pushNamed(AppRoutes.login)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget indicators(int currentPage) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        for (int i = 0; i < slides.length; i++) ...[
          i == currentPage
              ? Icon(Icons.circle, color: Appcolors.primaryColor, size: 16)
              : InkWell( onTap: ()=> pageController.animateToPage(i, duration: const Duration(milliseconds: 100), curve: Curves.easeInCubic)         ,
               child: Icon(
                    Icons.circle,
                    color: Appcolors.primaryColorlight,
                    size: 8,
                  ),
              ),
          if (i != slides.length - 1) const SizedBox(width: 8),
        ],
      ],
    );
  }
}
