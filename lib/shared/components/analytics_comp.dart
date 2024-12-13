import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../widgets/gantchart.dart';
import '../widgets/line_charts.dart'; // Make sure this is correct
import '../widgets/scarttered_chart.dart'; // Make sure this is correct

class AnalyticsComp extends StatelessWidget {
  final String? title;
  final String? description;
  final String? buttonText;
  final VoidCallback? onPressed;

  const AnalyticsComp({
    this.title,
    this.description,
    this.buttonText,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Container(
        //   width: MediaQuery.of(context).size.width * 0.91,
        //   decoration: BoxDecoration(
        //     color: Colors.white,
        //     borderRadius: BorderRadius.circular(2),
        //   ),
        //   margin: EdgeInsets.zero,
        //   child: ConstrainedBox(
        //     constraints: BoxConstraints(maxHeight: 350.0),
        //     child: Gantchart(),
        //   ),
        // ),
        Container(
          width: MediaQuery.of(context).size.width * 0.91,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(2),
          ),
          margin: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (title != null)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title!,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const Icon(
                        Ionicons.filter_outline,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 350.0),
                  child: LineGraph(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
