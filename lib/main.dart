import "package:flutter/material.dart";
import "package:pixelconquest/views/home_view.dart";
import "package:supabase_flutter/supabase_flutter.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
      url: "https://iuhyhmxtuvaitllpjael.supabase.co",
      anonKey:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Iml1aHlobXh0dXZhaXRsbHBqYWVsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDU0OTY1MTUsImV4cCI6MjAyMTA3MjUxNX0.q-EOAOj8TwUBENQTkJO0IzyStas0Hc4FY_9qjwt-Ww8");

  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeView(),
    );
  }
}
