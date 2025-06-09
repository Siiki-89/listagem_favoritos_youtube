import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';
import 'youtube_api.dart';

// Configure routes.
final _router = Router()..get('/video/<id>', _getVideoData);

// Listar países para selecionar
Future<Response> _getVideoData(Request request) async {
  try {
    final videoID = request.params['id']?.trim();
    if (videoID == null || videoID.isEmpty) {
      return Response.badRequest();
    }
    final data = await YouTubeAPI.fetchVideoData(videoID);
    return Response.ok(
      jsonEncode(data.toMap()),
      headers: {'Content-Type': 'application/json'},
    );
  } on FailedRequestException catch (e) {
    return Response.badRequest();
  } on Exception catch (e, trace) {
    print('Exception: $e\n$trace');
    return Response.internalServerError();
  }
}

Future<void> main(List<String> args) async {
  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  // Configure a pipeline that logs requests.
  final handler = Pipeline().addHandler(_router.call);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '8888');
  final server = await serve(handler, ip, port);

  print('Server listening on port ${server.port}');
}
