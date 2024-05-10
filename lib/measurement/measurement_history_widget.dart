import 'package:actdata/app_state.dart';
import 'package:actdata/backend/api_requests/api_calls.dart';
import 'package:flutter/material.dart';

class MeasurementHistoryWidget extends StatefulWidget {
  const MeasurementHistoryWidget({super.key});

  @override
  State<MeasurementHistoryWidget> createState() =>
      _MeasurementHistoryWidgetState();
}

class _MeasurementHistoryWidgetState extends State<MeasurementHistoryWidget> {
  Future<ApiCallResponse> getMeasurementHistory() async {
    Future.delayed(const Duration(minutes: 1));
    return GetMeasurementHistory.call(
      token: FFAppState().userAuthToken,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 20),
          child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 0.5, color: Colors.black38),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "24.01.2024\n21:48:04",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "RobotoFlex",
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "90 уд/м",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: "RobotoFlex",
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
