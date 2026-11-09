import 'package:shared/shared.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';
import 'dart:convert';


void main() async {
  var router = Router();
  router.post('/login', (Request request) async {
    var body = await request.readAsString();
    LoginReguest loginRequest = LoginReguest.fromJson(jsonDecode(body));
    return Response.ok(jsonEncode(LoginResponse(fio: 'John Doe', photoUrl: 'https://example.com/photo.jpg', role: 'admin').toJson()),
        headers: {'Content-Type': 'application/json'});
  });
final app = const Pipeline()
  .addMiddleware(logRequests())
  .addHandler(router);

var server = await io.serve(app, 'localhost', 8080);
}


