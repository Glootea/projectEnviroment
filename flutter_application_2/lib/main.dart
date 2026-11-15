import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared/shared.dart';

import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yomu/yomu.dart';
import 'package:image/image.dart' as img;
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = SharedPreferencesAsync();
  final login = await prefs.getString('login');
  final role = await prefs.getString('role');

  Widget startPage = LoginPage(title: 'Пункт приёма опасных отходов');

  if (login != null && login.isNotEmpty) {
    if (role == 'laborant') {
      startPage = LabPage(title: 'Рабочая зона лаборанта');
    } else if (role == 'client') {
      startPage = ClientPage(title: 'зона клиента');
    }
  }
  runApp(MyApp(startPage: startPage));
}

class SaveLogin {
  static String myLogin = '';
  static String password = '';
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.startPage});

  @override
  final Widget startPage;
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: startPage,
    );
  }
}

class AccountStorage {
  final SharedPreferencesAsync prefs = SharedPreferencesAsync();
}

class LabPage extends StatefulWidget {
  const LabPage({super.key, required this.title});

  final String title;

  @override
  State<LabPage> createState() => _LabPageState(); // 1 ЗАЧЕМ ЭТО НУЖНО 2 Зачем перед переменной _
}

class BookerPage extends StatefulWidget {
  const BookerPage({super.key, required this.title});

  final String title;

  @override
  State<BookerPage> createState() => _BookerPageState();
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
  final prefs = SharedPreferencesAsync();
  Future<void> saveAccount(String login, String role) async {
    await prefs.setString('login', login);
    await prefs.setString('role', role);
  }

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
                  await saveAccount(SaveLogin.myLogin, loginResponse.role);

                  log(
                    'FIO: ${loginResponse.fio}, '
                    'Photo URL: ${loginResponse.photoUrl}, '
                    'Role: ${loginResponse.role}',
                  );
                  if (context.mounted) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          if (loginResponse.role == 'laborant') {
                            return LabPage(title: 'Рабочая зона лаборанта');
                          } else if (loginResponse.role == 'client') {
                            return Scaffold(
                              body: Center(
                                child: Text('Welcome, ${loginResponse.fio}!'),
                              ),
                            );
                          } else if (loginResponse.role == 'Admin') {
                            Future<void> saveAccount(
                              String login,
                              String role,
                            ) async {
                              await prefs.setString('login', login);
                              await prefs.setString('role', role);
                            }

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
  if (result is OurClient) {
    try {
      final dio = Dio();
      await dio.post(
        'http://localhost:8080/client',
        data: jsonEncode(CreateUserRequest(result).toJson()),
      );
    } catch (e) {
      log('Error adding client: $e');
    }
  }
}

class ClientDialog extends StatefulWidget {
  const new({super.key});

  @override
  State<ClientDialog> createState() => _ClientDialogState();
}

class ChoiceClientDialog extends StatefulWidget {
  const new({super.key, required this.names});

  final List<String> names;

  @override
  State<ChoiceClientDialog> createState() => _ChoiceClientDialogState();
}

class ChoiceServiceDialog extends StatefulWidget {
  const new({super.key, required this.names, required this.selected});

