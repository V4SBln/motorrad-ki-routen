#!/bin/bash

echo "🏍️ Motorrad KI-Routenplaner wird erstellt..."

mkdir -p frontend/lib/core
mkdir -p frontend/lib/features/route_planner/presentation/screens

cat > README.md << 'EOF'
# 🏍️ Motorrad KI-Routenplaner

Flutter App mit Grok KI + Valhalla für Motorradfahrer.
EOF

cat > frontend/pubspec.yaml << 'EOF'
name: motorrad_ki_routenplaner
description: Motorrad KI Routenplaner
publish_to: 'none'
version: 1.0.0+1

environment:
  sdk: '>=3.2.0 <4.0.0'

dependencies:
  flutter:
    sdk: flutter
  flutter_map: ^7.0.0
  latlong2: ^0.9.0
  http: ^1.2.2
  gpx: ^2.0.0
  path_provider: ^2.1.4
  flutter_dotenv: ^5.1.0
  go_router: ^14.2.0

flutter:
  uses-material-design: true
EOF

cat > frontend/lib/main.dart << 'EOF'
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'core/router.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: '🏍️ Motorrad KI',
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
EOF

echo "✅ Projekt erfolgreich erstellt!"
ls -la#!/bin/bash

echo "🏍️ Motorrad KI-Routenplaner wird erstellt..."

# Ordner erstellen
mkdir -p frontend/lib/core
mkdir -p frontend/lib/features/route_planner/presentation/screens

# README
cat > README.md << 'EOF'
# 🏍️ Motorrad KI-Routenplaner

Flutter App mit Grok KI + Valhalla für Motorradfahrer.
EOF

# pubspec.yaml
cat > frontend/pubspec.yaml << 'EOF'
name: motorrad_ki_routenplaner
description: Motorrad KI Routenplaner
publish_to: 'none'
version: 1.0.0+1

environment:
  sdk: '>=3.2.0 <4.0.0'

dependencies:
  flutter:
    sdk: flutter
  flutter_map: ^7.0.0
  latlong2: ^0.9.0
  http: ^1.2.2
  gpx: ^2.0.0
  path_provider: ^2.1.4
  flutter_dotenv: ^5.1.0
  go_router: ^14.2.0

flutter:
  uses-material-design: true
EOF

# main.dart
cat > frontend/lib/main.dart << 'EOF'
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'core/router.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: '🏍️ Motorrad KI',
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
EOF

echo "✅ Fertig! Projekt wurde erstellt."
ls
# Zusätzliche wichtige Dateien

cat > frontend/lib/core/router.dart << 'EOF'
import 'package:go_router/go_router.dart';
import '../features/route_planner/presentation/screens/route_planner_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const RoutePlannerScreen()),
  ],
);
EOF

cat > frontend/lib/features/route_planner/presentation/screens/route_planner_screen.dart << 'EOF'
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
EOF

echo "✅ Erweiterung abgeschlossen!"
