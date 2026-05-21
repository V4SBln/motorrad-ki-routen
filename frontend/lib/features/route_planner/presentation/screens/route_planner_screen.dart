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
  String preference = "curvy";
  List<LatLng> routePoints = [];
  bool isLoading = false;

  final MapController mapController = MapController();

  Future<void> generateRoute() async {
    setState(() => isLoading = true);

    // Simulation (später echte Backend-Verbindung)
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      routePoints = [
        const LatLng(48.1351, 11.5820),
        const LatLng(47.9800, 11.4000),
        const LatLng(47.4925, 11.0960),
      ];
      isLoading = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('✅ KI-Route generiert! (Simulation)')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🏍️ Motorrad KI-Routenplaner'),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          // Eingabefelder
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: startCtrl,
                  decoration: const InputDecoration(
                    labelText: 'Startort',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: zielCtrl,
                  decoration: const InputDecoration(
                    labelText: 'Zielort',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  value: preference,
                  decoration: const InputDecoration(labelText: 'Fahrstil'),
                  items: const [
                    DropdownMenuItem(value: "curvy", child: Text("Kurvenreich & sportlich")),
                    DropdownMenuItem(value: "scenic", child: Text("Landschaftlich & aussichtsreich")),
                    DropdownMenuItem(value: "balanced", child: Text("Ausgewogen")),
                  ],
                  onChanged: (value) => setState(() => preference = value!),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: isLoading ? null : generateRoute,
                    child: isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text('KI-Route generieren', style: TextStyle(fontSize: 18)),
                  ),
                ),
              ],
            ),
          ),

          // Karte
          Expanded(
            child: FlutterMap(
              mapController: mapController,
              options: const MapOptions(
                initialCenter: LatLng(48.1351, 11.5820),
                initialZoom: 8,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                ),
                if (routePoints.isNotEmpty)
                  PolylineLayer(
                    polylines: [
                      Polyline(
                        points: routePoints,
                        color: Colors.orange,
                        strokeWidth: 6.0,
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
