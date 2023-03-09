import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

import 'package:tesis/data/model/familiares.dart';
import 'package:tesis/ui/pages/report/pdfApi.dart';

import 'package:flutter/material.dart' as materi;

class PdfReportc {
  static DateFormat formatter = DateFormat('dd/MM/yyyy');
  static Future generate(
      ModelFamiliares famili, String codRef, Uint8List logo) async {
    final pdf = Document();

    final image = MemoryImage(
      base64Decode(famili.img),
    );

    final logoEmp = MemoryImage(
      logo,
    );

    pdf.addPage(MultiPage(
      build: (context) => [
        buildHeader(famili, codRef, logoEmp, image),
        SizedBox(height: 1 * PdfPageFormat.cm),
        buildTitle(famili),

        buildInvoice(),
        SizedBox(height: 0.6 * PdfPageFormat.cm),
        buildTerminosCondiciones(),
        // Divider(),
        // buildTotal(invoice),
      ],
      //footer: (context) => buildFooter(invoice),
    ));

    PdfApi.saveDocument(
        name: 'Hoja de Inscripción-${famili.nombreSocio}.pdf', pdf: pdf);
  }

  static Future generateCarta(ModelFamiliares famili, String codRef) async {
    final pdf = Document();

    pdf.addPage(MultiPage(
      build: (context) => [
        buildHeaderCarta(famili, codRef),
        SizedBox(height: 1 * PdfPageFormat.cm),
        buildTitleCarta(famili),

        // buildInvoice(),
        // SizedBox(height: 0.6 * PdfPageFormat.cm),
        // buildTerminosCondiciones(),
        // Divider(),
        // buildTotal(invoice),
      ],
      //footer: (context) => buildFooter(invoice),
    ));

    PdfApi.saveDocument(
        name: 'Carta de Invitación-${famili.nombreSocio}.pdf', pdf: pdf);
  }

