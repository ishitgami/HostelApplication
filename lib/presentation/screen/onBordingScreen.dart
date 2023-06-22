// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hostelapplication/presentation/screen/auth/logInScreen.dart';
import 'package:hostelapplication/presentation/screen/auth/registrationScreen.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:page_transition/page_transition.dart';

class AnimationInfo {
  final AnimationTrigger trigger;
  final List<AnimationEffect> effects;

  AnimationInfo({required this.trigger, required this.effects});
}

enum AnimationTrigger {
  onPageLoad,
  onTap,
  onHover,
  onActionTrigger,
}

abstract class AnimationEffect {}

class VisibilityEffect extends AnimationEffect {
  final Duration duration;

  VisibilityEffect({required this.duration});
}

class FadeEffect extends AnimationEffect {
  final Curve curve;
  final Duration delay;
  final Duration duration;
  final double begin;
  final double end;

  FadeEffect({
    required this.curve,
    required this.delay,
    required this.duration,
    required this.begin,
    required this.end,
  });
}

class MoveEffect extends AnimationEffect {
  final Curve curve;
  final Duration delay;
  final Duration duration;
  final Offset begin;
  final Offset end;

  MoveEffect({
    required this.curve,
    required this.delay,
    required this.duration,
    required this.begin,
    required this.end,
  });
}

class ScaleEffect extends AnimationEffect {
  final Curve curve;
  final Duration delay;
  final Duration duration;
  final Offset begin;
  final Offset end;

  ScaleEffect({
    required this.curve,
    required this.delay,
    required this.duration,
    required this.begin,
    required this.end,
  });
}

extension AnimationExtensions on Widget {
  Widget animateOnPageLoad(AnimationInfo animationInfo) {
    final visibilityEffect = animationInfo.effects[0] as VisibilityEffect;
    final fadeEffect = animationInfo.effects[1] as FadeEffect;
    final moveEffect = animationInfo.effects[2] as MoveEffect;

    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: fadeEffect.begin, end: fadeEffect.end),
      duration: fadeEffect.duration,
      curve: fadeEffect.curve,
      builder: (BuildContext context, double value, Widget? child) {
        final opacity = value.clamp(0.0, 1.0);

        return Visibility(
          visible: visibilityEffect.duration > Duration.zero,
          child: Opacity(
            opacity: opacity,
            child: Transform.translate(
              offset: Offset(
                moveEffect.begin.dx +
                    (moveEffect.end.dx - moveEffect.begin.dx) * opacity,
                moveEffect.begin.dy +
                    (moveEffect.end.dy - moveEffect.begin.dy) * opacity,
              ),
              child: child,
            ),
          ),
        );
      },
      child: this,
    );
  }
}

final colors = Color(0xff96C3E2);

// class OnboardingScreen extends StatefulWidget {
//   @override
//   _OnboardingScreenState createState() => _OnboardingScreenState();
// }

// class _OnboardingScreenState extends State<OnboardingScreen> {
//   final kTitleStyle = const TextStyle(
//       color: Colors.black,
//       fontFamily: 'CM Sans Serif',
//       fontSize: 18.0,
//       height: 1.2,
//       fontWeight: FontWeight.bold);

//   final kSubtitleStyle = const TextStyle(
//     color: Colors.grey,
//     fontSize: 18.0,
//     height: 1.2,
//   );
//   final int _numPages = 3;
//   final PageController _pageController = PageController(initialPage: 0);
//   int _currentPage = 0;

//   List<Widget> _buildPageIndicator() {
//     List<Widget> list = [];
//     for (int i = 0; i < _numPages; i++) {
//       list.add(i == _currentPage ? _indicator(true) : _indicator(false));
//     }
//     return list;
//   }

