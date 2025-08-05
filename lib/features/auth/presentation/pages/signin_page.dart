import 'package:flutter/material.dart';
import 'package:flutter_blog_app/core/theme/app_palette.dart';
import 'package:flutter_blog_app/features/auth/presentation/pages/signup_page.dart';
import 'package:flutter_blog_app/features/auth/presentation/widgets/auth_field.dart';
import 'package:flutter_blog_app/features/auth/presentation/widgets/auth_gradient_button.dart';

class SignInPage extends StatefulWidget {

  static route() => MaterialPageRoute(
    builder: (context) => SignInPage(),
  );

  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sign in.',
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30,),
              AuthField(
                hintText: 'Email',
                controller: emailController
              ),
              SizedBox(height: 15,),
              AuthField(
                hintText: 'Password', 
                controller: passwordController
              ),
              SizedBox(height: 20,),
              AuthGradientButton(text: "Sign in.",),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    SignUpPage.route(),
                  );
                },
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: Theme.of(context).textTheme.titleMedium,
                    children: [
                      TextSpan(
                        text: 'Sign Up',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppPallete.gradient2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]
                  ),
                ),
              ),
            ],
          ),
        ),
        
        ),
    );
  }
}