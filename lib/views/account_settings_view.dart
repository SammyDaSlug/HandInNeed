import 'package:flutter/material.dart';
// Services
import 'package:hand_in_need/services/auth/auth_service.dart';
import 'package:hand_in_need/views/user_settings_view.dart';
// Widgets
import 'package:hand_in_need/widgets/button.dart';
// Constants
import 'package:hand_in_need/constants/route_names.dart';
// Extensions
import 'package:hand_in_need/extensions/navigator.dart';
// Util
import 'package:go_router/go_router.dart';

class AccountSettingsView extends StatelessWidget {
  const AccountSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = AuthService();

    return Column(
      children: [
        ListTile(
          title: Text(
            'User Settings',
            style: Theme.of(context).textTheme.labelMedium,
          ),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => Navigator.of(context).pushSlideRoute(const UserSettingsView())
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Button(
            onPressed: () async {
              final navigator = GoRouter.of(context);
              await authService.signOut();
              navigator.goNamed(register);
            },
            label: 'Sign Out',
          ),
        ),
      ],
    );
  }
}
