import 'package:actdata/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20, top: 120),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "ЧСС",
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.w400,
                  fontFamily: "RobotoFlex",
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 56,
                child: FFButtonWidget(
                  onPressed: () async {
                    if (isActive) {
                      await Future.delayed(const Duration(seconds: 1));
                      isActive = false;
                    } else {
                      isActive = true;
                    }
                    setState(() {});
                  },
                  text: 'Начать замер',
                  options: const FFButtonOptions(
                    width: double.infinity,
                    height: double.infinity,
                    color: Color(0xff4295E4),
                    elevation: 0,
                    textStyle: TextStyle(
                      fontFamily: 'SF',
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
