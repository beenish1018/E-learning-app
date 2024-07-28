import 'package:flutter/material.dart';
import 'package:coursera/Constants/Color.dart' as color;

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
 

  const CustomButton({Key? key, 
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      
    width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(color.Colors.primary),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                  ),
                  textStyle: MaterialStateProperty.all<TextStyle>(
                    const TextStyle(
                      fontSize: 18,
                      
                      fontWeight: FontWeight.w600,
                    ),
                    
                  ),
                   foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  elevation: MaterialStateProperty.all<double>(5.0),
                ),
        
        onPressed: onPressed,
        child: Text(text),
        
      ),
    );
  }
}
