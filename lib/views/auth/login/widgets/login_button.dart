
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/login_bloc.dart';
import '../../../../blocs/login_event.dart';
import '../../../../blocs/login_state.dart';
import '../../form_submission_status.dart';


class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.formKey});

  final dynamic formKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return state.formStatus is FormSubmitting
            ? const Center(child: CircularProgressIndicator())
            : ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    context.read<LoginBloc>().add(LoginSubmitted());
                  }
                },
                child: const Text("Login"));
      },
    );
  }
}
