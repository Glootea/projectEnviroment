import 'package:server/bd1.dart';
import 'package:shared/shared.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';
import 'dart:convert';


void main() async {
  try{

  
  final database = AppDatabase();
  database.insertClient(); // Initialize your database here
  var router = Router();
  router.post('/login', (Request request) async {
    var body = await request.readAsString();
    LoginReguest loginRequest = LoginReguest.fromJson(jsonDecode(body));
    print("${loginRequest.login} ${loginRequest.password}");
    final client = await database.findClient(loginRequest.login, loginRequest.password);
    if (client == null) {
      return Response.forbidden('Invalid login or password');
    }
    return Response.ok(jsonEncode(LoginResponse(fio: client.name, photoUrl: 'https://example.com/photo.jpg', role: "client").toJson()),
        headers: {'Content-Type': 'application/json', 'Access-Control-Allow-Origin': '*'});
  });
final app = const Pipeline()
  .addMiddleware(logRequests())
  .addHandler(router);

var server = await io.serve(app, 'localhost', 8080);
  }catch (e) {
    print(e);
  }
}


