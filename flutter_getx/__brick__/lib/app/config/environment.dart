import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get fileName => kReleaseMode
      ? "env/env.prod"
      : "env/env.dev";

  static String get baseUrl => dotenv.env["BASE_URL"] ?? "NA";

  static String get version => dotenv.env['VERSION'] ?? 'N/A';

  static String get service => dotenv.env['SERVICE_NAME'] ?? 'N/A';

  static String? get connectionTimeout => dotenv.env['CONNECTION_TIMEOUT'] ?? null;

  static String? get receiveTimeout => dotenv.env['RECEIVE_TIMEOUT'] ?? null;


}
