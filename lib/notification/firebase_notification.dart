import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class FirebaseNotification {
  // Inisialisasi dan mendapatkan token FCM
  Future<void> initializeFirebaseMessaging() async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    await FirebaseMessaging.instance.setAutoInitEnabled(true);
    log("FCMToken $fcmToken");

    // Menambahkan listener untuk notifikasi foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _showForegroundNotification(message);
    });
  }

  // Menampilkan notifikasi pada saat aplikasi berjalan di foreground
  Future<void> _showForegroundNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'high_importance_channel', // ID Channel
      'High Importance Notifications', // Nama Channel
      importance: Importance.high,
      priority: Priority.high,
    );

    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    await flutterLocalNotificationsPlugin.show(
      message.notification.hashCode,
      message.notification?.title,
      message.notification?.body,
      notificationDetails,
    );
  }
}
