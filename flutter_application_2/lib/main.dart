import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'dart:math';
import 'package:yomu/yomu.dart';
import 'package:image/image.dart' as img;
import 'package:flutter/services.dart';
import 'package:barcode_widget/barcode_widget.dart';

void main() {
  runApp(MyApp());
  print('Hello, World!');
  final a = SaveLogin();
  final b = SaveLogin();
}


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

class ClientPage extends StatefulWidget{
  ClientPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ClientPage> createState() => _ClientPageState(); // 1 ЗАЧЕМ ЭТО НУЖНО 2 Зачем перед переменной _
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
               onChanged: (value) {
                setState(() {
                  SaveLogin.password = value;
                });
              },
            ),
            TextButton(
              onPressed: () async {
                try{
                final response = await dio.post('http://localhost:8080/login', data:jsonEncode(LoginReguest(
                  login: SaveLogin.MyLogin,
                   password: SaveLogin.password).toJson()));
                   final loginResponse = LoginResponse.fromJson(response.data);
                   
                   print('FIO: ${loginResponse.fio}, Photo URL: ${loginResponse.photoUrl}, Role: ${loginResponse.role}');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
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

                    }
                    else {
                      // Handle other roles or show an error message
                      return Scaffold(
                        body: Center(
                          child: Text('Access denied for role: ${loginResponse.role}'),
                        ),
                      );
                    }
                    return LabPage(title: 'Рабочая зона лаборанта');
                  }),
                
                );
                
                }
                 on DioException catch (e) {
              
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Invalid login or password')),
                    );
                  print('Ошибка при выполнении запроса $e');
                  }

                
                
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
class _ClientPageState extends State<ClientPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
              children: [
                Text('Рабочая зона клиента'),
                
                
              ] 
          )
      )
    );
  }
}

class _LabPageState extends State<LabPage> {

  final TextEditingController _controller = TextEditingController();
  final TextEditingController _numbercase = TextEditingController();



@override
  void initState() async {
    final dio = Dio();
    final response = await dio.post('http://localhost:8080/count', data:jsonEncode(CountRequest().toJson()));
                   final countResponse = CountResponse.fromJson(response.data);
                    _numbercase.text = countResponse.count.toString();
    super.initState();
  }
  

@override
  dispose() {
    _controller.dispose();
    _numbercase.dispose();
    super.dispose();
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
                  
                  controller: _numbercase,
                  
                  ),

                  ] 
  
          )
      )
    );
  }  
}
