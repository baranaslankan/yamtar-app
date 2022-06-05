import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class Animation_Screen extends StatefulWidget {
  const Animation_Screen({ Key? key }) : super(key: key);

  @override
  State<Animation_Screen> createState() => _Animation_ScreenState();
}

class _Animation_ScreenState extends State<Animation_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              tileMode: TileMode.mirror,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xffff7700),
                Color(0xff0a4f88),
              ],
              stops: [
                0,
                1,
              ],
            ),
            backgroundBlendMode: BlendMode.srcOver,
          ),
          child: Stack(
            children:[
               PlasmaRenderer(
              type: PlasmaType.infinity,
              particles: 10,
              color: Color(0x44f78831),
              blur: 0.31,
              size: 1,
              speed: 2,
              offset: 0,
              blendMode: BlendMode.plus,
              particleType: ParticleType.atlas,
              variation1: 0,
              variation2: 0,
              variation3: 0,
              rotation: 0,
            ),
              Center(
                child: AnimatedTextKit(
                  animatedTexts: [
                    RotateAnimatedText('Hello',textStyle: const TextStyle(fontSize: 32,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 255, 255, 255))),
                    RotateAnimatedText('Welcome to',textStyle: const TextStyle(fontSize: 32,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 255, 255, 255))),
                    RotateAnimatedText('YAMTAR APP',textStyle: const TextStyle(fontSize: 32,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 255, 255, 255))),
                    RotateAnimatedText('Click to continue',textStyle: const TextStyle(fontSize: 32,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 255, 255, 255))),
                  ],
                  totalRepeatCount: 1,
                  pause: const Duration(milliseconds: 2000),
                  stopPauseOnTap: true,
                ),
              ),],
          ),
        ),
          onTap: () async{
            Navigator.of(context).pushReplacementNamed('/log_in');
          }
      ),
    );
  }
}