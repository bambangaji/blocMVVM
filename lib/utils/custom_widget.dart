import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:merchant_senbu/utils/color_custom.dart';
import 'package:merchant_senbu/utils/validators.dart';

Widget customTextField(
    {String hintText = "",
    int minLength = 0,
    void Function()? callBack,
    void Function(String)? onChanged,
    // String? Function(String)? validator,
    bool isDisable = false,
    bool obsecureText = false,
    int validator = 0,
    int type = 0,
    TextInputType inputType = TextInputType.none,
    InputBorder inputBorder = InputBorder.none,
    TextEditingController? controller,
    bool isMandatory = true,
    Color bgColor = Warna.softWhite}) {
  return TextFormField(
    autofocus: true,
    onChanged: onChanged,
    obscureText: obsecureText,
    controller: controller,
    onTap: callBack,
    readOnly: isDisable,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    validator: (value) {
      if (isMandatory) {
        if (value == null || value.isEmpty) {
          return "Can't be empty";
        }
        if (inputType == TextInputType.emailAddress) {
          if (!validatorEmail(value)) {
            return "Invalid email format";
          } else {
            return null;
          }
        }
        if (inputType == TextInputType.phone) {
          if (!validateNumberOnly(value)) {
            return "Invalid phone number format";
          } else {
            return null;
          }
        }
        // if (inputType == TextInputType.visiblePassword) {
        //   if (!validateStructure(value)) {
        //     return "*Password must like 'Abcdefg123!' ";
        //   } else {
        //     return null;
        //   }
        // }
        if (minLength > 0) {
          if (value.length < minLength) {
            return "Min length $minLength";
          } else {
            return null;
          }
        } else {
          return null;
        }
      } else {
        return null;
      }
    },
    decoration: InputDecoration(
      filled: true,
      fillColor: bgColor,
      contentPadding: EdgeInsets.all(10),
      suffixIcon: inputType == TextInputType.visiblePassword
          ? GestureDetector(
              onTap: () => obsecureText = !obsecureText,
              child: Icon(
                  obsecureText
                      ? Icons.remove_red_eye_outlined
                      : Icons.remove_red_eye,
                  color: Warna.abuMuda),
            )
          : null,
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Warna.flowerGreen, width: 2),
        borderRadius: BorderRadius.circular(15.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.pink[400]!, width: 2),
        borderRadius: BorderRadius.circular(15.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(15.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(15.0),
      ),
      border: inputBorder,
      hintText: hintText,
    ),
  );
}

showCustomBottomSheetError(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext context) {
      return Container(
        height: 200,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Options',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Edit'),
              onTap: () {
                // Handle edit action
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.delete),
              title: Text('Delete'),
              onTap: () {
                // Handle delete action
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    },
  );
}

showToastError() {
  Fluttertoast.showToast(
      msg: "Error Login",
      textColor: Warna.white,
      backgroundColor: Warna.softMerahMuda,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 4);
}
