import 'package:flutter/material.dart';
import '../env/turf_data.dart';
import 'turf_card.dart';

class TurfVerticalList extends StatefulWidget {
  final String initialQuery; // Expecting the query here

  const TurfVerticalList({Key? key, required this.initialQuery})
      : super(key: key); // <-- Constructor expects this!

  @override
  State<TurfVerticalList> createState() => _TurfVerticalListState();
}

class _TurfVerticalListState extends State<TurfVerticalList> {
  late TextEditingController _searchController; // Marked as late
  late List<Map<String, dynamic>> filteredServices;

  @override
  void initState() {
    super.initState();
    // Initialize the controller and the filtered list
    _searchController = TextEditingController(text: widget.initialQuery);
    filteredServices = turfServices; // Initialize with all services
    _filterTurfs(
        widget.initialQuery); // Filter turfs based on the initial query
  }

  // This method will be called every time the parent widget updates the query
  @override
  void didUpdateWidget(covariant TurfVerticalList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialQuery != oldWidget.initialQuery) {
      _searchController.text =
          widget.initialQuery; // Update the text field value
      _filterTurfs(
          widget.initialQuery); // Filter turfs again if the query changes
    }
  }

  void _filterTurfs(String query) {
    setState(() {
      filteredServices = turfServices.where((service) {
        final name = service['name'].toString().toLowerCase();
        final cost = service['cost'].toString().toLowerCase();
        final timings = service['timings'].toString().toLowerCase();
        final days = service['days'].toString().toLowerCase();
        final sports = (service['sports'] as List<dynamic>)
            .map((sport) => sport.toString().toLowerCase())
            .toList();
        final q = query.toLowerCase();

        return name.contains(q) ||
            cost.contains(q) ||
            timings.contains(q) ||
            days.contains(q) ||
            sports.any((sport) => sport.contains(q));
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Search bar
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            controller: _searchController,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: "Search by name, cost, time, days, or sports",
              hintStyle: TextStyle(color: Colors.white70),
              filled: true,
              fillColor: Colors.white12,
              prefixIcon: Icon(Icons.search, color: Colors.white),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: _filterTurfs, // Trigger filtering on text change
          ),
        ),

        // List of filtered turf cards
        Expanded(
          child: ListView.builder(
            itemCount: filteredServices.length,
            padding: EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (context, index) {
              return TurfCard(service: filteredServices[index]);
            },
          ),
        ),
      ],
    );
  }
}
