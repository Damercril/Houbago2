import 'package:flutter/material.dart';
import 'package:houbago/houbago/houbago_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HoubagoTheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 60),
              // Logo ou Titre
              Text(
                'Houbago',
                style: HoubagoTheme.textTheme.displayMedium?.copyWith(
                  color: HoubagoTheme.primary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                'Connectez-vous pour continuer',
                style: HoubagoTheme.textTheme.titleMedium?.copyWith(
                  color: HoubagoTheme.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),

              // Champ téléphone
              TextField(
                controller: _phoneController,
                style: HoubagoTheme.textTheme.bodyLarge,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Téléphone',
                  labelStyle: HoubagoTheme.textTheme.labelLarge?.copyWith(
                    color: HoubagoTheme.textSecondary,
                  ),
                  prefixIcon: Icon(
                    Icons.phone_android,
                    color: HoubagoTheme.secondary,
                  ),
                  filled: true,
                  fillColor: HoubagoTheme.backgroundLight,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: HoubagoTheme.secondaryLight),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: HoubagoTheme.secondaryLight),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: HoubagoTheme.primary, width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Champ mot de passe
              TextField(
                controller: _passwordController,
                style: HoubagoTheme.textTheme.bodyLarge,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: 'Mot de passe',
                  labelStyle: HoubagoTheme.textTheme.labelLarge?.copyWith(
                    color: HoubagoTheme.textSecondary,
                  ),
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: HoubagoTheme.secondary,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility : Icons.visibility_off,
                      color: HoubagoTheme.secondary,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                  filled: true,
                  fillColor: HoubagoTheme.backgroundLight,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: HoubagoTheme.secondaryLight),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: HoubagoTheme.secondaryLight),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: HoubagoTheme.primary, width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Mot de passe oublié
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Action mot de passe oublié
                  },
                  child: Text(
                    'Mot de passe oublié ?',
                    style: HoubagoTheme.textTheme.labelLarge?.copyWith(
                      color: HoubagoTheme.primary,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Bouton de connexion
              ElevatedButton(
                onPressed: () {
                  // Redirection vers la page d'accueil
                  Navigator.pushReplacementNamed(context, '/home');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: HoubagoTheme.primary,
                  foregroundColor: HoubagoTheme.textLight,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Se connecter',
                  style: HoubagoTheme.buttonText,
                ),
              ),
              const SizedBox(height: 24),

              // Lien d'inscription
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Pas encore de compte ? ',
                    style: HoubagoTheme.textTheme.bodyMedium,
                  ),
                  TextButton(
                    onPressed: () {
                      // Action inscription
                    },
                    child: Text(
                      'Inscrivez-vous',
                      style: HoubagoTheme.textTheme.labelLarge?.copyWith(
                        color: HoubagoTheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
