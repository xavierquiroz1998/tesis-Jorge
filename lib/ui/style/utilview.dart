import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class UtilView {
  static messageNewAccess(
      String titulo, String message, Color color, BuildContext context) {
    final materialBanner = MaterialBanner(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,
      backgroundColor: Colors.transparent,
      forceActionsBelow: true,
      content: AwesomeSnackbarContent(
        title: titulo,
        message: message,
        contentType: ContentType.success,
        inMaterialBanner: true,
      ),
      actions: const [SizedBox.shrink()],
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentMaterialBanner()
      ..showMaterialBanner(materialBanner);
  }

  static messageSnackNewAccess(String mensaje, BuildContext context) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(
        message: mensaje,
      ),
    );
  }

  static messageSnackNewError(String mensaje, BuildContext context) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(
        message: mensaje,
      ),
    );
  }

  static messageDanger(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 4,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 17.0,
      webPosition: "center",
      webBgColor: "red",
    );
  }

  static messageAccess(String message, Color color) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 12.0,
      webPosition: "center",
      webBgColor: 'rgb(46,64,83)',
    );
  }

  static messageWarning(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 3,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 17.0,
      webPosition: "center",
      webBgColor: "orange",
    );
  }
}
