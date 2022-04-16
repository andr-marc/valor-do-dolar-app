import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

import '../../control/dollar.dart';
import '../settings/settings_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.homeTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: getUSD_BRL(),
        builder: (context, snapshot) {
          final formatter = NumberFormat.currency(
            locale: Platform.localeName,
            name: '',
            decimalDigits: 2,
          );
          print(formatter.format(12314.14));

          var dollar = '0.00';

          if (snapshot.hasData) {
            dollar = snapshot.data.toString();
            dollar = num.parse(dollar).toStringAsFixed(2);
          }

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  AppLocalizations.of(context)!.textMessage,
                ),
                Text(
                  AppLocalizations.of(context)!
                      .valueMessage(formatter.format(double.parse(dollar))),
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
