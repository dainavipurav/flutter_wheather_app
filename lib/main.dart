import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wheather_app/pages/home/home.dart';

void main() {
  runApp(
    const ProviderScope(
      child: Home(),
    ),
  );
}
