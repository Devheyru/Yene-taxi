import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'firebase_options.dart';
import 'src/app.dart';

/// Centralized error logger that writes uncaught errors to Firestore.
Future<void> _logError(Object error, StackTrace stack) async {
  try {
    // Avoid heavy work if Firebase not initialized yet.
    if (Firebase.apps.isEmpty) return;
    await FirebaseFirestore.instance.collection('errorLogs').add({
      'error': error.toString(),
      'stack': stack.toString(),
      'timestamp': FieldValue.serverTimestamp(),
      'platform': defaultTargetPlatform.name,
      'flutterVersion':
          '${WidgetsBinding.instance.platformDispatcher.implicitView?.display.size}',
    });
  } catch (_) {
    // Swallow secondary logging failures to avoid recursive crashes.
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Load environment variables (.env) before Firebase init so keys are available early.
  await dotenv.load(fileName: '.env');
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Forward Flutter framework errors into the current Zone.
  FlutterError.onError = (FlutterErrorDetails details) {
    Zone.current.handleUncaughtError(
      details.exception,
      details.stack ?? StackTrace.empty,
    );
  };

  // PlatformDispatcher errors (asynchronous outside widget tree).
  PlatformDispatcher.instance.onError = (error, stack) {
    _logError(error, stack);
    return true; // Mark handled to prevent default crashing behavior.
  };

  runZonedGuarded(
    () {
      runApp(const ProviderScope(child: YeneTaxiApp()));
    },
    (error, stack) {
      _logError(error, stack);
    },
  );
}
