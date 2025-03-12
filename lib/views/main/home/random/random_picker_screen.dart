import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:ppkd_b_1/controller/random_picker_provider.dart';
import 'package:ppkd_b_1/utils/constant/app_color.dart';
import 'package:ppkd_b_1/views/main/home/quiz/widgets/default_button.dart';
import 'package:provider/provider.dart';

class RandomPickerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final randomPicker = Provider.of<RandomPickerProvider>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text("Random Picker", style: TextStyle(color: Colors.white)),

        backgroundColor: AppColor.secondaryColor,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),

        child: Column(
          children: [
            // Nama yang sedang dipilih
            SizedBox(
              height: 250,
              child: Card(
                color: AppColor.secondaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: AnimatedSwitcher(
                          duration: Duration(milliseconds: 200),

                          child: Text(
                            randomPicker.selectedName,

                            key: ValueKey(randomPicker.selectedName),

                            textAlign: TextAlign.center,

                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            // Tombol memilih nama
            SizedBox(
              width: double.infinity,
              child: DefaultButton(
                backgroundColor: AppColor.primaryColor,
                text:
                    randomPicker.availableNames.isEmpty
                        ? "Semua nama sudah dipilih"
                        : randomPicker.isPicking
                        ? "Memilih..."
                        : "Pilih Nama",
                onPressed:
                    randomPicker.isPicking ||
                            randomPicker.availableNames.isEmpty
                        ? null
                        : randomPicker.pickRandomName,
              ),
            ),
            ConfettiWidget(
              confettiController: randomPicker.confettiController,
              // displayTarget: true,
              // gravity: 0.9,
              blastDirectionality:
                  BlastDirectionality.explosive, // Ledakan ke semua arah
              shouldLoop: false,
              colors: [
                AppColor.redColor,
                Colors.blue,
                AppColor.secondaryColor,
                AppColor.primaryColor,
              ],
            ),
            SizedBox(height: 10),

            // Tombol reset
            if (randomPicker.eliminatedNames.isNotEmpty)
              DefaultButton(
                backgroundColor: AppColor.redColor,
                text: "Reset",
                onPressed: randomPicker.resetPicker,
              ),

            SizedBox(height: 20),

            // Daftar nama yang sudah dipilih
            Expanded(
              child:
                  randomPicker.eliminatedNames.isEmpty
                      ? Container()
                      : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(
                            "Nama yang sudah dipilih:",

                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Expanded(
                            child: ListView.builder(
                              itemCount: randomPicker.eliminatedNames.length,

                              itemBuilder: (context, index) {
                                List<String> listName = List.from(
                                  randomPicker.eliminatedNames.reversed,
                                );

                                return ListTile(
                                  contentPadding: EdgeInsets.all(0),
                                  leading: CircleAvatar(
                                    backgroundColor: AppColor.secondaryColor,
                                    child: Text(
                                      "${index + 1}",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),

                                  title: Text(listName[index]),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
