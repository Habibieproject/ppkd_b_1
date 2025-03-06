import 'package:flutter/material.dart';
import 'package:ppkd_b_1/utils/constant/app_color.dart';
import 'package:ppkd_b_1/views/main/home/quiz/widgets/default_button.dart';

class DetailQuizScreen extends StatefulWidget {
  const DetailQuizScreen({super.key});

  @override
  State<DetailQuizScreen> createState() => _DetailQuizScreenState();
}

class _DetailQuizScreenState extends State<DetailQuizScreen> {
  int selected = -1;
  List<int> options = [2000, 2025, 2024, 2023];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEFF0F3),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildHeader(context),
              _buildCardQuestion(),
              SizedBox(height: 40),
              Expanded(child: _buildOption()),
              DefaultButton(
                backgroundColor: AppColor.secondaryColor,
                text: "Next",
                onPressed: () {},
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  ListView _buildOption() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: options.length,
      itemBuilder: (BuildContext context, int index) {
        int option = options[index];
        bool isSelected = selected == index;
        return GestureDetector(
          onTap: () {
            setState(() {
              selected = index;
            });
            print("Selected: $selected");
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: isSelected ? Color(0xffABD1C6) : Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  option.toString(),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Icon(
                    isSelected ? Icons.check_circle : Icons.circle_outlined,
                    color: AppColor.secondaryColor,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Stack _buildCardQuestion() {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.only(top: 75),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha((255.0 * 0.15).round()),
                // Colors.black.withOpacity(0.15),
                spreadRadius: -10,
                blurRadius: 50,
                offset: Offset(0, 20),
              ),
            ],
          ),
          width: double.infinity,
          height: 229,
          child: Center(
            child: Text(
              "Tahun berapa saat ini?",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
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
                        AppColor.secondaryColor,
                      ),
                    ),
                  ),
                  Text(
                    "30",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,

                      color: AppColor.secondaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row _buildHeader(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  Icon(Icons.arrow_back_ios, size: 12),
                  Text(
                    "Previous",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        ),
        Text(
          "7/10",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        Expanded(child: SizedBox()),
      ],
    );
  }
}
