import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:lustore/app/boot/config.dart';

final http.Client client = mockApi ? MockClient(_jsonResponse) : http.Client();

// Converte a rota em nome de arquivo: POST report/sale -> jsons/report_sale.post.json,
// com fallback para jsons/report_sale.json. Escritas sem arquivo respondem 200 com {}.
Future<http.Response> _jsonResponse(http.Request request) async {
  String path = request.url.toString().startsWith(url)
      ? request.url.toString().substring(url.length)
      : request.url.path;
  path = path.split('?').first.replaceAll(RegExp(r'^/+|/+$'), '').replaceAll('/', '_');
  final method = request.method.toLowerCase();

  for (final file in ['jsons/$path.$method.json', 'jsons/$path.json']) {
    try {
      return http.Response(await rootBundle.loadString(file), 200,
          headers: {'content-type': 'application/json; charset=utf-8'});
    } catch (_) {}
  }

  if (method != 'get') return http.Response('{}', 200);
  return http.Response('{"error": "jsons/$path.json não encontrado"}', 404);
}
