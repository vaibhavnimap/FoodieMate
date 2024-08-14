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
              t.language,
              style: const TextStyle(fontSize: 24.0),
            ),
            const SizedBox(height: 20.0),
            Switch(
              value: TranslationProvider.of(context).locale == AppLocale.hi,
              onChanged: (languageSwitched) {
                final newLocale =
                    languageSwitched ? AppLocale.hi : AppLocale.en;
                LocaleSettings.setLocale(newLocale);
              },
            ),
          ],
        ),
      ),
    );
  }
}
