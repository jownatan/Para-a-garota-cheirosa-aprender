// screens/register_screen.dart
// Tela de cadastro de novos usuários

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Controladores para os campos de texto
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

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
        title: Text('Cadastro'),
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
                    // Ícone ou logo do aplicativo
                    Icon(
                      Icons.person_add,
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
                          return 'Por favor, insira uma senha';
                        }
                        if (value.length < 6) {
                          return 'A senha deve ter pelo menos 6 caracteres';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),

                    // Campo de confirmação de senha
                    TextFormField(
                      controller: _confirmPasswordController,
                      decoration: InputDecoration(
                        labelText: 'Confirmar Senha',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock_outline),
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, confirme sua senha';
                        }
                        if (value != _passwordController.text) {
                          return 'As senhas não coincidem';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24),

                    // Botão de cadastro
                    _isLoading
                        ? CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: () async {
                              // Valida o formulário antes de tentar fazer o cadastro
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  _isLoading = true;
                                });

                                try {
                                  // Tenta registrar o usuário com as credenciais fornecidas
                                  await authService.register(
                                    _emailController.text.trim(),
                                    _passwordController.text,
                                  );

                                  // Cadastro bem-sucedido - volta para a tela anterior
                                  if (mounted) {
                                    Navigator.of(context).pop();

                                    // Exibe mensagem de sucesso
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            'Cadastro realizado com sucesso!'),
                                        backgroundColor: Colors.green,
                                      ),
                                    );
                                  }
                                } catch (e) {
                                  // Exibe mensagem de erro em caso de falha
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          'Erro ao cadastrar: ${e.toString()}'),
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
                                'CADASTRAR',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(double.infinity, 50),
                            ),
                          ),
                    SizedBox(height: 16),

                    // Link para voltar à tela de login
                    TextButton(
                      onPressed: () {
                        // Volta para a tela de login
                        Navigator.pop(context);
                      },
                      child: Text('Já tem uma conta? Faça login'),
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
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