//   Widget _indicator(bool isActive) {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 150),
//       margin: const EdgeInsets.symmetric(horizontal: 8.0),
//       height: 8.0,
//       width: isActive ? 24.0 : 16.0,
//       decoration: BoxDecoration(
//         color: isActive ? const Color(0xFF7B51D3) : Colors.grey,
//         borderRadius: const BorderRadius.all(const Radius.circular(12)),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: AnnotatedRegion<SystemUiOverlayStyle>(
//         value: SystemUiOverlayStyle.light,
//         child: Container(
//           color: Colors.white,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(vertical: 40.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 SizedBox(
//                   height: 600.0,
//                   child: PageView(
//                     physics: const ClampingScrollPhysics(),
//                     controller: _pageController,
//                     onPageChanged: (int page) {
//                       setState(() {
//                         _currentPage = page;
//                       });
//                     },
//                     children: <Widget>[
//                       Padding(
//                         padding: const EdgeInsets.all(40.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Center(
//                               child: Image.asset(
//                                 'assets/images/onbord1.png',
//                                 height: 370.0,
//                                 width: 370.0,
//                               ),
//                             ),
//                             const SizedBox(height: 50.0),
//                             Center(
//                               child: Text(
//                                 'FIND PROBLEM',
//                                 style: kTitleStyle,
//                               ),
//                             ),
//                             const SizedBox(height: 15.0),
//                             Center(
//                               child: Text(
//                                 textAlign: TextAlign.center,
//                                 'Find the problems yoy are facing in your hostel',
//                                 style: kSubtitleStyle,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(40.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Center(
//                               child: Image.asset(
//                                 'assets/images/onbord2.png',
//                                 height: 300.0,
//                                 width: 300.0,
//                               ),
//                             ),
//                             const SizedBox(height: 50.0),
//                             Center(
//                               child: Text(
//                                 'POST YOUR COMPLAINTS',
//                                 style: kTitleStyle,
//                               ),
//                             ),
//                             const SizedBox(height: 15.0),
//                             Text(
//                               textAlign: TextAlign.center,
//                               'Log in to your account and upload the problem you are facing',
//                               style: kSubtitleStyle,
//                             ),
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(40.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Center(
//                               child: Image.asset(
//                                 'assets/images/onbord3.png',
//                                 height: 300.0,
//                                 width: 300.0,
//                               ),
//                             ),
//                             const SizedBox(height: 30.0),
//                             Center(
//                               child: Text(
//                                 'BE SMART',
//                                 style: kTitleStyle,
//                               ),
//                             ),
//                             const SizedBox(height: 15.0),
//                             Text(
//                               textAlign: TextAlign.center,
//                               'Thats it! your problem will be shown\nto the management and will\nbe solved soon',
//                               style: kSubtitleStyle,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: _buildPageIndicator(),
//                 ),
//                 _currentPage != _numPages - 1
//                     ? Expanded(
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Align(
//                             alignment: FractionalOffset.center,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 TextButton(
//                                   onPressed: () {
//                                     Navigator.pushReplacementNamed(
//                                         context, logInScreenRoute);
//                                   },
//                                   child: const Text(
//                                     'Skip',
//                                     style: TextStyle(
//                                       color: Colors.grey,
//                                       fontSize: 22.0,
//                                     ),
//                                   ),
//                                 ),
//                                 TextButton(
//                                   onPressed: () {
//                                     _pageController.nextPage(
//                                       duration:
//                                           const Duration(milliseconds: 500),
//                                       curve: Curves.ease,
//                                     );
//                                   },
//                                   child: const Text(
//                                     'Next',
//                                     style: TextStyle(
//                                       color: Color.fromARGB(209, 116, 66, 224),
//                                       fontSize: 22.0,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       )
//                     : const Text(''),
//               ],
//             ),
//           ),
//         ),
//       ),
//       bottomSheet: _currentPage == _numPages - 1
//           ? Container(
//               height: 100.0,
//               width: double.infinity,
//               color: Colors.white,
//               child: GestureDetector(
//                 onTap: () {
//                   Navigator.pushReplacementNamed(context, logInScreenRoute);
//                 },
//                 child: const Center(
//                   child: Padding(
//                     padding: EdgeInsets.only(bottom: 30.0),
//                     child: Text(
//                       'Get started',
//                       style: TextStyle(
//                         color: Color(0xFF5B16D0),
//                         fontSize: 20.0,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             )
//           : const Text(''),
//     );
//   }
// }

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  final animationsMap = {
    'imageOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 50.ms),
        FadeEffect(
          curve: Curves.elasticOut,
          delay: 50.ms,
          duration: 900.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.elasticOut,
          delay: 50.ms,
          duration: 900.ms,
          begin: Offset(71, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 150.ms),
        FadeEffect(
          curve: Curves.elasticOut,
          delay: 150.ms,
          duration: 900.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.elasticOut,
          delay: 150.ms,
          duration: 900.ms,
          begin: Offset(71, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 300.ms),
        FadeEffect(
          curve: Curves.elasticOut,
          delay: 300.ms,
          duration: 900.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.elasticOut,
          delay: 300.ms,
          duration: 900.ms,
          begin: Offset(71, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
    'textOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 400.ms),
        FadeEffect(
          curve: Curves.elasticOut,
          delay: 400.ms,
          duration: 900.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.elasticOut,
          delay: 400.ms,
          duration: 900.ms,
          begin: Offset(71, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
    'buttonOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 550.ms),
        FadeEffect(
          curve: Curves.elasticOut,
          delay: 550.ms,
          duration: 900.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.elasticOut,
          delay: 550.ms,
          duration: 900.ms,
          begin: Offset(-79, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
    'rowOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 650.ms),
        FadeEffect(
          curve: Curves.elasticOut,
          delay: 650.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.elasticOut,
          delay: 650.ms,
          duration: 600.ms,
          begin: Offset(-74, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
    'imageOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 50.ms),
        FadeEffect(
          curve: Curves.elasticOut,
          delay: 50.ms,
          duration: 900.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.elasticOut,
          delay: 50.ms,
          duration: 900.ms,
          begin: Offset(71, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
    'textOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 300.ms),
        FadeEffect(
          curve: Curves.elasticOut,
          delay: 300.ms,
          duration: 900.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.elasticOut,
          delay: 300.ms,
          duration: 900.ms,
          begin: Offset(71, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
    'textOnPageLoadAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 400.ms),
        FadeEffect(
          curve: Curves.elasticOut,
          delay: 400.ms,
          duration: 900.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.elasticOut,
          delay: 400.ms,
          duration: 900.ms,
          begin: Offset(71, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
    'rowOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 650.ms),
        FadeEffect(
          curve: Curves.elasticOut,
          delay: 650.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.elasticOut,
          delay: 650.ms,
          duration: 600.ms,
          begin: Offset(-74, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
    'imageOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 50.ms),
        FadeEffect(
          curve: Curves.elasticOut,
          delay: 50.ms,
          duration: 900.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.elasticOut,
          delay: 50.ms,
          duration: 900.ms,
          begin: Offset(71, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
    'textOnPageLoadAnimation6': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 300.ms),
        FadeEffect(
          curve: Curves.elasticOut,
          delay: 300.ms,
          duration: 900.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.elasticOut,
          delay: 300.ms,
          duration: 900.ms,
          begin: Offset(71, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
    'textOnPageLoadAnimation7': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 400.ms),
        FadeEffect(
          curve: Curves.elasticOut,
          delay: 400.ms,
          duration: 900.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.elasticOut,
          delay: 400.ms,
          duration: 900.ms,
          begin: Offset(71, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
    'buttonOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 550.ms),
        FadeEffect(
          curve: Curves.elasticOut,
          delay: 550.ms,
          duration: 900.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.elasticOut,
          delay: 550.ms,
          duration: 900.ms,
          begin: Offset(-79, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
    'rowOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 650.ms),
        FadeEffect(
          curve: Curves.elasticOut,
          delay: 650.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.elasticOut,
          delay: 650.ms,
          duration: 600.ms,
          begin: Offset(-74, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
    'iconButtonOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 600.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 600.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 600.ms,
          duration: 600.ms,
          begin: Offset(66, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
    'iconButtonOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 600.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 600.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 600.ms,
          duration: 600.ms,
          begin: Offset(-51, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
  };


  // late SplashModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  // T createModel<T>(BuildContext context, T Function() create) {
  //   return Provider.of<T>(
  //         context,
  //         listen: false,
  //       ) ??
  //       create();
  // }

  T createModel<T>(BuildContext context, T Function() create) {
    return Provider.of<T>(context, listen: false) ?? create();
  }

  // void setupAnimations(Iterable<AnimationInfo> animations, Object context) {
  //   // Iterate over the animations and set them up
  //   for (final animation in animations) {
  //     // Check the trigger and apply the animation accordingly
  //     if (animation.trigger == AnimationTrigger.onActionTrigger) {
  //       // Apply the animation effects
  //       for (final effect in animation.effects) {
  //         // Set up the effect based on its type
  //         if (effect is VisibilityEffect) {
  //           // Handle VisibilityEffect
  //           // ...
  //         } else if (effect is FadeEffect) {
  //           // Handle FadeEffect
  //           // ...
  //         } else if (effect is MoveEffect) {
  //           // Handle MoveEffect
  //           // ...
  //         }
  //       }
  //     }
  //   }
  // }
  PageController? pageViewController;
  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  // @override
  // void initState() {
  //   super.initState();
  //   _model = createModel(context, () => SplashModel());

  //   // setupAnimations(
  //   //   animationsMap.values
  //   //       .where((anim) => anim.trigger == AnimationTrigger.onActionTrigger),
  //   //   this,
  //   // );
  // }

  // @override
  // void dispose() {
  //   _model.dispose();

  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          alignment: AlignmentDirectional(0, 0),
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                children: [
                  PageView(
                    controller: pageViewController ??=
                        PageController(initialPage: 0),
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: Stack(
                          alignment: AlignmentDirectional(0, 0),
                          children: [
                            Image.asset(
                              'assets/onboard/image_001.png',
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      40, 0, 40, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Image.asset(
                                        'assets/images/logo.png',
                                        width: 50,
                                        height: 50,
                                        fit: BoxFit.cover,
                                      ).animateOnPageLoad(animationsMap[
                                          'imageOnPageLoadAnimation1']!),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 0, 0, 0),
                                        child: Text(
                                          'MY HOSTEL',
                                          style: TextStyle(
                                            fontFamily: 'Brazila',
                                            color: Colors.white,
                                            fontSize: 24,
                                          )
                                          //  FlutterFlowTheme.of(context)
                                          //     .bodyMedium
                                          //     .override(
                                          //       fontFamily: 'Brazila',
                                          //       color:
                                          //           FlutterFlowTheme.of(context)
                                          //               .primaryText,
                                          //       fontSize: 24,
                                          //       useGoogleFonts: false,
                                          //     )
                                          ,
                                        ).animateOnPageLoad(animationsMap[
                                            'textOnPageLoadAnimation1']!),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      40, 0, 40, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Text('FIND \nPROBLEM',
                                                    style: TextStyle(
                                                      fontFamily: 'Brazila',
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 38,
                                                    )
                                                    // FlutterFlowTheme.of(context)
                                                    //     .bodyMedium
                                                    //     .override(
                                                    //       fontFamily: 'Brazila',
                                                    //       color:
                                                    //           FlutterFlowTheme.of(
                                                    //                   context)
                                                    //               .primaryText,
                                                    //       fontSize: 38,
                                                    //       fontWeight:
                                                    //           FontWeight.normal,
                                                    //       useGoogleFonts: false,
                                                    //       lineHeight: 1.3,
                                                    //     ),
                                                    )
                                                .animateOnPageLoad(animationsMap[
                                                    'textOnPageLoadAnimation2']!),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 40, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                      'Find the problems yoy are facing in your hostel',
                                                      strutStyle: StrutStyle(
                                                          height: 1.2),
                                                      style: TextStyle(
                                                        fontFamily: 'Brazila',
                                                        color: Colors.white,
                                                        wordSpacing: 1,
                                                        fontSize: 16,
                                                      ))
                                                  .animateOnPageLoad(animationsMap[
                                                      'textOnPageLoadAnimation3']!),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      40, 0, 40, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          // Expanded(
                                          //   child: FFButtonWidget(
                                          //     onPressed: () async {
                                          //       await Navigator
                                          //           .pushAndRemoveUntil(
                                          //         context,
                                          //         PageTransition(
                                          //           type:
                                          //               PageTransitionType.fade,
                                          //           duration: Duration(
                                          //               milliseconds: 300),
                                          //           reverseDuration: Duration(
                                          //               milliseconds: 300),
                                          //           child: HomeWidget(),
                                          //         ),
                                          //         (r) => false,
                                          //       );
                                          //     },
                                          //     text: 'Sign up',
                                          //     options: FFButtonOptions(
                                          //       width: 130,
                                          //       height: 50,
                                          //       padding: EdgeInsetsDirectional
                                          //           .fromSTEB(0, 0, 0, 0),
                                          //       iconPadding:
                                          //           EdgeInsetsDirectional
                                          //               .fromSTEB(0, 0, 0, 0),
                                          //       color:
                                          //           FlutterFlowTheme.of(context)
                                          //               .primary,
                                          //       textStyle: TextStyle(
                                          //         fontFamily: 'Brazila',
                                          //         color: Colors.white,
                                          //         fontSize: 19,
                                          //       ),
                                          //       // FlutterFlowTheme.of(context)
                                          //       //     .titleSmall
                                          //       //     .override(
                                          //       //       fontFamily: 'Brazila',
                                          //       //       color: FlutterFlowTheme
                                          //       //               .of(context)
                                          //       //           .primaryBackground,
                                          //       //       fontSize: 19,
                                          //       //       fontWeight:
                                          //       //           FontWeight.normal,
                                          //       //       useGoogleFonts: false,
                                          //       //     ),
                                          //       elevation: 2,
                                          //       borderSide: BorderSide(
                                          //         color: Colors.transparent,
                                          //         width: 1,
                                          //       ),
                                          //       borderRadius:
                                          //           BorderRadius.circular(50),
                                          //     ),
                                          //   ).animateOnPageLoad(animationsMap[
                                          //       'buttonOnPageLoadAnimation1']!),
                                          // ),
                                          Expanded(
                                              child: GestureDetector(
                                            onTap: () async {
                                              // Navigator.pushNamed(
                                              //     context, logInScreenRoute);

                                              await Navigator
                                                  .pushAndRemoveUntil(
                                                context,
                                                PageTransition(
                                                  type: PageTransitionType.fade,
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  reverseDuration: Duration(
                                                      milliseconds: 300),
                                                  child: RegistrationScreen(),
                                                ),
                                                (r) => false,
                                              );
                                            },
                                            child: Container(
                                              width: 130,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: colors,
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                              alignment: Alignment.center,
                                              child: Text(
                                                'Sign up',
                                                style: TextStyle(
                                                  fontFamily: 'Brazila',
                                                  color: Colors.black,
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ).animateOnPageLoad(animationsMap[
                                                'buttonOnPageLoadAnimation1']!),
                                          )),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 16, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text('Already have account?',
                                                style: TextStyle(
                                                  fontFamily: 'Brazila',
                                                  color: Colors.white,
                                                )

                                                // FlutterFlowTheme.of(context)
                                                //     .bodyMedium
                                                //     .override(
                                                //       fontFamily: 'Brazila',
                                                //       color:
                                                //           FlutterFlowTheme.of(
                                                //                   context)
                                                //               .secondaryText,
                                                //       fontWeight:
                                                //           FontWeight.normal,
                                                //       useGoogleFonts: false,
                                                //     ),
                                                ),
                                            GestureDetector(
                                              onTap: () async {
                                                await Navigator
                                                    .pushAndRemoveUntil(
                                                  context,
                                                  PageTransition(
                                                    type:
                                                        PageTransitionType.fade,
                                                    duration: Duration(
                                                        milliseconds: 300),
                                                    reverseDuration: Duration(
                                                        milliseconds: 300),
                                                    child: LogInScreen(),
                                                  ),
                                                  (r) => false,
                                                );
                                              },
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(4, 0, 0, 0),
                                                child: Text('Log in',
                                                    style: TextStyle(
                                                      fontFamily: 'Brazila',
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    )
                                                    // FlutterFlowTheme.of(context)
                                                    //     .bodyMedium
                                                    //     .override(
                                                    //       fontFamily: 'Brazila',
                                                    //       fontWeight:
                                                    //           FontWeight.normal,
                                                    //       useGoogleFonts: false,
                                                    //     ),
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ).animateOnPageLoad(animationsMap[
                                            'rowOnPageLoadAnimation1']!),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: Stack(
                          alignment: AlignmentDirectional(0, 0),
                          children: [
                            Image.asset(
                              'assets/onboard/image_002.png',
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          40, 0, 40, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Image.asset(
                                            'assets/images/logo.png',
                                            width: 50,
                                            height: 50,
                                            fit: BoxFit.cover,
                                          ).animateOnPageLoad(animationsMap[
                                              'imageOnPageLoadAnimation2']!),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 10,
                                      height: 200,
                                      decoration: BoxDecoration(),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          40, 0, 40, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                        'POST YOUR COMPLAINTS',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Brazila',
                                                            color: Colors.white,
                                                            fontSize: 42,
                                                            fontWeight:
                                                                FontWeight.w500)
                                                        // FlutterFlowTheme.of(
                                                        //         context)
                                                        //     .bodyMedium
                                                        //     .override(
                                                        //       fontFamily: 'Brazila',
                                                        //       color:
                                                        //           FlutterFlowTheme.of(
                                                        //                   context)
                                                        //               .primaryText,
                                                        //       fontSize: 42,
                                                        //       fontWeight:
                                                        //           FontWeight.normal,
                                                        //       useGoogleFonts: false,
                                                        //       lineHeight: 1.3,
                                                        //     ),
                                                        )
                                                    .animateOnPageLoad(
                                                        animationsMap[
                                                            'textOnPageLoadAnimation4']!),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 16, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                      'FiLog in to your account and upload the problem you are facing',
                                                      strutStyle: StrutStyle(
                                                          height: 1.2),
                                                      style: TextStyle(
                                                        fontFamily: 'Brazila',
                                                        color: Colors.white,
                                                        wordSpacing: 1,
                                                        fontSize: 16,
                                                      )
                                                      //  FlutterFlowTheme.of(
                                                      //         context)
                                                      //     .bodyMedium
                                                      //     .override(
                                                      //       fontFamily: 'Brazila',
                                                      //       color: FlutterFlowTheme
                                                      //               .of(context)
                                                      //           .secondaryText,
                                                      //       fontWeight:
                                                      //           FontWeight.w500,
                                                      //       useGoogleFonts: false,
                                                      //       lineHeight: 1.3,
                                                      //     ),
                                                      ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation5']!),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          40, 36, 40, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 16, 0, 0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await Navigator
                                                    .pushAndRemoveUntil(
                                                  context,
                                                  PageTransition(
                                                    type:
                                                        PageTransitionType.fade,
                                                    duration: Duration(
                                                        milliseconds: 300),
                                                    reverseDuration: Duration(
                                                        milliseconds: 300),
                                                    child: LogInScreen(),
                                                  ),
                                                  (r) => false,
                                                );
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text('',
                                                      style: TextStyle(
                                                        fontFamily: 'Brazila',
                                                        color: Colors.white,
                                                      )
                                                      // FlutterFlowTheme.of(
                                                      //         context)
                                                      //     .bodyMedium
                                                      //     .override(
                                                      //       fontFamily: 'Brazila',
                                                      //       color: FlutterFlowTheme
                                                      //               .of(context)
                                                      //           .secondaryText,
                                                      //       fontWeight:
                                                      //           FontWeight.normal,
                                                      //       useGoogleFonts: false,
                                                      //     ),
                                                      ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                4, 0, 0, 0),
                                                    child: Text('',
                                                        style: TextStyle(
                                                          fontFamily: 'Brazila',
                                                          color: Colors.white,
                                                        )

                                                        // FlutterFlowTheme.of(
                                                        //         context)
                                                        //     .bodyMedium
                                                        //     .override(
                                                        //       fontFamily:
                                                        //           'Brazila',
                                                        //       fontWeight:
                                                        //           FontWeight
                                                        //               .normal,
                                                        //       useGoogleFonts:
                                                        //           false,
                                                        //     ),
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ).animateOnPageLoad(animationsMap[
                                                'rowOnPageLoadAnimation2']!),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: Stack(
                          alignment: AlignmentDirectional(0, 0),
                          children: [
                            Image.asset(
                              'assets/onboard/image_003.png',
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      40, 0, 40, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Image.asset(
                                        'assets/images/logo.png',
                                        width: 50,
                                        height: 50,
                                        fit: BoxFit.cover,
                                      ).animateOnPageLoad(animationsMap[
                                          'imageOnPageLoadAnimation3']!),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      40, 0, 40, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Text(
                                                    'BE SMART \nSOLVE PROBLEM',
                                                    style: TextStyle(
                                                      fontFamily: 'Brazila',
                                                      color: Colors.white,
                                                      fontSize: 36,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    )

                                                    // FlutterFlowTheme.of(context)
                                                    //     .bodyMedium
                                                    //     .override(
                                                    //       fontFamily: 'Brazila',
                                                    //       color:
                                                    //           FlutterFlowTheme.of(
                                                    //                   context)
                                                    //               .primaryText,
                                                    //       fontSize: 36,
                                                    //       fontWeight:
                                                    //           FontWeight.normal,
                                                    //       useGoogleFonts: false,
                                                    //       lineHeight: 1.3,
                                                    //     ),
                                                    )
                                                .animateOnPageLoad(animationsMap[
                                                    'textOnPageLoadAnimation6']!),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 24, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                  'Thats it! your problem will be shown to the management and will be solved soon',
                                                  strutStyle:
                                                      StrutStyle(height: 1.2),
                                                  style: TextStyle(
                                                    fontFamily: 'Brazila',
                                                    color: Colors.white,
                                                    wordSpacing: 1,
                                                    fontSize: 16,
                                                  )

                                                  // FlutterFlowTheme.of(context)
                                                  //     .bodyMedium
                                                  //     .override(
                                                  //       fontFamily: 'Brazila',
                                                  //       color: FlutterFlowTheme
                                                  //               .of(context)
                                                  //           .secondaryText,
                                                  //       fontWeight:
                                                  //           FontWeight.w300,
                                                  //       useGoogleFonts: false,
                                                  //       lineHeight: 1.3,
                                                  //     ),
                                                  ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation7']!),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      40, 0, 40, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          // Expanded(
                                          //   child: FFButtonWidget(
                                          //     onPressed: () async {
                                          //       await Navigator
                                          //           .pushAndRemoveUntil(
                                          //         context,
                                          //         PageTransition(
                                          //           type:
                                          //               PageTransitionType.fade,
                                          //           duration: Duration(
                                          //               milliseconds: 300),
                                          //           reverseDuration: Duration(
                                          //               milliseconds: 300),
                                          //           child: HomeWidget(),
                                          //         ),
                                          //         (r) => false,
                                          //       );
                                          //     },
                                          //     text: 'Login',
                                          //     options: FFButtonOptions(
                                          //       width: 130,
                                          //       height: 50,
                                          //       padding: EdgeInsetsDirectional
                                          //           .fromSTEB(0, 0, 0, 0),
                                          //       iconPadding:
                                          //           EdgeInsetsDirectional
                                          //               .fromSTEB(0, 0, 0, 0),
                                          //       color: Colors.white,
                                          //       textStyle: TextStyle(
                                          //         fontFamily: 'Brazila',
                                          //         color: Colors.white,
                                          //         fontSize: 19,
                                          //         fontWeight: FontWeight.normal,
                                          //       ),
                                          //       // FlutterFlowTheme.of(context)
                                          //       // .titleSmall
                                          //       // .override(
                                          //       //   fontFamily: 'Brazila',
                                          //       //   color: FlutterFlowTheme
                                          //       //           .of(context)
                                          //       //       .primaryBackground,
                                          //       //   fontSize: 19,
                                          //       //   fontWeight:
                                          //       //       FontWeight.normal,
                                          //       //   useGoogleFonts: false,
                                          //       // ),
                                          //       elevation: 2,
                                          //       borderSide: BorderSide(
                                          //         color: Colors.transparent,
                                          //         width: 1,
                                          //       ),
                                          //       borderRadius:
                                          //           BorderRadius.circular(50),
                                          //     ),
                                          //   ).animateOnPageLoad(animationsMap[
                                          //       'buttonOnPageLoadAnimation2']!),
                                          // ),

                                          Expanded(
                                              child: GestureDetector(
                                            onTap: () async {
                                              // Navigator.pushNamed(
                                              //     context, logInScreenRoute);

                                              await Navigator
                                                  .pushAndRemoveUntil(
                                                context,
                                                PageTransition(
                                                  type: PageTransitionType.fade,
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  reverseDuration: Duration(
                                                      milliseconds: 300),
                                                  child: LogInScreen(),
                                                ),
                                                (r) => false,
                                              );
                                            },
                                            child: Container(
                                              width: 130,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: colors,
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                              alignment: Alignment.center,
                                              child: Text(
                                                'Login',
                                                style: TextStyle(
                                                  fontFamily: 'Brazila',
                                                  color: Colors.black,
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ).animateOnPageLoad(animationsMap[
                                                'buttonOnPageLoadAnimation1']!),
                                          )),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 16, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text('Don\'t have account?',
                                                style: TextStyle(
                                                  fontFamily: 'Brazila',
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.normal,
                                                )
                                                // FlutterFlowTheme.of(context)
                                                //     .bodyMedium
                                                //     .override(
                                                //       fontFamily: 'Brazila',
                                                //       color:
                                                //           FlutterFlowTheme.of(
                                                //                   context)
                                                //               .secondaryText,
                                                //       fontWeight:
                                                //           FontWeight.normal,
                                                //       useGoogleFonts: false,
                                                //     ),
                                                ),
                                            GestureDetector(
                                              onTap: () async {
                                                await Navigator
                                                    .pushAndRemoveUntil(
                                                  context,
                                                  PageTransition(
                                                    type:
                                                        PageTransitionType.fade,
                                                    duration: Duration(
                                                        milliseconds: 300),
                                                    reverseDuration: Duration(
                                                        milliseconds: 300),
                                                    child: RegistrationScreen(),
                                                  ),
                                                  (r) => false,
                                                );
                                              },
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(4, 0, 0, 0),
                                                child: Text('Sign up',
                                                    style: TextStyle(
                                                      fontFamily: 'Brazila',
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    )
                                                    // FlutterFlowTheme.of(context)
                                                    //     .bodyMedium
                                                    //     .override(
                                                    //       fontFamily: 'Brazila',
                                                    //       fontWeight:
                                                    //           FontWeight.normal,
                                                    //       useGoogleFonts: false,
                                                    //     ),
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ).animateOnPageLoad(animationsMap[
                                            'rowOnPageLoadAnimation3']!),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 1),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                      child: SmoothPageIndicator(
                        controller: pageViewController ??=
                            PageController(initialPage: 0),
                        count: 3,
                        axisDirection: Axis.horizontal,
                        onDotClicked: (i) async {
                          await pageViewController!.animateToPage(
                            i,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                        effect: ExpandingDotsEffect(
                          expansionFactor: 4,
                          spacing: 8,
                          radius: 16,
                          dotWidth: 8,
                          dotHeight: 8,
                          dotColor: Color(0xFF9E9E9E),
                          activeDotColor: colors,
                          paintStyle: PaintingStyle.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, 1),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(40, 0, 40, 12),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // FlutterFlowIconButton(
                    //   borderColor: Colors.transparent,
                    //   borderRadius: 8,
                    //   borderWidth: 1,
                    //   buttonSize: 45,
                    //   icon: FaIcon(
                    //     FontAwesomeIcons.longArrowAltLeft,
                    //     color: colors,
                    //     size: 14,
                    //   ),
                    //   onPressed: () async {
                    //     await _model.pageViewController?.previousPage(
                    //       duration: Duration(milliseconds: 300),
                    //       curve: Curves.ease,
                    //     );
                    //   },
                    // ).animateOnPageLoad(
                    //     animationsMap['iconButtonOnPageLoadAnimation1']!),

                    IconButton(
                      onPressed: () async {
                        await pageViewController?.previousPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      },
                      icon: FaIcon(
                        FontAwesomeIcons.longArrowAltLeft,
                        color: colors,
                        size: 14,
                      ),
                    ).animateOnPageLoad(
                        animationsMap['iconButtonOnPageLoadAnimation1']!),
                    // FlutterFlowIconButton(
                    //   borderColor: Colors.transparent,
                    //   borderRadius: 8,
                    //   borderWidth: 1,
                    //   buttonSize: 45,
                    //   icon: FaIcon(
                    //     FontAwesomeIcons.longArrowAltRight,
                    //     color: colors,
                    //     size: 14,
                    //   ),
                    //   onPressed: () async {
                    //     await _model.pageViewController?.nextPage(
                    //       duration: Duration(milliseconds: 300),
                    //       curve: Curves.ease,
                    //     );
                    //   },
                    // )
                    IconButton(
                      onPressed: () async {
                        await pageViewController?.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      },
                      icon: FaIcon(
                        FontAwesomeIcons.longArrowAltRight,
                        color: colors,
                        size: 14,
                      ),
                    ).animateOnPageLoad(
                        animationsMap['iconButtonOnPageLoadAnimation2']!),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
