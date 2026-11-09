import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'dart:math';
import 'package:yomu/yomu.dart';
import 'package:image/image.dart' as img;


void main() {
  runApp(MyApp());
  print('Hello, World!');
  final a = SaveLogin();
  final b = SaveLogin();
}

final TextEditingController _controller = TextEditingController();

class SaveLogin {
   static String MyLogin = '';
   static String password = '';
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Наименование приложения",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(title: 'Пункт приёма опасных отходов'),
    );
  }
}
class LabPage extends StatefulWidget{
  LabPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<LabPage> createState() => _LabPageState(); // 1 ЗАЧЕМ ЭТО НУЖНО 2 Зачем перед переменной _
}


class LoginPage extends StatefulWidget{
  LoginPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String MyLogin = '';
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
                  SaveLogin.MyLogin = value;
                });
              },
                decoration: InputDecoration(
                labelText: 'Введите логин',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Введите пароль',
              ),
              obscureText: true,
            ),
            TextButton(
              onPressed: () async {
                final response = await dio.post('http://localhost:8080/login', data:jsonEncode(LoginReguest(
                  login: SaveLogin.MyLogin,
                   password: SaveLogin.password).toJson()));
                   final loginResponse = LoginResponse.fromJson(response.data);
                   print('FIO: ${loginResponse.fio}, Photo URL: ${loginResponse.photoUrl}, Role: ${loginResponse.role}');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LabPage(title: 'Рабочая зона лаборанта')),
                );
                // Действие при нажатии на кнопку
              },
              child: Text('Войти'),
            ),


          ]
        )
      )
    );
  }


}

class _LabPageState extends State<LabPage> {
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
                    await Picking();
                  },
                  child: Text('Выбрать файл'),
                ),
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    labelText: 'Введите код кейса',
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Введите номер кейса',
                  ),
                )
              ] 
          )
      )
    );
  }
}

Future<void> Picking() async {
  final file = await FilePicker.pickFile();

  if (file == null) {
    print('Пользователь отменил выбор файла');
    return;
  } else{

  final Uint8List imageBytes = await file.readAsBytes();

  print('Удалось получить доступ к файлу');
  


  await Decoding(imageBytes);
  }
}


Future<void> Decoding(Uint8List bytes) async {
  try {
    final image = img.decodeImage(bytes);
    if (image == null) {
      print('Не удалось прочитать изображение');
      return;
    }
    print('Размер: ${image.width} x ${image.height}');
    final rgba = image.convert(numChannels: 4);
    final qrImage = YomuImage.rgba(
      bytes: rgba.getBytes(order: img.ChannelOrder.rgba),
      width: image.width,
      height: image.height,
    );
    final result = Yomu.qrOnly.decode(qrImage);
    print('QR-код: ${result.text}');
    _controller.text = result.text;
  } catch (e) {
    print('Ошибка распознавания QR: $e');
  }
}
