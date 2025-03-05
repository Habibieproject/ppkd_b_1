import 'package:flutter/material.dart';

class DetailQuizScreen extends StatelessWidget {
  const DetailQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      child: Row(
                        children: [
                          Icon(Icons.arrow_back_ios, size: 12),
                          Text(
                            "Previous",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    "7/10",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Expanded(child: SizedBox()),
                ],
              ),
              Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.only(top: 75),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    width: double.infinity,
                    height: 229,
                    child: Center(
                      child: Text(
                        "Tahun berapa saat ini?",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              height: 85,
                              width: 85,
                              child: CircularProgressIndicator(
                                value: 0.5,
                                strokeWidth: 8,
                                backgroundColor: Color(0xffABD1C6),
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Color(0xff004643),
                                ),
                              ),
                            ),
                            Text(
                              "30",
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w600,

                                color: Color(0xff004643),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
