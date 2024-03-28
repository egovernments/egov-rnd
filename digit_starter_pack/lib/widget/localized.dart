import 'package:flutter/cupertino.dart';

import '../blocs/app_localization.dart';

abstract class LocalizedStatefulWidget extends StatefulWidget {
  final AppLocalizations? appLocalizations;

  const LocalizedStatefulWidget({super.key, this.appLocalizations});
}

abstract class LocalizedState<T extends LocalizedStatefulWidget>
    extends State<T> {
  late AppLocalizations _localizations;

  AppLocalizations get localizations => _localizations;

  set localizations(AppLocalizations localizations) {
    if (mounted) {
      setState(() {
        _localizations = localizations;
      });
    }
  }

  @override
  @mustCallSuper
  void didChangeDependencies() {
    _localizations = widget.appLocalizations ?? AppLocalizations.of(context);
    super.didChangeDependencies();
  }
}
