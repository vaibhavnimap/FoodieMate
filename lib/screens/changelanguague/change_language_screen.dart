import 'package:flutter/material.dart';
import 'package:foodiemate/i18n/strings.g.dart';
import 'package:get/get.dart';

class ChangeLanguageScreen extends StatelessWidget {
  const ChangeLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Row(children: [
            const SizedBox(
              width: 10,
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              height: 50,
              // width: 50,
              decoration: BoxDecoration(
                // color: Colors.grey[100],
                color: Colors.grey.withOpacity(0.6),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Icon(Icons.arrow_back),
              ),
            ),
          ]),
        ),
        title: Text("Language Setting"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              t.hello,
              style: const TextStyle(fontSize: 24.0),
            ),
            Text(
              "Current Langauge:- ${t.language}",
              style: const TextStyle(fontSize: 24.0),
            ),
            const SizedBox(height: 20.0),
            DropdownButton<AppLocale>(
              iconSize: 40,
              value: TranslationProvider.of(context).locale,
              items: [
                DropdownMenuItem(
                  value: AppLocale.en,
                  child: Text('English'),
                ),
                DropdownMenuItem(
                  value: AppLocale.hi,
                  child: Text('Hindi'),
                ),
                DropdownMenuItem(
                  value: AppLocale.mr,
                  child:
                      Text('Marathi'), // Assuming Spanish is the third language
                ),
              ],
              onChanged: (AppLocale? newLocale) {
                if (newLocale != null) {
                  LocaleSettings.setLocale(newLocale);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
