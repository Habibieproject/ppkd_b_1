
import 'package:flutter/material.dart';
import 'package:ppkd_b_1/data/grid_data.dart';

class GridviewScreen extends StatelessWidget {
  const GridviewScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemCount: gridData.length,
      itemBuilder: (BuildContext context, int index) {
        final data = gridData[index];
        return Container(
          color: data.color,
          child: Center(
            child: Text(
              data.name,
              style: TextStyle(fontSize: 20),
            ),
          ),
        );
      },
    );
  }
}