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
    database.insertData(); // Initialize your database here
    database.insertLaborant();

    final router = Router();
    router
      ..post('/login', (Request r) => handlePostLogin(r, database))
      ..post('/client', (Request r) => handleClientPost(r, database))
      ..get('/count', (Request r) => handleCountGet(database));

    router.get('/client/names', (Request request) async {
      final names = await database.findNameClient();
      final response = SeekFioResponse(names: names);
      log("$names");
      return Response.ok(
        jsonEncode(response.toJson()),
        headers: {'Content-Type': 'application/json'},
      );
    });
    router.get('/service/names', (Request request) async {
      final names = await database.findNameService();
      final response = SeekServiceResponse(names: names);
      log("$names");
      return Response.ok(
        jsonEncode(response.toJson()),
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

const defaultHeaders = {'Content-Type': 'application/json'};

Future<Response> handleCountGet(AppDatabase database) async {
  final otvet = await database.countOrder();
  log("$otvet");
  return Response.ok(
    jsonEncode(CountResponse(count: otvet).toJson()),
    headers: defaultHeaders,
  );
}

Future<Response> handleClientPost(Request request, AppDatabase database) async {
  var body = await request.readAsString();
  final createUserReguest = CreateUserRequest.fromJson(jsonDecode(body));
  log(
    '${createUserReguest.clientData.email} ${createUserReguest.clientData.nameEnterprise}',
  );
  database.insertNewClient(createUserReguest.clientData);

  return Response.ok(
    jsonEncode(CreateUserResponse().toJson()),
    headers: defaultHeaders,
  );
}

Future<Response> handlePostLogin(Request request, AppDatabase database) async {
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
      headers: defaultHeaders,
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
    headers: defaultHeaders,
  );
}
