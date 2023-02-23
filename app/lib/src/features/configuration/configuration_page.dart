import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listinha/src/shared/stores/app_store.dart';
import 'package:rx_notifier/rx_notifier.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({Key? key}) : super(key: key);

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  final appStore = Modular.get<AppStore>();
  void _changeThemeMode(ThemeMode? mode) {
    if (mode != null) {
      appStore.themeMode = mode;
    }
  }

  @override
  Widget build(BuildContext context) {
    //final appStore = context.watch<AppStore>((store) => store.themeMode);
    context.select(() => appStore.themeMode);
    return Scaffold(
      appBar: AppBar(
        title: const Text('notas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Configurações',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            Text(
              'Tema',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 10),
            RadioListTile<ThemeMode>(
              value: ThemeMode.system,
              groupValue: appStore.themeMode,
              onChanged: _changeThemeMode,
              title: const Text('Sistema'),
            ),
            RadioListTile<ThemeMode>(
              value: ThemeMode.light,
              groupValue: appStore.themeMode,
              onChanged: _changeThemeMode,
              title: const Text('Claro'),
            ),
            RadioListTile<ThemeMode>(
              value: ThemeMode.dark,
              groupValue: appStore.themeMode,
              onChanged: _changeThemeMode,
              title: const Text('Escuro'),
            ),
            const SizedBox(height: 20),
            Text(
              'Controle de dados',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: () {}, //appStore.deleteApp,
              child: const Text('Apagar cache e reiniciar app'),
            )
          ],
        ),
      ),
    );
  }
}
