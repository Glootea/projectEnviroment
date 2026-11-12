import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared/shared.dart';

import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';

import 'package:yomu/yomu.dart';
import 'package:image/image.dart' as img;
import 'package:flutter/services.dart';
import 'package:shared/bd.dart';

void main() {
  runApp(MyApp());
}

class SaveLogin {
  static String myLogin = '';
  static String password = '';
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Наименование приложения",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginPage(title: 'Пункт приёма опасных отходов'),
    );
  }
}

class LabPage extends StatefulWidget {
  const LabPage({super.key, required this.title});

  final String title;

  @override
  State<LabPage> createState() => _LabPageState(); // 1 ЗАЧЕМ ЭТО НУЖНО 2 Зачем перед переменной _
}

class ClientPage extends StatefulWidget {
  const ClientPage({super.key, required this.title});

  final String title;

  @override
  State<ClientPage> createState() => _ClientPageState(); // 1 ЗАЧЕМ ЭТО НУЖНО 2 Зачем перед переменной _
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final dio = Dio();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Пункт приёма опасных отходов'),
            TextField(
              onChanged: (value) {
                setState(() {
                  SaveLogin.myLogin = value;
                });
              },
              decoration: InputDecoration(labelText: 'Введите логин'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Введите пароль'),
              obscureText: true,
              onChanged: (value) {
                setState(() {
                  SaveLogin.password = value;
                });
              },
            ),
            TextButton(
              onPressed: () async {
                try {
                  final response = await dio.post(
                    'http://localhost:8080/login',
                    data: jsonEncode(
                      LoginReguest(
                        login: SaveLogin.myLogin,
                        password: SaveLogin.password,
                      ).toJson(),
                    ),
                  );
                  final loginResponse = LoginResponse.fromJson(response.data);

                  log(
                    'FIO: ${loginResponse.fio}, Photo URL: ${loginResponse.photoUrl}, Role: ${loginResponse.role}',
                  );
                  if (context.mounted) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          if (loginResponse.role == 'laborant') {
                            return LabPage(title: 'Рабочая зона лаборанта');
                          } else if (loginResponse.role == 'client') {
                            // Navigate to the admin page
                            return Scaffold(
                              body: Center(
                                child: Text('Welcome, ${loginResponse.fio}!'),
                              ),
                            );
                          } else if (loginResponse.role == 'Admin') {
                            // Navigate to the admin page
                            return Scaffold(
                              body: Center(
                                child: Text('Welcome, ${loginResponse.fio}!'),
                              ),
                            );
                          } else {
                            // Handle other roles or show an error message
                            return Scaffold(
                              body: Center(
                                child: Text(
                                  'Access denied for role: ${loginResponse.role}',
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    );
                  }
                } on DioException catch (e) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Invalid login or password')),
                    );

                    log('Ошибка при выполнении запроса $e');
                  }
                }
                // Действие при нажатии на кнопку
              },
              child: Text('Войти'),
            ),
          ],
        ),
      ),
    );
  }
}

class _ClientPageState extends State<ClientPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Column(children: [Text('Рабочая зона клиента')])),
    );
  }
}

// Для этого есть Dialog, его можно показать через showDialog
Future<void> pageAddClient(BuildContext context) async {
  final result = await showDialog(
    context: context,
    builder: (context) => const ClientDialog(),
  );
  if (result == null) return;
  if (result is ClientData) {
    // отправить запрос о создании клиента на сервер
  }
}

class ClientDialog extends StatefulWidget {
  const new({super.key});

  @override
  State<ClientDialog> createState() => _ClientDialogState();
}

class _ClientDialogState extends State<ClientDialog> {
  var client = ClientData(
    password: '',
    name: '',
    login: '',
    birthday: '',
    email: '',
    phone: '',
    innEnterprise: '',
  );
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Добавить клиента'),
      content: SizedBox(
        width: 400,
        height: 600,
        // Column + SingleChildScrollView -> ListView
        child: ListView(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'ФИО'),
              onChanged: (value) => client = client.copyWith(name: value),
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(labelText: 'Дата рождения'),
              onChanged: (value) => client = client.copyWith(birthday: value),
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(labelText: 'Серия и номер паспорта'),
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(labelText: 'Номер телефона'),
              onChanged: (value) => client = client.copyWith(phone: value),
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
              onChanged: (value) => client = client.copyWith(email: value),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'название предприятия(для ЮЛ)',
              ),
              onChanged: (value) =>
                  client = client.copyWith(innEnterprise: value),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context, null);
          },
          child: const Text('Отмена'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context, client);
          },
          child: const Text('Добавить'),
        ),
      ],
    );
  }
}

class _LabPageState extends State<LabPage> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _numbercase = TextEditingController();

  @override
  void initState() async {
    final dio = Dio();
    final response = await dio.post(
      'http://localhost:8080/count',
      data: jsonEncode(CountRequest().toJson()),
    );
    final countResponse = CountResponse.fromJson(response.data);
    _numbercase.text = countResponse.count.toString();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _numbercase.dispose();
    super.dispose();
  }

  Future<void> picking() async {
    final file = await FilePicker.pickFile();

    if (file == null) {
      log('Пользователь отменил выбор файла');
      return;
    } else {
      final Uint8List imageBytes = await file.readAsBytes();

      log('Удалось получить доступ к файлу');

      await decoding(imageBytes);
    }
  }

  Future<void> decoding(Uint8List bytes) async {
    try {
      final image = img.decodeImage(bytes);
      if (image == null) {
        log('Не удалось прочитать изображение');
        return;
      }
      log('Размер: ${image.width} x ${image.height}');
      final rgba = image.convert(numChannels: 4);
      final qrImage = YomuImage.rgba(
        bytes: rgba.getBytes(order: img.ChannelOrder.rgba),
        width: image.width,
        height: image.height,
      );
      final result = Yomu.qrOnly.decode(qrImage);
      log('QR-код: ${result.text}');
      _controller.text = result.text;
    } catch (e) {
      log('Ошибка распознавания QR: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text('Пункт приёма опасных отходов'),
            Text('Рабочая зона лаборанта'),
            TextButton(
              onPressed: () async {
                await picking();
              },
              child: Text('Выбрать файл'),
            ),
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Введите код кейса'),
            ),
            TextField(controller: _numbercase),
          ],
        ),
      ),
    );
  }
}
