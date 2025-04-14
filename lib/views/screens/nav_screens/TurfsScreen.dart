import 'package:flutter/material.dart';
import 'package:turfit/controllers/my_search_controller.dart';
import 'package:turfit/views/widgets/turf_vertical_list.dart';

class TurfsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
        ),
        // Wrap TurfVerticalList with Expanded to avoid layout issues
        Expanded(
          child: ValueListenableBuilder<String>(
            valueListenable: MySearchController.sportQuery,
            builder: (context, query, child) {
              return TurfVerticalList(initialQuery: query); // <-- Here!
            },
          ),
        ),
      ],
    );
  }
}
