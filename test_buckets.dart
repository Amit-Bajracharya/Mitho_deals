import 'dart:io';
import 'package:supabase/supabase.dart';

void main() async {
  final envFile = File('.env');
  final lines = envFile.readAsLinesSync();
  String url = '';
  String key = '';
  for (final line in lines) {
    if (line.startsWith('PROJECT_URL=')) url = line.substring('PROJECT_URL='.length).trim();
    if (line.startsWith('API_KEY=')) key = line.substring('API_KEY='.length).trim();
  }
  
  if (url.startsWith('"')) url = url.substring(1, url.length - 1);
  if (key.startsWith('"')) key = key.substring(1, key.length - 1);

  final client = SupabaseClient(url, key);
  try {
    final buckets = await client.storage.listBuckets();
    print('Buckets found:');
    for (final b in buckets) {
      print(' - ${b.name}');
    }
  } catch (e) {
    print('Error listing buckets: $e');
  }
}
