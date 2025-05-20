// screens/login_screen.dart
// Tela de login com opção para navegar para o cadastro

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controladores para os campos de texto
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Chave do formulário para validação
  final _formKey = GlobalKey<FormState>();

  // Flag para controlar a visibilidade do loading
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    // Obtém a instância do AuthService através do Provider
    final authService = Provider.of<AuthService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 500),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo ou ícone do aplicativo
                    Icon(
                      Icons.lock,
                      size: 100,
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(height: 30),

                    // Campo de email
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        // Validação simples de email
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira seu email';
                        }
                        if (!value.contains('@')) {
                          return 'Por favor, insira um email válido';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),

                    // Campo de senha
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock),
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira sua senha';
                        }
                        if (value.length < 6) {
                          return 'A senha deve ter pelo menos 6 caracteres';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24),

                    // Botão de login
                    _isLoading
                        ? CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: () async {
                              // Valida o formulário antes de tentar fazer login
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  _isLoading = true;
                                });

                                try {
                                  // Tenta fazer login com as credenciais fornecidas
                                  await authService.login(
                                    _emailController.text.trim(),
                                    _passwordController.text,
                                  );
                                  // Login bem-sucedido - AuthStateChanges cuidará da navegação
                                } catch (e) {
                                  // Exibe mensagem de erro em caso de falha
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          'Erro ao fazer login: ${e.toString()}'),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                } finally {
                                  // Desativa o indicador de carregamento
                                  if (mounted) {
                                    setState(() {
                                      _isLoading = false;
                                    });
                                  }
                                }
                              }
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              child: Text(
                                'ENTRAR',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(double.infinity, 50),
                            ),
                          ),
                    SizedBox(height: 16),

                    // Link para a tela de cadastro
                    TextButton(
                      onPressed: () {
                        // Navega para a tela de cadastro
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()),
                        );
                      },
                      child: Text('Não tem uma conta? Cadastre-se'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Libera os controladores quando a tela for descartada
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
