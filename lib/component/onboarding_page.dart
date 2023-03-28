import 'package:flutter/material.dart';
import 'package:remedy/component/rounded_button.dart';
import 'package:remedy/pages/home_page.dart';
import 'package:remedy/pages/login_register_page.dart';
import 'package:remedy/widget_tree.dart';
import 'package:get/get.dart';

class OnBoardingPage extends StatelessWidget {
  OnBoardingPage(
      {Key? key,
      required this.image,
      required this.title,
      required this.description,
      required this.noOfScreen,
      required this.onNextPressed,
      required this.currentScreenNo,
      required this.onSkipPressed})
      : super(key: key);

  final Image image;

  final String title;

  final String description;

  final int noOfScreen;

  final Function(int) onNextPressed;

  int currentScreenNo;

  final Function(int) onSkipPressed;

  final PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  image,
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 30, color: Color.fromRGBO(3, 65, 114, 1)),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      description,
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: (currentScreenNo == 2 ? false : true),
                  child: RoundedButton(
                      title: "Skip",
                      onPressed: () {
                        onSkipPressed(currentScreenNo = 2);
                      }),
                ),
                Row(
                  children: [
                    for (int index = 0; index < noOfScreen; index++)
                      createProggressDots(
                          (index == currentScreenNo) ? true : false),
                  ],
                ),
                Visibility(
                  visible: (currentScreenNo == 2 ? false : true),
                  child: RoundedButton(
                      title: "Next",
                      onPressed: () {
                        onNextPressed(currentScreenNo + 1);
                      }),
                ),
                Visibility(
                    visible: (currentScreenNo == 2 ? true : false),
                    child: TextButton(
                      // ignore: sort_child_properties_last
                      child: const Text(
                        "Let's Get Start",
                        style: TextStyle(color: Colors.black),
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(82, 222, 160, 1),
                          padding: const EdgeInsets.all(0),
                          fixedSize: const Size(370, 100)),
                      onPressed: () => Get.to(HomePage()),
                    )),
              ],
            )
          ],
        ));
  }

  Widget createProggressDots(bool isActiveScreen) {
    return Visibility(
      visible: (currentScreenNo == 2 ? false : true),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        height: isActiveScreen ? 15 : 10,
        width: 10,
        decoration: BoxDecoration(
            color: isActiveScreen
                ? const Color.fromRGBO(82, 222, 160, 1)
                : const Color.fromRGBO(3, 65, 114, 1),
            borderRadius: const BorderRadius.all(Radius.circular(12))),
      ),
    );
  }
}
