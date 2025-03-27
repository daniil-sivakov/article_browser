import 'package:article_browser/presentation/formatters/date_formatter.dart';
import 'package:article_browser/presentation/localization/localization_plug.dart';
import 'package:flutter/material.dart';

class DataReceptionTime extends StatelessWidget {
  const DataReceptionTime({super.key, required this.dateTime});

  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        LocalizationPlug.dataReceivedAt(DateFormatter().mdhhmm(dateTime)),
        style: TextStyle(color: ColorScheme.of(context).onPrimary),
      ),
    );
  }
}
