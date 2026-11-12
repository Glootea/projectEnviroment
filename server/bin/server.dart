import 'dart:developer';

import 'package:server/bd.dart';
import 'package:shared/shared.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';

import 'dart:convert';

void main() async {
  try {
    final database = AppDatabase();
    database.insertClient(); // Initialize your database here
    database.insertLaborant();

    var router = Router();
    router.post('/login', (Request request) async {
      var body = await request.readAsString();
      LoginReguest loginRequest = LoginReguest.fromJson(jsonDecode(body));
      log("${loginRequest.login} ${loginRequest.password}");
      final laborant = await database.findLaborant(
        loginRequest.login,
        loginRequest.password,
      );
      final client = await database.findClient(
        loginRequest.login,
        loginRequest.password,
      );
      if (client == null) {
        if (laborant == null) {
          return Response.forbidden('Invalid login or password');
        }
        return Response.ok(
          jsonEncode(
            LoginResponse(
              fio: laborant.fio,
              photoUrl: 'https://example.com/photo.jpg',
              role: "laborant",
            ).toJson(),
          ),
          headers: {'Content-Type': 'application/json'},
        );
      }
      return Response.ok(
        jsonEncode(
          LoginResponse(
            fio: client.name,
            photoUrl: 'https://example.com/photo.jpg',
            role: "client",
          ).toJson(),
        ),
        headers: {'Content-Type': 'application/json'},
      );
    });
    router.get('/count', (Request request) async {
      var body = await request.readAsString();
      final _ = CountRequest.fromJson(jsonDecode(body));
      final otvet = await database.countOrder();
      log("$otvet");
      return Response.ok(
        jsonEncode(CountResponse(count: otvet).toJson()),
        headers: {'Content-Type': 'application/json'},
      );
    });
    final app = const Pipeline()
        .addMiddleware(logRequests())
        .addHandler(router.call);

    final _ = await io.serve(app, 'localhost', 8080);
  } catch (e) {
    log(e.toString());
  }
}
