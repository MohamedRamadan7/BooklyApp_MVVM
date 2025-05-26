import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> customUrlLauncher(context, String? uri) async {
  if (uri != null) {
    final Uri url = Uri.parse(uri);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('No Url Found')));
    }
  }
}
