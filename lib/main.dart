import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() async {
  /// Initialize packages
  ///

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      path: 'assets/translations',
      supportedLocales: const [
        Locale('en'),
        Locale('de'),
      ],
      fallbackLocale: const Locale('en'),
      useFallbackTranslations: true,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const EasyLocalizationTest(),
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
    );
  }
}

class EasyLocalizationTest extends StatefulWidget {
  const EasyLocalizationTest({Key? key}) : super(key: key);

  @override
  _EasyLocalizationTestState createState() => _EasyLocalizationTestState();
}


class _EasyLocalizationTestState extends State<EasyLocalizationTest> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                  onTap: () {
                    context.setLocale(const Locale('de'));
                  },
                  child: const Text('Switch Lanaguage German')),
              InkWell(
                  onTap: () {
                    context.setLocale(const Locale('en'));
                  },
                  child: const Text('Switch Lanaguage English')),
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          //add the key that needs to be translated
          Center(
            child: Column(
              children: [
                Text(tr("center_title")),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: InkWell(
                      onTap: () async {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => const KeyCloakScreen(),
                        //     ));
                      },
                      child: Text(tr("login"))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
