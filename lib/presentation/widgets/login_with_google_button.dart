import 'package:flutter/material.dart';

class LoginWithGoogleButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const LoginWithGoogleButton(
      {Key? key, required this.buttonText, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: BorderSide(
            width: 1.0,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        elevation: 0,
      ),
      onPressed: onPressed,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/google_logo.png',
              width: 18,
              height: 18,
            ),
            const SizedBox(width: 12),
            Text(
              buttonText,
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context)
                    .colorScheme
                    .onBackground, // Color.fromARGB(255, 61, 61, 61),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