  static Widget buildHeader(ModelFamiliares invoice, String codm,
          MemoryImage logoEmp, MemoryImage imgMemori) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 1 * PdfPageFormat.cm),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(logoEmp, height: 130, width: 130),
              Text("Hoja de Inscripcion ",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Image(imgMemori, height: 100, width: 100),

              //buildSupplierAddress(cod),
            ],
          ),
          SizedBox(height: 1 * PdfPageFormat.cm),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Text("sub titulo")
              // buildCustomerAddress(invoice.customer),
              // buildInvoiceInfo(invoice.info),
            ],
          ),
        ],
      );

  static Widget buildHeaderCarta(ModelFamiliares invoice, String codm) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 1 * PdfPageFormat.cm),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Fecha ${formatter.format(DateTime.now())} "),

              //buildSupplierAddress(cod),
            ],
          ),
          SizedBox(height: 1 * PdfPageFormat.cm),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Carta de Invitación a Escuelas y Actividades",
                  style: TextStyle(fontWeight: FontWeight.bold)),

              // buildCustomerAddress(invoice.customer),
              // buildInvoiceInfo(invoice.info),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Deportivas", style: TextStyle(fontWeight: FontWeight.bold))
            ],
          ),
        ],
      );

  static Widget buildSupplierAddress(String cod) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Text("Nv-$cod", style: TextStyle(fontWeight: FontWeight.bold)),
          Text(
            "Hoja de Inscripción ",
          ),
          SizedBox(height: 1 * PdfPageFormat.mm),
          //Text("adreess"),
        ],
      );
  static Widget buildTitle(ModelFamiliares registro) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   "NV-" + codRef,
          //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Fecha de Inscripción : ",
              ),
              Text(
                "_______________________",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                ),
              ),
              Text(
                "Deporte o Actividad : ",
              ),
              Text(
                "_______________________",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
          SizedBox(height: 0.6 * PdfPageFormat.cm),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Referencia : "),
              if (registro.tipo == "Socio") ...{
                Text("Familiar del Socio"),
              } else ...{
                Text("Invitado del socio"),
              },
            ],
          ),
          SizedBox(height: 0.6 * PdfPageFormat.cm),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Nivel : "),
              Text("________________"),
              Text("Horario : "),
              Text("________________"),
            ],
          ),
          SizedBox(height: 0.6 * PdfPageFormat.cm),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Valor a Cancelar por Mes  : "),
              Text("____________________"),
            ],
          ),

          SizedBox(height: 0.6 * PdfPageFormat.cm),
          Text("Fecha de Inicio : _________________________"),
          SizedBox(height: 0.6 * PdfPageFormat.cm),
          Text("Cod. Socio : ${registro.codigoSocio}"),
          SizedBox(height: 0.6 * PdfPageFormat.cm),
          Text(
              "Nombres del Socio (Padre o Responsable) : ${registro.nombreSocio}"),
          SizedBox(height: 0.6 * PdfPageFormat.cm),
          Text("Nombre del Alumno : ${registro.nombres}"),
          SizedBox(height: 0.6 * PdfPageFormat.cm),
          Text("Fecha de Nacimiento : ${formatter.format(registro.fechaNac)}"),
          SizedBox(height: 0.6 * PdfPageFormat.cm),
          Text("Dirección : ${registro.domicilio}"),
          SizedBox(height: 0.6 * PdfPageFormat.cm),
          Row(
            children: [
              Text(
                "e-mail : ",
              ),
              Text(
                " ${registro.correo}",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),

          SizedBox(height: 0.8 * PdfPageFormat.cm),
        ],
      );

  static Widget buildTitleCarta(ModelFamiliares registro) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   "NV-" + codRef,
          //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Sr(ers):", style: TextStyle(fontWeight: FontWeight.bold))
            ],
          ),
          SizedBox(height: 0.5 * PdfPageFormat.cm),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "________________________",
              )
            ],
          ),
          SizedBox(height: 0.3 * PdfPageFormat.cm),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Guayaquil Tenis Club",
                  style: TextStyle(fontWeight: FontWeight.bold))
            ],
          ),
          SizedBox(height: 1 * PdfPageFormat.cm),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("De mis consideraciones :",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 0.6 * PdfPageFormat.cm),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                  "Por medio de la presente yo ${registro.nombreSocio}, Socio/ # ${registro.codigoSocio} "),
            ],
          ),
          SizedBox(height: 0.6 * PdfPageFormat.cm),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                  "Solicito a usted de la manera mas Comedida, se sirva Autorizar a mi "),
            ],
          ),

          SizedBox(height: 0.6 * PdfPageFormat.cm),
          Text(
              "Invitado/a ${registro.nombres} Con C.I. # : ${registro.identificacion}"),
          SizedBox(height: 0.6 * PdfPageFormat.cm),
          Text(""),
          SizedBox(height: 0.6 * PdfPageFormat.cm),
          Text("Datos de Contacto ",
              style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 0.8 * PdfPageFormat.cm),
          Text("Numero de Tecnico Socio :  0969998765 "),
          SizedBox(height: 0.5 * PdfPageFormat.cm),
          Text("Numero Telefonico de Invitado :  ${registro.celular}"),
          SizedBox(height: 0.5 * PdfPageFormat.cm),
          Text("correo Electronico del Invitado :  ${registro.correo}"),
          SizedBox(height: 1 * PdfPageFormat.cm),

          Row(
            children: [
              Text(
                  "En caso que mi invitado no cancele los valores a tiempo (Tiempo establecido por actividad), ",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          Row(
            children: [
              Text(
                  "autorizo se me genere la factura correspondiente a mi cuenta socio titular",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 0.8 * PdfPageFormat.cm),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "_____________________________",
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Firma de Socio Titular",
              ),
            ],
          ),
          SizedBox(height: 0.8 * PdfPageFormat.cm),
        ],
      );

  static Widget buildInvoice() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("___________________"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Condiciones de Servicio"),
            Text("Firma de Socio titular"),
          ],
        ),
      ],
    );
  }

  static Widget buildTerminosCondiciones() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "1. El alumno deberá ser inscrito mínimo por un mes",
          style: TextStyle(fontSize: 10),
        ),
        Text(
          "2. Respetar el horario en el que inscribió su representado",
          style: TextStyle(fontSize: 10),
        ),
        Text(
          "3. Los pagos de Socios deberán ser debitados de la tarjeta de crédito los 5 primeros días de cada mes.",
          style: TextStyle(fontSize: 10),
        ),
        Text(
          "4. Los No Socios deberán cancelar sus valores en caja al momento de inscribir al alumno y realizar sus pagos mensuales los 5 primeros días de cada mes.",
          style: TextStyle(fontSize: 10),
        ),
        Text(
          "5. En caso de que el inscrito por algún motivo no pueda asistir a las clases, el Representante deberá comunicarlo por escrito con 15 días de anticipación a las oficinas de Deportes.",
          style: TextStyle(fontSize: 10),
        ),
        Text(
          "6. Si el alumno falta injustificadamente al horario asignado por un período de 30 días pierde el cupo otorgado en base a ficha de inscripción. ",
          style: TextStyle(fontSize: 10),
        ),
        Text(
          "7. En caso de que el inscrito en la escuela no asista a clases y éste no haya comunicado con la anticipación detallada en el inciso anterior, el valor debitado No será devuelto",
          style: TextStyle(fontSize: 10),
        ),
        Text(
          "8. Si el inscrito en la Escuela se retire en el transcurso del mes habiendo asistido uno o más días, el valor debitado No será devuelto",
          style: TextStyle(fontSize: 10),
        ),
        Text(
          "9. No habrá reposición de dinero, únicamente se repondrá con clases dentro del mes, siempre que presente la debida justificación.",
          style: TextStyle(fontSize: 10),
        ),
        Text(
          "10. Los Reversos se harán únicamente en Casos Especiales; el representante deberá solicitar el reverso por escrito (carta o email) dirigida al Coordinador de Deportes ",
          style: TextStyle(fontSize: 10),
        ),
      ],
    );
  }

  static Widget buildTotal(ModelFamiliares invoice) {
    // final netTotal = invoice.listdetalle
    //     .map((item) =>
    //         double.parse(item.precio.toStringAsFixed(2)) * item.cantidad)
    //     .reduce((item1, item2) => item1 + item2);

    // final vatPercent = invoice.items.first.vat;
    // final vat = netTotal * vatPercent;
    // final total = netTotal + vat;

    return Container(
      alignment: Alignment.centerRight,
      child: Row(
        children: [
          Spacer(flex: 6),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // buildText(
                //   title: 'total',
                //   //value: Utils.formatPrice(netTotal),
                //   value: formatPrice(netTotal),
                //   unite: true,
                // ),

                // buildText(
                //   title: 'Vat ${vatPercent * 100} %',
                //   value: Utils.formatPrice(vat),
                //   unite: true,
                // ),
                // Divider(),
                // buildText(
                //   title: 'Total amount due',
                //   titleStyle: TextStyle(
                //     fontSize: 14,
                //     fontWeight: FontWeight.bold,
                //   ),
                //   value: Utils.formatPrice(total),
                //   unite: true,
                // ),
                SizedBox(height: 2 * PdfPageFormat.mm),
                Container(height: 1, color: PdfColors.grey400),
                SizedBox(height: 0.5 * PdfPageFormat.mm),
                Container(height: 1, color: PdfColors.grey400),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
