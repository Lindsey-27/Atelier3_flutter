import 'package:exercice_flutter/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _acceptedCGU = false;


  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.loginTitle),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                    Semantics(
                      label: l10n.emailLabel,
                      child: TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          labelText: l10n.emailLabel,
                        ),
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return l10n.emailRequired;
                          }
                          final emailRegex =
                              RegExp(r'^[^@]+@[^@]+\.[^@]+');
                          if(!emailRegex.hasMatch(value)){
                            return l10n.emailInvalid;
                          }
                          return null;
                        },
                      ),
                    ),

                    const SizedBox(height: 16),

                    Semantics(
                      label: l10n.passwordLabel,
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          labelText: l10n.passwordLabel,
                        ),
                        validator: (value){
                          if(value ==  null || value.isEmpty){
                            return l10n.passwordRequired;
                          }
                          return null;
                        },
                      ),
                    ),

                    const SizedBox(height: 16),

                    CheckboxListTile(
                        value: _acceptedCGU,
                        onChanged: (value){
                          setState(() {
                            _acceptedCGU = value ?? false;
                          });
                        },
                      title: Text(l10n.cguLabel),
                    ),

                    const SizedBox(height: 24),

                    Semantics(
                      button: true,
                      child: ElevatedButton(
                          onPressed: (){
                            if(!_acceptedCGU){
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(l10n.cguRequired)),
                              );
                              return;
                            }
                            if(_formKey.currentState!.validate()){
                              context.read<AuthProvider>().login();

                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(l10n.loginSuccess)),
                              );
                              context.go('/');
                            }
                          },
                          child: Text(l10n.loginButton),
                      ),
                    ),
                  ],
                )
            ),
          )
      ),
    );
  }
}
