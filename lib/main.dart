import 'package:centralized_transaction/local_repo/service_preferences.dart';
import 'package:flutter/material.dart';

import 'presentation/core/app_widget.dart';

void main()async  {
  WidgetsFlutterBinding.ensureInitialized();
  await ServicePref.init();
  runApp(AppWidget());
}
