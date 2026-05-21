import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class RoutePlannerScreen extends StatefulWidget {
  const RoutePlannerScreen({super.key});
  @override
  State<RoutePlannerScreen> createState() => _RoutePlannerScreenState();
}

class _RoutePlannerScreenState extends State<RoutePlannerScreen> {
  final startCtrl = TextEditingController(text: "München");
  final zielCtrl = TextEditingController(text: "Garmisch-Partenkirchen");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('🏍️ Motorrad KI-Routenplaner')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: startCtrl, decoration: const InputDecoration(labelText: 'Start')),
            TextField(controller: zielCtrl, decoration: const InputDecoration(labelText: 'Ziel')),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text("KI-Route generieren"),
            ),
            const Expanded(
              child: FlutterMap(
                options: MapOptions(initialCenter: LatLng(48.13, 11.58), initialZoom: 8),
                children: [TileLayer(urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png')],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
