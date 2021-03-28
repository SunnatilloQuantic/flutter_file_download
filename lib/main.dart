// import 'dart:convert';
// import 'dart:io';

// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_download/download_page.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:open_file/open_file.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:path/path.dart' as path;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DownloadPage(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final String _fileUrl = "https://ttj.r8.uz/files/portal/3_-_mavzu.pdf";
//   final String _fileName = "3_-_mavzu.pdf";
//   final Dio _dio = Dio();

//   String _progress = "-";

//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

//   @override
//   void initState() {
//     super.initState();

//     flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//     final android = AndroidInitializationSettings('@mipmap/ic_launcher');
//     final iOS = IOSInitializationSettings();
//     final initSettings = InitializationSettings(android: android, iOS: iOS);

//     flutterLocalNotificationsPlugin.initialize(initSettings,
//         onSelectNotification: _onSelectNotification);
//   }

//   Future<void> _onSelectNotification(String json) async {
//     final obj = jsonDecode(json);

//     if (obj['isSuccess']) {
//       print(obj['filePath']);
//       OpenFile.open(obj['filePath']);
//     } else {
//       showDialog(
//         context: context,
//         builder: (_) => AlertDialog(
//           title: Text('Error'),
//           content: Text('${obj['error']}'),
//         ),
//       );
//     }
//   }

//   Future<void> _showNotification(Map<String, dynamic> downloadStatus) async {
//     final android = AndroidNotificationDetails(
//         'channel id', 'channel name', 'channel description',
//         priority: Priority.high, importance: Importance.max);
//     final iOS = IOSNotificationDetails();
//     final platform = NotificationDetails(android: android, iOS: iOS);
//     final json = jsonEncode(downloadStatus);
//     final isSuccess = downloadStatus['isSuccess'];

//     await flutterLocalNotificationsPlugin.show(
//         0, // notification id
//         isSuccess ? 'Success' : 'Failure',
//         isSuccess
//             ? 'File has been downloaded successfully!'
//             : 'There was an error while downloading the file.',
//         platform,
//         payload: json);
//   }

//   Future<Directory> _getDownloadDirectory() async {
//     return await getApplicationDocumentsDirectory();
//   }

//   Future<bool> _requestPermissions() async {
//     if (await Permission.storage.request().isGranted) {
//       await Permission.storage.request();
//     }
//     return await Permission.storage.request().isGranted;
//   }

//   void _onReceiveProgress(int received, int total) {
//     if (total != -1) {
//       setState(() {
//         _progress = (received / total * 100).toStringAsFixed(0) + "%";
//       });
//     }
//   }

//   Future<void> _startDownload(String savePath) async {
//     Map<String, dynamic> result = {
//       'isSuccess': false,
//       'filePath': null,
//       'error': null,
//     };

//     try {
//       final response = await _dio.download(_fileUrl, savePath,
//           onReceiveProgress: _onReceiveProgress);
//       result['isSuccess'] = response.statusCode == 200;
//       result['filePath'] = savePath;
//     } catch (ex) {
//       result['error'] = ex.toString();
//       print(result);
//     } finally {
//       await _showNotification(result);
//     }
//   }

//   Future<void> _download() async {
//     final dir = await _getDownloadDirectory();
//     final isPermissionStatusGranted = await _requestPermissions();

//     if (isPermissionStatusGranted) {
//       final savePath = path.join(dir.path, _fileName);
//       await _startDownload(savePath);
//     } else {
//       // handle the scenario when user declines the permissions
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         brightness: Brightness.dark,
//         backgroundColor: Colors.blue,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Download progress:',
//             ),
//             Text(
//               '$_progress',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _download,
//         tooltip: 'Download',
//         child: Icon(Icons.file_download),
//       ),
//     );
//   }
// }
// // 