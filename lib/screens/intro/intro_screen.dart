import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:winc_project/screens/login/login_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();
  final String cloud = 'assets/intro/online_storage.svg';
  // final String delievery = 'assets/intro/online_shopping.svg';
  final String searchHouse = 'assets/intro/houston.svg';
  final String shopping = 'assets/intro/online_store.svg';
  final String travel = 'assets/intro/world_connection.svg';
  final String navigate = 'assets/intro/navigation_monochromatic.svg';

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => LoginScreen()),
    );
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: SvgPicture.asset(
        assetName,
        height: 250.0,
        width: 250.0,
      ),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      // pageColor: Color(0xFF00897b),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "Uhifadhi wa Wingu",
          body:
              "Ni teknolojia(TEHAMA) bora na salama ya kukifadhi taarifa mbali mbali za kibiasha.",
          // "Hifadhi taarifa ya biashara yako mtandao huku kukiwa na ulinzi mkubwa.",
          image: _buildImage(cloud),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Rasilimali",
          body: "Tambua rasilimali zilizomo ndani ya mji wako",
          image: _buildImage(searchHouse),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Biashara",
          body:
              "Hauhitaji kumiliki mtandao wako mweyewe ili uwavutie wateja, simu yako ndio suluhisho lako.",
          image: _buildImage(shopping),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Sehemu",
          body:
              "Tabua biza zinazopatikana nadi ya mji wako ama unaweza kutanga biasha yako.",
          image: _buildImage(travel),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Fuatilia",
          body:
              "Ni rahisi kwa mteja wako kutambua sehemu ya office ama biashara yako iliko.",
          image: _buildImage(navigate),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text(
        'Ruka',
        style: TextStyle(color: Color(0xFFFF00897b)),
      ),
      next: const Icon(Icons.arrow_forward, color: Color(0xFFFF00897b)),
      done: const Text('Kamilika',
          style: TextStyle(
              color: Color(0xFFFF00897b), fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size(8.0, 8.0),
        color: Color(0xFFBDBDBD),
        activeColor: Color(0xFF00897b),
        activeSize: Size(12.0, 8.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
