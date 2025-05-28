import 'dart:html' as html;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationHelper {
  static void replaceWithUrl(BuildContext context, String path) {
    if (kIsWeb) {
      context.replace(path);
      html.window.history.replaceState(null, '', '#$path');
    } else {
      context.replace(path);
    }
  }
} 