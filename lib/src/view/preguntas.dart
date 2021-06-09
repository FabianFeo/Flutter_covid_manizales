import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Preguntas extends StatefulWidget {
  Preguntas({Key key}) : super(key: key);

  @override
  _PreguntasState createState() => _PreguntasState();
}

class _PreguntasState extends State<Preguntas> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: HexColor('#DDE9ED'),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: width / 11, top: height / 40),
                child: Text('Preguntas Frecuentes',
                    style: TextStyle(
                        color: HexColor('#103E68'),
                        fontFamily: 'Roboto-Bold',
                        fontSize: 24)),
              ),
              Divider(
                color: HexColor('#49657A'),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: width / 11, top: height / 40),
                child: Text('¿Qué es Covidalert?',
                    style: TextStyle(
                        color: HexColor('#103E68'),
                        fontFamily: 'Roboto-Bold',
                        fontSize: 18)),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                    top: height / 50, left: width / 15, right: width / 15),
                child: Text(
                  'El Sistema de Apoyo para alertas tempranas de posibles contagios mediante técnicas de análisis de datos también conocido como Covidalert es un proyecto de la Universidad Nacional de Colombia, con el que se genera información vital para la toma de decisiones y la prevención del COVID - 19 en Manizales y Caldas.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: HexColor('#49657A'),
                      fontSize: 16,
                      fontFamily: 'Roboto-Light'),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: width / 11, top: height / 40),
                child: Text('¿Qué se puede hacer con Covidalert?',
                    style: TextStyle(
                        color: HexColor('#103E68'),
                        fontFamily: 'Roboto-Bold',
                        fontSize: 18)),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                    top: height / 50, left: width / 15, right: width / 15),
                child: Text(
                  'Covidalert te ofrecerá información sobre la dinámica de la epidemia en Manizales y Caldas, a través de diferentes opciones puedes visualizar:',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: HexColor('#49657A'),
                      fontSize: 16,
                      fontFamily: 'Roboto-Light'),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                    top: height / 50, left: width / 10, right: width / 15),
                child: Text(
                  'Probabilidad de cambio de tendencia de contagio en los municipios de Caldas o comunas de Manizales, basados en índices de preparación y severidad.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: HexColor('#49657A'),
                      fontSize: 16,
                      fontFamily: 'Roboto-Light'),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                    top: height / 50, left: width / 10, right: width / 15),
                child: Text(
                  'Curvas de predicción para los municipios de Caldas y las comunas de Manizales.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: HexColor('#49657A'),
                      fontSize: 16,
                      fontFamily: 'Roboto-Light'),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                    top: height / 50, left: width / 10, right: width / 15),
                child: Text(
                  'Probabilidad de exposición a un contagio en los municipios de Caldas o comunas de Manizales',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: HexColor('#49657A'),
                      fontSize: 16,
                      fontFamily: 'Roboto-Light'),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                    top: height / 50, left: width / 10, right: width / 15),
                child: Text(
                  'Además, puedes crear tu perfil (registrarte) en donde podrás visualizar la probabilidad de contagio con tu red de contactos.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: HexColor('#49657A'),
                      fontSize: 16,
                      fontFamily: 'Roboto-Light'),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                    top: height / 50, left: width / 10, right: width / 15),
                child: Text(
                  'Registrar visitas en lugares con el código QR y/o dispositivos IoT.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: HexColor('#49657A'),
                      fontSize: 16,
                      fontFamily: 'Roboto-Light'),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                    top: height / 50, left: width / 10, right: width / 15),
                child: Text(
                  'Todas estas opciones sirven para que puedas tomar las decisiones oportunas al momento de tu desplazamiento y así evitar el contagio por Covid-19.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: HexColor('#49657A'),
                      fontSize: 16,
                      fontFamily: 'Roboto-Light'),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: width / 11, top: height / 40),
                child: Text('¿Para qué sirve el semáforo de alertas?',
                    style: TextStyle(
                        color: HexColor('#103E68'),
                        fontFamily: 'Roboto-Bold',
                        fontSize: 18)),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                    top: height / 50, left: width / 15, right: width / 15),
                child: Text(
                  'El semáforo de alertas de Covid-19 sirve para monitorear el comportamiento de Covid-19 en Manizales y con base a ello disminuir el avance de la enfermedad. El semáforo de alertas se actualiza constantemente para que tomes las medidas oportunas.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: HexColor('#49657A'),
                      fontSize: 16,
                      fontFamily: 'Roboto-Light'),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                    top: height / 50, left: width / 15, right: width / 15),
                child: Text(
                  'Teniendo en cuenta cada color (situación de alerta) se tiene:',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: HexColor('#49657A'),
                      fontSize: 16,
                      fontFamily: 'Roboto-Light'),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                    top: height / 50, left: width / 10, right: width / 15),
                child: Text(
                  'Verde: Es el nivel bajo del semáforo y representa que no hay riesgo de contagio cercano. ',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: HexColor('#49657A'),
                      fontSize: 16,
                      fontFamily: 'Roboto-Light'),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                    top: height / 50, left: width / 10, right: width / 15),
                child: Text(
                  'Naranja: Es el nivel medio del semáforo y significa que hay una leve probabilidad de contagio por ende es cuando se deben tomar las medidas de protección y sanitarias y para evitar contagios.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: HexColor('#49657A'),
                      fontSize: 16,
                      fontFamily: 'Roboto-Light'),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                    top: height / 50, left: width / 10, right: width / 15),
                child: Text(
                  'Rojo: Es el nivel alto del semáforo y hay que tener cuidado, se recomienda no desplazarse a ningún sitio para así disminuir la propagación del virus.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: HexColor('#49657A'),
                      fontSize: 16,
                      fontFamily: 'Roboto-Light'),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: width / 11, top: height / 40),
                child: Text('¿Que es un contacto cercano? ',
                    style: TextStyle(
                        color: HexColor('#103E68'),
                        fontFamily: 'Roboto-Bold',
                        fontSize: 18)),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                    top: height / 50, left: width / 15, right: width / 15),
                child: Text(
                  'Un contacto cercano es una persona con la que tuviste contacto a menos de dos metros de distancia y más de diez minutos.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: HexColor('#49657A'),
                      fontSize: 16,
                      fontFamily: 'Roboto-Light'),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: width / 11, top: height / 40),
                child: Text('¿Qué es un contacto fuerte? ',
                    style: TextStyle(
                        color: HexColor('#103E68'),
                        fontFamily: 'Roboto-Bold',
                        fontSize: 18)),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                    top: height / 50, left: width / 15, right: width / 15),
                child: Text(
                  'Un contacto fuerte es una persona con la que tienes una relación cercana y te mantienes en contacto frecuentemente.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: HexColor('#49657A'),
                      fontSize: 16,
                      fontFamily: 'Roboto-Light'),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: width / 11, top: height / 40),
                child: Text('¿Cómo funciona el mapa de contagios? ',
                    style: TextStyle(
                        color: HexColor('#103E68'),
                        fontFamily: 'Roboto-Bold',
                        fontSize: 18)),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                    top: height / 50, left: width / 15, right: width / 15),
                child: Text(
                  'El mapa de contagio sirve para identificar los lugares con mayor probabilidad de contagio por Covid-19, se podrá identificar por medio de tres colores: verde (probabilidad baja), naranja (probabilidad media), y rojo (probabilidad alta), de esta forma el usuario puede tomar las medidas de prevención pertinentes para su desplazamiento',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: HexColor('#49657A'),
                      fontSize: 16,
                      fontFamily: 'Roboto-Light'),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: width / 11, top: height / 40),
                child: Text('¿Qué es “Mi Red de Contactos?',
                    style: TextStyle(
                        color: HexColor('#103E68'),
                        fontFamily: 'Roboto-Bold',
                        fontSize: 18)),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                    top: height / 50, left: width / 15, right: width / 15),
                child: Text(
                  'La red de contactos es una red que se construye de contactos cercanos, a través de invitaciones, rastreando contacto vía bluetooth y a través de registro de ubicaciones vía dispositivos IoT y códigos QR, sirve para alertar de forma temprana si estuviste en contacto o en un lugar con una persona diagnosticada con Covid-19.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: HexColor('#49657A'),
                      fontSize: 16,
                      fontFamily: 'Roboto-Light'),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: width / 11, top: height / 40),
                child: Text('¿Para qué sirve reportar contagio Covid-19?',
                    style: TextStyle(
                        color: HexColor('#103E68'),
                        fontFamily: 'Roboto-Bold',
                        fontSize: 18)),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                    top: height / 50, left: width / 15, right: width / 15),
                child: Text(
                  'Reportar el contagio por Covid-19 sirve para notificar de manera oportuna a todas las personas/lugares que tuvieron contacto cercano y de esta forma disminuir y controlar el riesgo de contagio por esta enfermedad.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: HexColor('#49657A'),
                      fontSize: 16,
                      fontFamily: 'Roboto-Light'),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: width / 11, top: height / 40),
                child: Text('¿Qué finalidad tiene reportar la vacuna?',
                    style: TextStyle(
                        color: HexColor('#103E68'),
                        fontFamily: 'Roboto-Bold',
                        fontSize: 18)),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                    top: height / 50, left: width / 15, right: width / 15),
                child: Text(
                  'Si se reporta que el usuario fue vacunado por Covid-19, sirve para tener un control del avance de la vacunación en la población de la ciudad de Manizales.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: HexColor('#49657A'),
                      fontSize: 16,
                      fontFamily: 'Roboto-Light'),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: width / 11, top: height / 40),
                child: Text('¿Para qué sirve y cómo funciona el código del QR?',
                    style: TextStyle(
                        color: HexColor('#103E68'),
                        fontFamily: 'Roboto-Bold',
                        fontSize: 18)),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                    top: height / 50, left: width / 15, right: width / 15),
                child: Text(
                  'El registro de visitas usando códigos QR se diseñó para utilizarse en lugares con afluencia de personas como restaurantes o locales comerciales. Escanear los códigos QR usando Covidalert te permite cuidarte y cuidar a los demás.por cada vez que escaneas un código, puedes recibir información sobre una posible exposición a un contagio o informar a las personas que estuvieron en el mismo lugar y en el mismo momento en caso de que seas diagnosticado con Covid-19. te llega una notificación a la aplicación de Covidalert informando lo sucedido y pidiendo estar atento a la aparición de síntomas, también te permite identificar lugares que pudieron ser focos de contagio',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: HexColor('#49657A'),
                      fontSize: 16,
                      fontFamily: 'Roboto-Light'),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: width / 11, top: height / 40),
                child: Text('¿Cómo funciona el registro de visitas usando dispositivos IoT?',
                    style: TextStyle(
                        color: HexColor('#103E68'),
                        fontFamily: 'Roboto-Bold',
                        fontSize: 18)),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                    top: height / 50, left: width / 15, right: width / 15),
                child: Text(
                  'El registro de visitas usando dispositivos IoT se diseñó para que de manera automática el teléfono pueda registrar la visita automáticamente si el bluetooth está activado, de esta manera te permite cuidarte  y cuidar a los demás, cada vez que alguien reporte estar diagnosticado con Covid-19 y haya coincidido contigo en el lugar, te llega una notificación a la aplicación de Covidalert informando lo sucedido y pidiendo estar atento a la aparición de síntomas, también te permite identificar lugares que pudieron ser focos de contagio ',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: HexColor('#49657A'),
                      fontSize: 16,
                      fontFamily: 'Roboto-Light'),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: width / 11, top: height / 40),
                child: Text('¿Cómo funciona el rastreo de contactos cercanos a través de Bluetooth de baja energía (BLE)?',
                    style: TextStyle(
                        color: HexColor('#103E68'),
                        fontFamily: 'Roboto-Bold',
                        fontSize: 18)),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                    top: height / 50, left: width / 15, right: width / 15, bottom: height / 50),
                child: Text(
                  'El rastreo de contactos cercanos a través de bluetooth de baja energía (BLE) verifica las condiciones para determinar si hay un contacto cercano, en caso de haberlo los teléfonos intercambian claves secretas para registrar el contacto (ambos dispositivos deben tener la aplicación Covidalert instalada y el bluetooth encendido) y en caso de que alguien informe estar diagnosticado con Covid-19 desencadena alertas a todos los usuarios registrados como contactos cercanos',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: HexColor('#49657A'),
                      fontSize: 16,
                      fontFamily: 'Roboto-Light'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
