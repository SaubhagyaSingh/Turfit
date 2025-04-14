import 'package:flutter/material.dart';
import '../env/turf_data.dart';
import 'turf_card.dart';

class TurfVerticalList extends StatefulWidget {
  @override
  State<TurfVerticalList> createState() => _TurfVerticalListState();
}

class _TurfVerticalListState extends State<TurfVerticalList> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> filteredServices = turfServices;

  void _filterTurfs(String query) {
    setState(() {
      filteredServices = turfServices.where((service) {
        final name = service['name'].toString().toLowerCase();
        final cost = service['cost'].toString().toLowerCase();
        final timings = service['timings'].toString().toLowerCase();
        final days = service['days'].toString().toLowerCase();
        final q = query.toLowerCase();

        // Check if query matches name, cost, timings, or days
        return name.contains(q) ||
            cost.contains(q) ||
            timings.contains(q) ||
            days.contains(q);
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
            controller: _controller,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: "Search by name, cost, time, or days",
              hintStyle: TextStyle(color: Colors.white70),
              filled: true,
              fillColor: Colors.white12,
              prefixIcon: Icon(Icons.search, color: Colors.white),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: _filterTurfs,
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
