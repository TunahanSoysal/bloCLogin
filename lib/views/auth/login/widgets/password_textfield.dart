import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../blocs/login_bloc.dart';
import '../../../../blocs/login_event.dart';
import '../../../../blocs/login_state.dart';

class PasswordTextfield extends StatelessWidget {
  const PasswordTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
            icon: Icon(Icons.key),
            hintText: "Password",
          ),
          validator: (value) =>
              state.isValidPassword ? null : "Password is too short",
          onChanged: (value) => context
              .read<LoginBloc>()
              .add(LoginPasswordChanged(password: value)),
        );
      },
    );
  }
}
