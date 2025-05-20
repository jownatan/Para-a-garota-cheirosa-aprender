// screens/home_screen.dart
// Tela principal exibida após o login bem-sucedido

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtém a instância do AuthService através do Provider
    final authService = Provider.of<AuthService>(context);

    // Obtém informações do usuário atual
    final user = authService.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text('Página Inicial'),
        // Adiciona botão de logout na AppBar
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            tooltip: 'Sair',
            onPressed: () async {
              // Mostra diálogo de confirmação
              final shouldLogout = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Sair'),
                  content: Text('Tem certeza que deseja sair?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: Text('CANCELAR'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: Text('SIM'),
                    ),
                  ],
                ),
              );

              // Se o usuário confirmar, faz logout
              if (shouldLogout == true) {
                await authService.logout();
                // Não é necessário navegar, pois o StreamBuilder em main.dart
                // detectará a mudança e mostrará a tela de login automaticamente
              }
            },
          ),
        ],
      ),
      body: Center(
        // maximo 500 pixels de horzontal

        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 500),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Ícone ou avatar do usuário
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Theme.of(context).primaryColor,
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 24),

                // Exibe o email do usuário logado
                Text(
                  'Bem-vindo!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  user?.email ?? 'Usuário',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: 32),

                // Mensagem de boas-vindas
                Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          'Você está logado com sucesso!',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Esta é a tela principal do seu aplicativo. Adicione seu conteúdo aqui.',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 32),

                // Botão de logout alternativo na tela
                ElevatedButton.icon(
                  icon: Icon(Icons.logout),
                  label: Text('SAIR'),
                  onPressed: () async {
                    await authService.logout();
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(200, 50),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
