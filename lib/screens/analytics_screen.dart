import 'package:flutter/material.dart';
import 'package:malaria_survillance_app/shared/components/card.dart';
import '../shared/components/analytics_comp.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key}); // Add key for immutability

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: 15.0, top: 8),
                child: CardComponent(
                  title: 'Malaria Surveillance Data',
                  description:
                      'A detailed path overview and analysis based on recent malaria surveillance data.',
                  buttonText: 'Click Me',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0, top: 8),
                child: AnalyticsComp(
                  title: 'View Analytics',
                  description:
                      'A detailed path overview and analysis based on recent malaria surveillance data.',
                  buttonText: 'Click Me',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
