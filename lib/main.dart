import 'package:firebase_core/firebase_core.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'package:loviser/pages/login_page.dart';

import 'package:loviser/providers/page/message_page/card_profile_provider.dart';
import 'package:loviser/providers/page/message_page/message_page_provider.dart';

import '../pages/login_page.dart';

import './providers/posts.dart';
import './providers/post_filters.dart';
import './providers/applys.dart';
import './providers/authentication.dart';
import './providers/profiles.dart';
import './providers/saved_posts.dart';
import './providers/users.dart';

import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

final screens = [];
void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Posts(),
        ),
        ChangeNotifierProvider.value(
          value: PostFilters(),
        ),
        ChangeNotifierProvider.value(
          value: Applys(),
        ),
        ChangeNotifierProvider.value(
          value: Authentication(),
        ),
        ChangeNotifierProvider.value(
          value: Profiles(),
        ),
        ChangeNotifierProvider.value(
          value: SavedPosts(),
        ),
        ChangeNotifierProvider.value(
          value: Users(),
        ),
        ChangeNotifierProvider.value(
          value: MessagePageProvider(),
        ),
        ChangeNotifierProvider.value(value: CardProfileProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.light,
            ),
          ),
        ),
        home: new Login(),
        //home: MessagePage(),
        debugShowCheckedModeBanner: false,
      )));
}
