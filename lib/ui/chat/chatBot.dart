import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({Key? key}) : super(key: key);

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  final TextEditingController _controller = TextEditingController();

  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    super.initState();
  }

  cargaIicial() async {}

  /// Crea la función sendMessage el cuál manejará
  /// la lógica de nuestros mensajes
  void sendMessage(String text) async {
    // Verifica que el texto del usuario no esté vacío
    // si lo está, termina de ejecutar la función
    if (text.isEmpty) return;

    DialogAuthCredentials credentials = await DialogAuthCredentials.fromFile(
        "assets/newagent-bwxt-baf223359569.json");
    final DialogFlowtter _dialogFlowtter =
        DialogFlowtter(credentials: credentials);

    await cargaIicial();

    /// Añade nuestro texto enviado por el usuario en forma de
    /// [Message] a nuestra lista y actualiza el estado del widget
    setState(() {
      addMessage(text, true);
    });

    /// Creamos la [query] que le enviaremos al agente
    /// a partir del texto del usuario
    QueryInput query = QueryInput(
        text: TextInput(
      text: text,
      languageCode: "en",
    ));

    /// Esperamos a que el agente nos responda
    /// El keyword [await] indica a la función que espere a que [detectIntent]
    /// termine de ejecutarse para después continuar con lo que resta de la función
    DetectIntentResponse res = await _dialogFlowtter.detectIntent(
      queryInput: query,
    );

    /// Si el mensaje de la respuesta es nulo, no continuamos con la ejecución
    /// de la función
    if (res.text == null) return;

    /// Si hay un mensaje de respuesta, lo agregamos a la lista y actualizamos
    /// el estado de la app
    setState(() {
      addMessage(res.text ?? "");
    });
  }

  /// La función recibe un mensaje de tipo [Message].
  /// El segundo parámetro entre corchetes quiere decir que ese parámetro
  /// es opcional y que si no se le pasa a la función, será falso
  void addMessage(String message, [bool isUserMessage = false]) {
    messages.add({'message': message, 'isUserMessage': isUserMessage});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: _MessagesList(messages: messages),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            color: Colors.blue,
            child: Row(
              children: [
                /// El Widget [Expanded] se asegura que el campo de texto ocupe
                /// toda la pantalla menos el ancho del [IconButton]
                Expanded(
                  child: TextField(
                    controller: _controller,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.send),
                  onPressed: () {
                    /// Mandamos a llamar la función [sendMessage]
                    sendMessage(_controller.text);

                    /// Limpiamos nuestro campo de texto
                    _controller.clear();
                  },
                ),
              ],
            ), // Fin de la fila
          ),
        ],
      ),
    );
  }
}

class _MessagesList extends StatelessWidget {
  /// El componente recibirá una lista de mensajes
  final List<Map<String, dynamic>> messages;
  const _MessagesList({
    Key? key,

    /// Le indicamos al componente que la lista estará vacía en
    /// caso de que no se le pase como argumento alguna otra lista
    this.messages = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Regresaremos una [ListView] con el constructor [separated]
    /// para que después de cada elemento agregue un espacio
    return ListView.separated(
      /// Indicamos el número de items que tendrá
      itemCount: messages.length,

      // Agregamos espaciado
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),

      /// Indicamos que agregue un espacio entre cada elemento
      separatorBuilder: (_, i) => const SizedBox(height: 10),
      itemBuilder: (context, i) {
        /// Obtenemos el objecto actual
        var obj = messages[messages.length - 1 - i];
        return _MessageContainer(
          /// Obtenemos el mensaje del objecto actual
          message: obj['message'],

          /// Diferenciamos si es un mensaje o una respuesta
          isUserMessage: obj['isUserMessage'],
        );
      },
      reverse: true,
    );
  }
}

class _MessageContainer extends StatelessWidget {
  final String message;
  final bool isUserMessage;

  const _MessageContainer({
    Key? key,

    /// Indicamos que siempre se debe mandar un mensaje
    required this.message,
    this.isUserMessage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      /// Cambia el lugar del mensaje
      mainAxisAlignment:
          isUserMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          /// Limita nuestro contenedor a un ancho máximo de 250
          constraints: BoxConstraints(maxWidth: 250),
          child: Container(
            decoration: BoxDecoration(
              /// Cambia el color del contenedor del mensaje
              color: isUserMessage ? Colors.blue : Colors.orange,

              /// Le agrega border redondeados
              borderRadius: BorderRadius.circular(20),
            ),

            /// Espaciado
            padding: const EdgeInsets.all(10),
            child: Text(
              /// Obtenemos el texto del mensaje y lo pintamos.
              /// Si es nulo, enviamos un string vacío.
              message ,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