  final List<String> names;
  final List<String> selected;
  @override
  State<ChoiceServiceDialog> createState() => _ChoiceServiceDialogState();
}

class _ClientDialogState extends State<ClientDialog> {
  var client = OurClient(
    password: '',
    name: '',
    login: '',
    birthday: '',
    email: '',
    phone: '',
    nameEnterprise: '',
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
              onChanged: (value) => client.name = value,
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(labelText: 'Дата рождения'),
              onChanged: (value) => client.birthday = value,
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(labelText: 'Серия и номер паспорта'),
            ),
            SizedBox(height: 8),
            TextField(decoration: InputDecoration(labelText: 'Номер телефона')),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
              onChanged: (value) => client.email = value,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'название предприятия(для ЮЛ)',
              ),
              onChanged: (value) => client.nameEnterprise = value,
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

Future<String?> clientChoice(BuildContext context) async {
  try {
    final response = await Dio().get('http://localhost:8080/client/names');
    final result = SeekFioResponse.fromJson(response.data);

    if (!context.mounted) return null;

    final selectedName = await showDialog<String>(
      context: context,
      builder: (context) => ChoiceClientDialog(names: result.names),
    );

    if (selectedName != null) {
      log('Выбран клиент: $selectedName');
    }
    return selectedName;
  } catch (e) {
    log('Ошибка выбора клиента: $e');
    return null;
  }
}

Future<List<String>?> serviceChoice(
  BuildContext context,
  List<String> selectedServices,
) async {
  try {
    final response = await Dio().get('http://localhost:8080/service/names');
    final result = SeekServiceResponse.fromJson(response.data);

    if (!context.mounted) return null;

    return await showDialog<List<String>>(
      context: context,
      builder: (context) =>
          ChoiceServiceDialog(names: result.names, selected: selectedServices),
    );
  } catch (e) {
    log('Ошибка выбора услуг: $e');
    return null;
  }
}

class _ChoiceClientDialogState extends State<ChoiceClientDialog> {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('Выбери клиента'),
      children: widget.names.map((name) {
        return TextButton(
          onPressed: () => Navigator.pop(context, name),
          child: Text(name),
        );
      }).toList(),
    );
  }
}

class _ChoiceServiceDialogState extends State<ChoiceServiceDialog> {
  late final Set<String> _checked = widget.selected.toSet();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Выбери услуги'),
      scrollable: true,
      content: SizedBox(
        width: 320,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: widget.names.map((name) {
            return CheckboxListTile(
              title: Text(name),
              value: _checked.contains(name),
              onChanged: (checked) {
                setState(() {
                  if (checked == true) {
                    _checked.add(name);
                  } else {
                    _checked.remove(name);
                  }
                });
              },
            );
          }).toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Отмена'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, _checked.toList()),
          child: const Text('Готово'),
        ),
      ],
    );
  }
}

class _LabPageState extends State<LabPage> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _numbercase = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final dio = Dio();
      final response = await dio.get(
        'http://localhost:8080/count',
        data: jsonEncode(CountRequest().toJson()),
      );
      final countResponse = CountResponse.fromJson(response.data);
      _numbercase.text = countResponse.count.toString();
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _numbercase.dispose();
    super.dispose();
  }

  String? selectedName;
  List<String> selectedServices = [];
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
            TextButton(
              onPressed: () async {
                final prefs = SharedPreferencesAsync();
                await prefs.remove('login');
                await prefs.remove('role');

                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) =>
                        const LoginPage(title: "РАБОЧАЯ ЗОНА РЕГИСТАРЦИИ"),
                  ),
                );
              },
              child: Text('Выйти'),
            ),
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
            Text('КЛИЕНТ'),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final name = await clientChoice(context);
                    if (!mounted || name == null) return;
                    setState(() {
                      selectedName = name;
                    });
                  },
                  child: const Text('выбор клиента'),
                ),
                ElevatedButton(
                  onPressed: () {
                    pageAddClient(context);
                  },
                  child: Text('добавление нового клиента'),
                ),
              ],
            ),
            Text(selectedName ?? 'Клиент не выбран'),
            Text('УСЛУГИ'),
            ElevatedButton(
              onPressed: () async {
                final services = await serviceChoice(context, selectedServices);
                if (!mounted || services == null) return;

                setState(() {
                  selectedServices = services;
                });
              },
              child: const Text('Выбор услуг'),
            ),
            Text(
              selectedServices.isEmpty
                  ? 'Услуги не выбраны'
                  : selectedServices.join(', '),
            ),
            //ElevatedButton(onPressed: () {}, child: child)
          ],
        ),
      ),
    );
  }
}

class _BookerPageState extends State<BookerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
