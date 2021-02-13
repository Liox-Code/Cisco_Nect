/*INSERT DATA IN DATABASE*/

/*PREGUNTAS*/

/* CAPITULO 1 */
INSERT INTO preguntas VALUES( "PRE_01_01", "¿Seleccione una característica de una red peer-to-peer?", "FACIL", 1);
INSERT INTO respuesta VALUES( "RES_01_01_C_01", "Fácil de crear", 1);
INSERT INTO respuesta VALUES( "RES_01_01_C_02", "Carece de administración centralizada", 1);
INSERT INTO respuesta VALUES( "RES_01_01_C_03", "Menor costo para implementar", 1);
INSERT INTO respuesta VALUES( "RES_01_01_I_01", "Mejor seguridad", 1);
INSERT INTO respuesta VALUES( "RES_01_01_I_02", "Mejor rendimiento del dispositivo cuando actúa como cliente y servidor", 1);
INSERT INTO respuesta VALUES( "RES_01_01_I_03", "Escalable", 1);

INSERT INTO res_pre VALUES( "PRE_01_01", "RES_01_01_C_01", 1);
INSERT INTO res_pre VALUES( "PRE_01_01", "RES_01_01_C_02", 1);
INSERT INTO res_pre VALUES( "PRE_01_01", "RES_01_01_C_03", 1);
INSERT INTO res_pre VALUES( "PRE_01_01", "RES_01_01_I_01", 0);
INSERT INTO res_pre VALUES( "PRE_01_01", "RES_01_01_I_02", 0);
INSERT INTO res_pre VALUES( "PRE_01_01", "RES_01_01_I_03", 0);

INSERT INTO preguntas VALUES( "PRE_01_02", "¿Qué dispositivo se utiliza para determinar la ruta que deben de tomar los mensajes a través de la red?", "FACIL", 1);
INSERT INTO preguntas VALUES( "PRE_01_03", "¿Qué dispositivo se utiliza para filtrar el tráfico entrante y saliente?", "FACIL", 1);
INSERT INTO preguntas VALUES( "PRE_01_04", "¿Qué dispositivo se utiliza para proporcionar conexión a internet a una organización o casa?", "FACIL", 1);
INSERT INTO respuesta VALUES( "RES_01_02_CI_01", "Un router", 1);
INSERT INTO respuesta VALUES( "RES_01_02_CI_02", "Un servidor de seguridad", 1);
INSERT INTO respuesta VALUES( "RES_01_02_CI_03", "Un módem DSL", 1);
INSERT INTO respuesta VALUES( "RES_01_02_I_01", "Un servidor web", 1);

INSERT INTO res_pre VALUES( "PRE_01_02", "RES_01_02_CI_01", 1);
INSERT INTO res_pre VALUES( "PRE_01_02", "RES_01_02_CI_02", 0);
INSERT INTO res_pre VALUES( "PRE_01_02", "RES_01_02_CI_03", 0);
INSERT INTO res_pre VALUES( "PRE_01_02", "RES_01_02_I_01", 0);

INSERT INTO res_pre VALUES( "PRE_01_03", "RES_01_02_CI_01", 0);
INSERT INTO res_pre VALUES( "PRE_01_03", "RES_01_02_CI_02", 1);
INSERT INTO res_pre VALUES( "PRE_01_03", "RES_01_02_CI_03", 0);
INSERT INTO res_pre VALUES( "PRE_01_03", "RES_01_02_I_01", 0);

INSERT INTO res_pre VALUES( "PRE_01_04", "RES_01_02_CI_01", 0);
INSERT INTO res_pre VALUES( "PRE_01_04", "RES_01_02_CI_02", 0);
INSERT INTO res_pre VALUES( "PRE_01_04", "RES_01_02_CI_03", 1);
INSERT INTO res_pre VALUES( "PRE_01_04", "RES_01_02_I_01", 0);


INSERT INTO preguntas VALUES( "PRE_01_05", "¿Qué criterio se utiliza para ayudar a seleccionar un medio de red entre diversos medios de comunicación de la red?", "FACIL", 1);
INSERT INTO respuesta VALUES( "RES_01_05_C_01", "la distancia que el medio seleccionado puede realizar con éxito una señal", 1);
INSERT INTO respuesta VALUES( "RES_01_05_C_02", "el entorno en el que el medio seleccionado se va a instalar", 1);
INSERT INTO respuesta VALUES( "RES_01_05_I_01", "los tipos de datos que deben ser priorizados", 1);
INSERT INTO respuesta VALUES( "RES_01_05_I_02", "el coste de los dispositivos finales utilizados en la red", 1);
INSERT INTO respuesta VALUES( "RES_01_05_I_03", "el número de dispositivos intermediarios instalados en la red", 1);

INSERT INTO res_pre VALUES( "PRE_01_05", "RES_01_05_C_01", 1);
INSERT INTO res_pre VALUES( "PRE_01_05", "RES_01_05_C_02", 1);
INSERT INTO res_pre VALUES( "PRE_01_05", "RES_01_05_I_01", 0);
INSERT INTO res_pre VALUES( "PRE_01_05", "RES_01_05_I_02", 0);
INSERT INTO res_pre VALUES( "PRE_01_05", "RES_01_05_I_03", 0);

INSERT INTO preguntas VALUES( "PRE_01_06", "¿Qué afirmación describe a los dispositivos intermediarios?", "FACIL", 1);
INSERT INTO respuesta VALUES( "RES_01_06_C_01", "dispositivos intermediarios dirigen el camino de los datos.", 1);
INSERT INTO respuesta VALUES( "RES_01_06_C_02", "dispositivos intermediarios conectan los hosts individuales a la red.", 1);
INSERT INTO respuesta VALUES( "RES_01_06_I_01", "dispositivos intermediarios generan contenido de datos.", 1);
INSERT INTO respuesta VALUES( "RES_01_06_I_02", "dispositivos intermediarios alteran el contenido de datos.", 1);
INSERT INTO respuesta VALUES( "RES_01_06_I_03", "dispositivos intermediarios inician el proceso de encapsulación.", 1);

INSERT INTO res_pre VALUES( "PRE_01_06", "RES_01_06_C_01", 1);
INSERT INTO res_pre VALUES( "PRE_01_06", "RES_01_06_C_02", 1);
INSERT INTO res_pre VALUES( "PRE_01_06", "RES_01_06_I_01", 0);
INSERT INTO res_pre VALUES( "PRE_01_06", "RES_01_06_I_02", 0);
INSERT INTO res_pre VALUES( "PRE_01_06", "RES_01_06_I_03", 0);

INSERT INTO preguntas VALUES( "PRE_01_07", "¿Qué  función realizan los dispositivos finales de una red?", "FACIL", 1);
INSERT INTO respuesta VALUES( "RES_01_07_C_01", "Se originan los datos que fluyen a través de la red.", 1);
INSERT INTO respuesta VALUES( "RES_01_07_C_02", "Ellos son la interfaz entre el hombre y la red de comunicación.", 1);
INSERT INTO respuesta VALUES( "RES_01_07_I_01", "Dirigen datos a través de rutas alternativas en caso de fallos de enlace.", 1);
INSERT INTO respuesta VALUES( "RES_01_07_I_02", "Filtran el flujo de datos para mejorar la seguridad.", 1);
INSERT INTO respuesta VALUES( "RES_01_07_I_03", "Proporcionan el canal por el cual viaja el mensaje de red.", 1);

INSERT INTO res_pre VALUES( "PRE_01_07", "RES_01_07_C_01", 1);
INSERT INTO res_pre VALUES( "PRE_01_07", "RES_01_07_C_02", 1);
INSERT INTO res_pre VALUES( "PRE_01_07", "RES_01_07_I_01", 0);
INSERT INTO res_pre VALUES( "PRE_01_07", "RES_01_07_I_02", 0);
INSERT INTO res_pre VALUES( "PRE_01_07", "RES_01_07_I_03", 0);

INSERT INTO preguntas VALUES( "PRE_01_08", "¿Qué área de red es necesaria en la empresa como resultado de uso de tabletas, laptops y smartphones utilizados por los empleados para tener acceso a los recursos de la empresa?", "FACIL", 1);
INSERT INTO respuesta VALUES( "RES_01_08_C_01", "LAN inalámbrico", 1);
INSERT INTO respuesta VALUES( "RES_01_08_I_01", "Extranet", 1);
INSERT INTO respuesta VALUES( "RES_01_08_I_02", "Intranet", 1);
INSERT INTO respuesta VALUES( "RES_01_08_I_03", "LAN cableada", 1);
INSERT INTO respuesta VALUES( "RES_01_08_I_04", "WAN inalámbrica", 1);

INSERT INTO res_pre VALUES( "PRE_01_08", "RES_01_08_C_01", 1);
INSERT INTO res_pre VALUES( "PRE_01_08", "RES_01_08_I_01", 0);
INSERT INTO res_pre VALUES( "PRE_01_08", "RES_01_08_I_02", 0);
INSERT INTO res_pre VALUES( "PRE_01_08", "RES_01_08_I_03", 0);
INSERT INTO res_pre VALUES( "PRE_01_08", "RES_01_08_I_04", 0);

INSERT INTO preguntas VALUES( "PRE_01_09", "¿Qué tipo de red necesita una persona en su casa para hacer compras en línea?", "FACIL", 1);
INSERT INTO respuesta VALUES( "RES_01_09_C_01", "La Internet", 1);
INSERT INTO respuesta VALUES( "RES_01_09_I_01", "Una intranet", 1);
INSERT INTO respuesta VALUES( "RES_01_09_I_02", "Una extranet", 1);
INSERT INTO respuesta VALUES( "RES_01_09_I_03", "Una red de área local", 1);

INSERT INTO res_pre VALUES( "PRE_01_09", "RES_01_09_C_01", 1);
INSERT INTO res_pre VALUES( "PRE_01_09", "RES_01_09_I_01", 0);
INSERT INTO res_pre VALUES( "PRE_01_09", "RES_01_09_I_02", 0);
INSERT INTO res_pre VALUES( "PRE_01_09", "RES_01_09_I_03", 0);

INSERT INTO preguntas VALUES( "PRE_01_10", "Un empleado necesita acceder a la información en los servidores de la oficina central. ¿A qué tipo de red necesita acceso el empleado?", "FACIL", 1);
INSERT INTO respuesta VALUES( "RES_01_10_C_01", "Una intranet", 1);
INSERT INTO respuesta VALUES( "RES_01_10_I_01", "La Internet", 1);
INSERT INTO respuesta VALUES( "RES_01_10_I_02", "Una extranet", 1);
INSERT INTO respuesta VALUES( "RES_01_10_I_03", "Una red de área local", 1);

INSERT INTO res_pre VALUES( "PRE_01_10", "RES_01_10_C_01", 1);
INSERT INTO res_pre VALUES( "PRE_01_10", "RES_01_10_I_01", 0);
INSERT INTO res_pre VALUES( "PRE_01_10", "RES_01_10_I_02", 0);
INSERT INTO res_pre VALUES( "PRE_01_10", "RES_01_10_I_03", 0);

INSERT INTO preguntas VALUES( "PRE_01_11", "¿Qué opción de conexión proporciona un gran ancho de banda y una conexión permanente a Internet?", "FACIL", 1);
INSERT INTO respuesta VALUES( "RES_01_11_C_01", "DSL", 1);
INSERT INTO respuesta VALUES( "RES_01_11_C_02", "Cable", 1);
INSERT INTO respuesta VALUES( "RES_01_11_I_01", "Satélite", 1);
INSERT INTO respuesta VALUES( "RES_01_11_I_02", "Datos móviles", 1);
INSERT INTO respuesta VALUES( "RES_01_11_I_03", "Teléfono de dial-up", 1);

INSERT INTO res_pre VALUES( "PRE_01_11", "RES_01_11_C_01", 1);
INSERT INTO res_pre VALUES( "PRE_01_11", "RES_01_11_C_02", 1);
INSERT INTO res_pre VALUES( "PRE_01_11", "RES_01_11_I_01", 0);
INSERT INTO res_pre VALUES( "PRE_01_11", "RES_01_11_I_02", 0);
INSERT INTO res_pre VALUES( "PRE_01_11", "RES_01_11_I_03", 0);

INSERT INTO preguntas VALUES( "PRE_01_12", "¿Qué opción de conexión a Internet no requiere cables físicos?", "FACIL", 1);
INSERT INTO respuesta VALUES( "RES_01_12_C_01", "Datos móviles", 1);
INSERT INTO respuesta VALUES( "RES_01_12_C_02", "Satélite", 1);
INSERT INTO respuesta VALUES( "RES_01_12_I_01", "DSL", 1);
INSERT INTO respuesta VALUES( "RES_01_12_I_02", "Linea arrendad dedicada", 1);
INSERT INTO respuesta VALUES( "RES_01_12_I_03", "Dial-up", 1);

INSERT INTO res_pre VALUES( "PRE_01_12", "RES_01_12_C_01", 1);
INSERT INTO res_pre VALUES( "PRE_01_12", "RES_01_12_C_02", 1);
INSERT INTO res_pre VALUES( "PRE_01_12", "RES_01_12_I_01", 0);
INSERT INTO res_pre VALUES( "PRE_01_12", "RES_01_12_I_02", 0);
INSERT INTO res_pre VALUES( "PRE_01_12", "RES_01_12_I_03", 0);

INSERT INTO preguntas VALUES( "PRE_01_13", "¿Qué término describe el estado de una red cuando la demanda sobre los recursos de la red excede la capacidad disponible?", "FACIL", 1);
INSERT INTO respuesta VALUES( "RES_01_13_C_01", "Congestión", 1);
INSERT INTO respuesta VALUES( "RES_01_13_I_01", "Convergencia", 1);
INSERT INTO respuesta VALUES( "RES_01_13_I_02", "Optimización", 1);
INSERT INTO respuesta VALUES( "RES_01_13_I_03", "Sincronización", 1);

INSERT INTO res_pre VALUES( "PRE_01_13", "RES_01_13_C_01", 1);
INSERT INTO res_pre VALUES( "PRE_01_13", "RES_01_13_I_01", 0);
INSERT INTO res_pre VALUES( "PRE_01_13", "RES_01_13_I_02", 0);
INSERT INTO res_pre VALUES( "PRE_01_13", "RES_01_13_I_03", 0);

INSERT INTO preguntas VALUES( "PRE_01_14", "¿Qué tipo de tráfico de red requiere QoS?", "FACIL", 1);
INSERT INTO respuesta VALUES( "RES_01_14_C_01", "Videoconferencia", 1);
INSERT INTO respuesta VALUES( "RES_01_14_I_01", "Correo Electrónico", 1);
INSERT INTO respuesta VALUES( "RES_01_14_I_02", "Compras en Línea", 1);
INSERT INTO respuesta VALUES( "RES_01_14_I_03", "Wiki", 1);

INSERT INTO res_pre VALUES( "PRE_01_14", "RES_01_14_C_01", 1);
INSERT INTO res_pre VALUES( "PRE_01_14", "RES_01_14_I_01", 0);
INSERT INTO res_pre VALUES( "PRE_01_14", "RES_01_14_I_02", 0);
INSERT INTO res_pre VALUES( "PRE_01_14", "RES_01_14_I_03", 0);

INSERT INTO preguntas VALUES( "PRE_01_15", "¿Qué expresión define el término ancho de banda?", "FACIL", 1);
INSERT INTO respuesta VALUES( "RES_01_15_C_01", "Medida de la capacidad de transporte de datos de los medios de comunicación", 1);
INSERT INTO respuesta VALUES( "RES_01_15_I_01", "Estado en el cual la demanda de los recursos de red excede la capacidad disponible", 1);
INSERT INTO respuesta VALUES( "RES_01_15_I_02", "Conjunto de técnicas para administrar la utilización de recursos de red", 1);
INSERT INTO respuesta VALUES( "RES_01_15_I_03", "Método para limitar el efecto de una falla de hardware o de software en la red", 1);

INSERT INTO res_pre VALUES( "PRE_01_15", "RES_01_15_C_01", 1);
INSERT INTO res_pre VALUES( "PRE_01_15", "RES_01_15_I_01", 0);
INSERT INTO res_pre VALUES( "PRE_01_15", "RES_01_15_I_02", 0);
INSERT INTO res_pre VALUES( "PRE_01_15", "RES_01_15_I_03", 0);

INSERT INTO preguntas VALUES( "PRE_01_16", "¿Qué objetivo de protección de datos es compatible con una política que requiere contraseñas fuertes y complejas?", "FACIL", 1);
INSERT INTO respuesta VALUES( "RES_01_16_C_01", "Confidencialidad de los datos", 1);
INSERT INTO respuesta VALUES( "RES_01_16_I_01", "Integridad de los datos", 1);
INSERT INTO respuesta VALUES( "RES_01_16_I_02", "Calidad de los datos", 1);
INSERT INTO respuesta VALUES( "RES_01_16_I_03", "Redundancia de datos", 1);

INSERT INTO res_pre VALUES( "PRE_01_16", "RES_01_16_C_01", 1);
INSERT INTO res_pre VALUES( "PRE_01_16", "RES_01_16_I_01", 0);
INSERT INTO res_pre VALUES( "PRE_01_16", "RES_01_16_I_02", 0);
INSERT INTO res_pre VALUES( "PRE_01_16", "RES_01_16_I_03", 0);

INSERT INTO preguntas VALUES( "PRE_01_17", "¿Qué afirmación describe una característica de la computación en la nube?", "FACIL", 1);
INSERT INTO respuesta VALUES( "RES_01_17_C_01", "Las aplicaciones pueden ser accedidos a través de Internet por los usuarios individuales o negocios utilizando cualquier dispositivo, en cualquier lugar del mundo.", 1);
INSERT INTO respuesta VALUES( "RES_01_17_I_01", "Un negocio puede conectarse directamente a Internet sin el uso de un proveedor de Internet.", 1);
INSERT INTO respuesta VALUES( "RES_01_17_I_02", "Los dispositivos pueden conectarse a Internet a través del cableado eléctrico existente.", 1);
INSERT INTO respuesta VALUES( "RES_01_17_I_03", "Se requiere la inversión en nueva infraestructura con el fin de acceder a la nube.", 1);

INSERT INTO res_pre VALUES( "PRE_01_17", "RES_01_17_C_01", 1);
INSERT INTO res_pre VALUES( "PRE_01_17", "RES_01_17_I_01", 0);
INSERT INTO res_pre VALUES( "PRE_01_17", "RES_01_17_I_02", 0);
INSERT INTO res_pre VALUES( "PRE_01_17", "RES_01_17_I_03", 0);

INSERT INTO preguntas VALUES( "PRE_01_18", "¿Qué es Internet?", "FACIL", 1);
INSERT INTO respuesta VALUES( "RES_01_18_C_01", "Proporciona conexiones a través de redes globales interconectados.", 1);
INSERT INTO respuesta VALUES( "RES_01_18_I_01", "Se trata de una red basada en la tecnología Ethernet.", 1);
INSERT INTO respuesta VALUES( "RES_01_18_I_02", "Proporciona acceso a la red para dispositivos móviles.", 1);
INSERT INTO respuesta VALUES( "RES_01_18_I_03", "Es una red privada para una organización con conexiones LAN y WAN.", 1);

INSERT INTO res_pre VALUES( "PRE_01_18", "RES_01_18_C_01", 1);
INSERT INTO res_pre VALUES( "PRE_01_18", "RES_01_18_I_01", 0);
INSERT INTO res_pre VALUES( "PRE_01_18", "RES_01_18_I_02", 0);
INSERT INTO res_pre VALUES( "PRE_01_18", "RES_01_18_I_03", 0);

INSERT INTO preguntas VALUES( "PRE_01_19", "¿Qué violación de seguridad provocaria mas daño a la vida de un usuario doméstico?", "FACIL", 1);
INSERT INTO respuesta VALUES( "RES_01_19_C_01", "Captura de datos personales que conduce al robo de identidad", 1);
INSERT INTO respuesta VALUES( "RES_01_19_I_01", "Denegación de servicio a su servidor de correo electrónico", 1);
INSERT INTO respuesta VALUES( "RES_01_19_I_02", "La replicación del virus y gusanos en su ordenador", 1);
INSERT INTO respuesta VALUES( "RES_01_19_I_03", "Software espía que conduce a los correos electrónicos de spam", 1);

INSERT INTO res_pre VALUES( "PRE_01_19", "RES_01_19_C_01", 1);
INSERT INTO res_pre VALUES( "PRE_01_19", "RES_01_19_I_01", 0);
INSERT INTO res_pre VALUES( "PRE_01_19", "RES_01_19_I_02", 0);
INSERT INTO res_pre VALUES( "PRE_01_19", "RES_01_19_I_03", 0);

INSERT INTO preguntas VALUES( "PRE_01_20", "¿Qué acción es un requisito mínimo de seguridad para una red en una oficina pequeña?", "FACIL", 1);
INSERT INTO respuesta VALUES( "RES_01_20_C_01", "La implementación de un servidor de seguridad", 1);
INSERT INTO respuesta VALUES( "RES_01_20_C_02", "Instalar un software antivirus", 1);
INSERT INTO respuesta VALUES( "RES_01_20_I_01", "La instalación de una red inalámbrica", 1);
INSERT INTO respuesta VALUES( "RES_01_20_I_02", "Implementación de un sistema de detección de intrusos", 1);
INSERT INTO respuesta VALUES( "RES_01_20_I_03", "La adición de un dispositivo de prevención de intrusiones dedicada", 1);

INSERT INTO res_pre VALUES( "PRE_01_20", "RES_01_20_C_01", 1);
INSERT INTO res_pre VALUES( "PRE_01_20", "RES_01_20_C_02", 1);
INSERT INTO res_pre VALUES( "PRE_01_20", "RES_01_20_I_01", 0);
INSERT INTO res_pre VALUES( "PRE_01_20", "RES_01_20_I_02", 0);
INSERT INTO res_pre VALUES( "PRE_01_20", "RES_01_20_I_03", 0);

INSERT INTO preguntas VALUES( "PRE_01_21", "¿Seleccione una característica del tipo conectividad a internet por satélite?", "FACIL", 1);
INSERT INTO preguntas VALUES( "PRE_01_22", "¿Seleccione una característica del tipo conectividad a internet telefónica doméstica?", "FACIL", 1);
INSERT INTO preguntas VALUES( "PRE_01_23", "¿Seleccione una característica del tipo conectividad a internet por DSL?", "FACIL", 1);
INSERT INTO preguntas VALUES( "PRE_01_24", "¿Seleccione una característica del tipo conectividad a internet por Cable?", "FACIL", 1);
INSERT INTO respuesta VALUES( "RES_01_21_CI_01", "No es adecuado para áreas con muchos árboles", 1);
INSERT INTO respuesta VALUES( "RES_01_21_CI_02", "Normalmente tiene muy poco ancho de banda", 1);
INSERT INTO respuesta VALUES( "RES_01_21_CI_03", "Conexión de gran ancho de banda que corre a lo largo de la línea telefónica", 1);
INSERT INTO respuesta VALUES( "RES_01_21_CI_04", "Utiliza cable coaxial como medio", 1);

INSERT INTO res_pre VALUES( "PRE_01_21", "RES_01_21_CI_01", 1);
INSERT INTO res_pre VALUES( "PRE_01_21", "RES_01_21_CI_02", 0);
INSERT INTO res_pre VALUES( "PRE_01_21", "RES_01_21_CI_03", 0);
INSERT INTO res_pre VALUES( "PRE_01_21", "RES_01_21_CI_04", 0);

INSERT INTO res_pre VALUES( "PRE_01_22", "RES_01_21_CI_01", 0);
INSERT INTO res_pre VALUES( "PRE_01_22", "RES_01_21_CI_02", 1);
INSERT INTO res_pre VALUES( "PRE_01_22", "RES_01_21_CI_03", 0);
INSERT INTO res_pre VALUES( "PRE_01_22", "RES_01_21_CI_04", 0);

INSERT INTO res_pre VALUES( "PRE_01_23", "RES_01_21_CI_01", 0);
INSERT INTO res_pre VALUES( "PRE_01_23", "RES_01_21_CI_02", 0);
INSERT INTO res_pre VALUES( "PRE_01_23", "RES_01_21_CI_03", 1);
INSERT INTO res_pre VALUES( "PRE_01_23", "RES_01_21_CI_04", 0);

INSERT INTO res_pre VALUES( "PRE_01_24", "RES_01_21_CI_01", 0);
INSERT INTO res_pre VALUES( "PRE_01_24", "RES_01_21_CI_02", 0);
INSERT INTO res_pre VALUES( "PRE_01_24", "RES_01_21_CI_03", 0);
INSERT INTO res_pre VALUES( "PRE_01_24", "RES_01_21_CI_04", 1);

/* CAPITULO 2 */

INSERT INTO preguntas VALUES( "PRE_02_01", "¿Cuál es la función del kernel de un software operativo?", "FACIL", 1);
INSERT INTO respuesta VALUES( "RES_02_01_C_01", "El kernel toma recursos del hardware para cumplir con los requisitos del software.", 1);
INSERT INTO respuesta VALUES( "RES_02_01_I_01", "Proporciona una interfaz de usuario que les permite a los usuarios solicitar una tarea específica.", 1);
INSERT INTO respuesta VALUES( "RES_02_01_I_02", "Es una aplicación que permite la configuración inicial de un dispositivo Cisco.", 1);
INSERT INTO respuesta VALUES( "RES_02_01_I_03", "El kernel enlaza los controladores de hardware con los componentes electrónicos subyacentes de una computadora.", 1);

INSERT INTO res_pre VALUES( "PRE_02_01", "RES_02_01_C_01", 1);
INSERT INTO res_pre VALUES( "PRE_02_01", "RES_02_01_I_01", 0);
INSERT INTO res_pre VALUES( "PRE_02_01", "RES_02_01_I_02", 0);
INSERT INTO res_pre VALUES( "PRE_02_01", "RES_02_01_I_03", 0);

INSERT INTO preguntas VALUES( "PRE_02_02", "Un administrador de red debe mantener la privacidad de la ID de usuario, la contraseña y el contenido de la sesión cuando establece conectividad remota con la CLI con un switch para administrarlo. ¿Qué método de acceso se debe elegir?", "FACIL", 1);
INSERT INTO respuesta VALUES( "RES_02_02_C_01", "SSH", 1);
INSERT INTO respuesta VALUES( "RES_02_02_I_01", "AUX", 1);
INSERT INTO respuesta VALUES( "RES_02_02_I_02", "Telnet", 1);
INSERT INTO respuesta VALUES( "RES_02_02_I_03", "Consola", 1);

INSERT INTO res_pre VALUES( "PRE_02_02", "RES_02_02_C_01", 1);
INSERT INTO res_pre VALUES( "PRE_02_02", "RES_02_02_I_01", 0);
INSERT INTO res_pre VALUES( "PRE_02_02", "RES_02_02_I_02", 0);
INSERT INTO res_pre VALUES( "PRE_02_02", "RES_02_02_I_03", 0);

INSERT INTO preguntas VALUES( "PRE_02_03", "¿Cuál comando o combinación de teclas le permite a un usuario regresar al nivel anterior en la jerarquía de comandos?", "FACIL", 1);
INSERT INTO respuesta VALUES( "RES_02_03_C_01", "exit", 1);
INSERT INTO respuesta VALUES( "RES_02_03_I_01", "end ", 1);
INSERT INTO respuesta VALUES( "RES_02_03_I_02", "Ctrl-Z", 1);
INSERT INTO respuesta VALUES( "RES_02_03_I_03", "Ctrl-C", 1);

INSERT INTO res_pre VALUES( "PRE_02_03", "RES_02_03_C_01", 1);
INSERT INTO res_pre VALUES( "PRE_02_03", "RES_02_03_I_01", 0);
INSERT INTO res_pre VALUES( "PRE_02_03", "RES_02_03_I_02", 0);
INSERT INTO res_pre VALUES( "PRE_02_03", "RES_02_03_I_03", 0);

INSERT INTO preguntas VALUES( "PRE_02_04", "Un router tiene un sistema operativo válido y un archivo de configuración almacenados en la NVRAM. El archivo de configuración contiene una contraseña secreta de enable, pero ninguna contraseña de consola. Cuando el router inicia, ¿qué modo se muestra?", "FACIL", 1);
INSERT INTO respuesta VALUES( "RES_02_04_C_01", "Modo EXEC del usuario", 1);
INSERT INTO respuesta VALUES( "RES_02_04_I_01", "Modo EXEC privilegiado", 1);
INSERT INTO respuesta VALUES( "RES_02_04_I_02", "Modo de configuración", 1);
INSERT INTO respuesta VALUES( "RES_02_04_I_03", "Modo de configuración global", 1);

INSERT INTO res_pre VALUES( "PRE_02_04", "RES_02_04_C_01", 1);
INSERT INTO res_pre VALUES( "PRE_02_04", "RES_02_04_I_01", 0);
INSERT INTO res_pre VALUES( "PRE_02_04", "RES_02_04_I_02", 0);
INSERT INTO res_pre VALUES( "PRE_02_04", "RES_02_04_I_03", 0);

INSERT INTO preguntas VALUES( "PRE_02_05", "¿Qué información muestra el comando show startup-config?", "FACIL", 1);
INSERT INTO respuesta VALUES( "RES_02_05_C_01", "El contenido del archivo de configuración guardado en la NVRAM", 1);
INSERT INTO respuesta VALUES( "RES_02_05_I_01", "El contenido del archivo de configuración en ejecución actual en la RAM", 1);
INSERT INTO respuesta VALUES( "RES_02_05_I_02", "El programa de arranque en la ROM", 1);
INSERT INTO respuesta VALUES( "RES_02_05_I_03", "La imagen de IOS copiada en la RAM", 1);

INSERT INTO res_pre VALUES( "PRE_02_05", "RES_02_05_C_01", 1);
INSERT INTO res_pre VALUES( "PRE_02_05", "RES_02_05_I_01", 0);
INSERT INTO res_pre VALUES( "PRE_02_05", "RES_02_05_I_02", 0);
INSERT INTO res_pre VALUES( "PRE_02_05", "RES_02_05_I_03", 0);

INSERT INTO preguntas VALUES( "PRE_02_06", "¿Por qué es importante configurar un nombre de host en un dispositivo?", "FACIL", 1);
INSERT INTO respuesta VALUES( "RES_02_06_C_01", "Para identificar el dispositivo durante el acceso remoto (SSH o Telnet)", 1);
INSERT INTO respuesta VALUES( "RES_02_06_I_01", "Se debe configurar un nombre de host antes de configurar otros parámetros", 1);
INSERT INTO respuesta VALUES( "RES_02_06_I_02", "Los routers o switches Cisco comienzan a funcionar solamente cuando se establecen sus nombres de host", 1);
INSERT INTO respuesta VALUES( "RES_02_06_I_03", "Para permitir el acceso local al dispositivo mediante el puerto de consola", 1);

INSERT INTO res_pre VALUES( "PRE_02_06", "RES_02_06_C_01", 1);
INSERT INTO res_pre VALUES( "PRE_02_06", "RES_02_06_I_01", 0);
INSERT INTO res_pre VALUES( "PRE_02_06", "RES_02_06_I_02", 0);
INSERT INTO res_pre VALUES( "PRE_02_06", "RES_02_06_I_03", 0);

INSERT INTO preguntas VALUES( "PRE_02_07", "¿Qué nombre de host cumple las pautas de convenciones de nomenclatura en dispositivos con Cisco IOS?", "FACIL", 1);
INSERT INTO respuesta VALUES( "RES_02_07_C_01", "SwBranch799", 1);
INSERT INTO respuesta VALUES( "RES_02_07_C_02", "RM-3-Switch-2A4", 1);
INSERT INTO respuesta VALUES( "RES_02_07_I_01", "HO Floor", 1);
INSERT INTO respuesta VALUES( "RES_02_07_I_02", "Floor(15)", 1);
INSERT INTO respuesta VALUES( "RES_02_07_I_03", "Branch2!", 1);

INSERT INTO res_pre VALUES( "PRE_02_07", "RES_02_07_C_01", 1);
INSERT INTO res_pre VALUES( "PRE_02_07", "RES_02_07_C_02", 1);
INSERT INTO res_pre VALUES( "PRE_02_07", "RES_02_07_I_01", 0);
INSERT INTO res_pre VALUES( "PRE_02_07", "RES_02_07_I_02", 0);
INSERT INTO res_pre VALUES( "PRE_02_07", "RES_02_07_I_03", 0);

INSERT INTO preguntas VALUES( "PRE_02_08", "¿Cómo mejora la seguridad de las contraseñas en los routers y switches Cisco el comando service password-encryption ?", "FACIL", 1);
INSERT INTO respuesta VALUES( "RES_02_08_C_01", "Cifra las contraseñas que se almacenan en los archivos de configuración del router o del switch.", 1);
INSERT INTO respuesta VALUES( "RES_02_08_I_01", "Requiere que se utilicen contraseñas cifradas al conectarse a un router o switch de manera remota mediante Telnet.", 1);
INSERT INTO respuesta VALUES( "RES_02_08_I_02", "Cifra las contraseñas a medida que se envían por la red.", 1);
INSERT INTO respuesta VALUES( "RES_02_08_I_03", "Requiere que un usuario escriba contraseñas cifradas para obtener acceso a la consola del router o del switch.", 1);

INSERT INTO res_pre VALUES( "PRE_02_08", "RES_02_08_C_01", 1);
INSERT INTO res_pre VALUES( "PRE_02_08", "RES_02_08_I_01", 0);
INSERT INTO res_pre VALUES( "PRE_02_08", "RES_02_08_I_02", 0);
INSERT INTO res_pre VALUES( "PRE_02_08", "RES_02_08_I_03", 0);

INSERT INTO preguntas VALUES( "PRE_02_09", "¿Qué puede hacer para descartar cambios hechos en un Router que no se guardaron y trabajar con el archivo en la NVRAM?", "FACIL", 1);
INSERT INTO respuesta VALUES( "RES_02_09_C_01", "Emitir el comando reload sin guardar la configuración en ejecución.", 1);
INSERT INTO respuesta VALUES( "RES_02_09_I_01", "Emitir el comando copy startup-config running-config.", 1);
INSERT INTO respuesta VALUES( "RES_02_09_I_02", "Cerrar y volver a abrir el software de emulación de terminal.", 1);
INSERT INTO respuesta VALUES( "RES_02_09_I_03", "Borrar el archivo vlan.dat y reiniciar el dispositivo.", 1);

INSERT INTO res_pre VALUES( "PRE_02_09", "RES_02_09_C_01", 1);
INSERT INTO res_pre VALUES( "PRE_02_09", "RES_02_09_I_01", 0);
INSERT INTO res_pre VALUES( "PRE_02_09", "RES_02_09_I_02", 0);
INSERT INTO res_pre VALUES( "PRE_02_09", "RES_02_09_I_03", 0);

INSERT INTO preguntas VALUES( "PRE_02_10", "¿Qué afirmación es verdadera acerca del archivo de configuración en ejecución en un dispositivo IOS de Cisco?", "FACIL", 1);
INSERT INTO respuesta VALUES( "RES_02_10_C_01", "Afecta la operación del dispositivo inmediatamente después de modificarse.", 1);
INSERT INTO respuesta VALUES( "RES_02_10_I_01", "Se almacena en la NVRAM.", 1);
INSERT INTO respuesta VALUES( "RES_02_10_I_02", "Se debe eliminar con el comando erase running-config.", 1);
INSERT INTO respuesta VALUES( "RES_02_10_I_03", "Se graba automáticamente al reiniciarse el router.", 1);

INSERT INTO res_pre VALUES( "PRE_02_10", "RES_02_10_C_01", 1);
INSERT INTO res_pre VALUES( "PRE_02_10", "RES_02_10_I_01", 0);
INSERT INTO res_pre VALUES( "PRE_02_10", "RES_02_10_I_02", 0);
INSERT INTO res_pre VALUES( "PRE_02_10", "RES_02_10_I_03", 0);

INSERT INTO preguntas VALUES( "PRE_02_11", "¿Seleccione una característica de la RAM en un dispositivo Cisco?", "FACIL", 1);
INSERT INTO respuesta VALUES( "RES_02_11_C_01", "El contenido de la RAM se pierde al apagar y volver a encender el dispositivo.", 1);
INSERT INTO respuesta VALUES( "RES_02_11_C_02", "La configuración que está activamente en ejecución en el dispositivo se almacena en la RAM.", 1);
INSERT INTO respuesta VALUES( "RES_02_11_I_01", "La RAM proporciona almacenamiento no volátil.", 1);
INSERT INTO respuesta VALUES( "RES_02_11_I_02", "La RAM puede almacenar varias versiones de IOS y de archivos de configuración.", 1);
INSERT INTO respuesta VALUES( "RES_02_11_I_03", "La RAM es un componente de los switches Cisco, pero no de los routers Cisco.", 1);

INSERT INTO res_pre VALUES( "PRE_02_11", "RES_02_11_C_01", 1);
INSERT INTO res_pre VALUES( "PRE_02_11", "RES_02_11_C_02", 1);
INSERT INTO res_pre VALUES( "PRE_02_11", "RES_02_11_I_01", 0);
INSERT INTO res_pre VALUES( "PRE_02_11", "RES_02_11_I_02", 0);
INSERT INTO res_pre VALUES( "PRE_02_11", "RES_02_11_I_03", 0);

INSERT INTO preguntas VALUES( "PRE_02_12", "¿Cuál de estas interfaces permite la administración remota de un switch de capa 2?", "FACIL", 1);
INSERT INTO respuesta VALUES( "RES_02_12_C_01", "La interfaz virtual del switch", 1);
INSERT INTO respuesta VALUES( "RES_02_12_I_01", "La primera interfaz de puerto Ethernet", 1);
INSERT INTO respuesta VALUES( "RES_02_12_I_02", "La interfaz de puerto de consola", 1);
INSERT INTO respuesta VALUES( "RES_02_12_I_03", "La interfaz auxiliar", 1);

INSERT INTO res_pre VALUES( "PRE_02_12", "RES_02_12_C_01", 1);
INSERT INTO res_pre VALUES( "PRE_02_12", "RES_02_12_I_01", 0);
INSERT INTO res_pre VALUES( "PRE_02_12", "RES_02_12_I_02", 0);
INSERT INTO res_pre VALUES( "PRE_02_12", "RES_02_12_I_03", 0);

INSERT INTO preguntas VALUES( "PRE_02_13", "¿Cuál de las siguientes interfaces es la SVI predeterminada en un switch Cisco?", "FACIL", 1);
INSERT INTO respuesta VALUES( "RES_02_13_C_01", "VLAN 1", 1);
INSERT INTO respuesta VALUES( "RES_02_13_I_01", "VLAN 99", 1);
INSERT INTO respuesta VALUES( "RES_02_13_I_02", "GigabitEthernet 0/1", 1);
INSERT INTO respuesta VALUES( "RES_02_13_I_03", "FastEthernet 0/1", 1);

INSERT INTO res_pre VALUES( "PRE_02_13", "RES_02_13_C_01", 1);
INSERT INTO res_pre VALUES( "PRE_02_13", "RES_02_13_I_01", 0);
INSERT INTO res_pre VALUES( "PRE_02_13", "RES_02_13_I_02", 0);
INSERT INTO res_pre VALUES( "PRE_02_13", "RES_02_13_I_03", 0);

INSERT INTO preguntas VALUES( "PRE_02_14", "¿Por qué un switch de capa 2 necesitaría una dirección IP?", "FACIL", 1);
INSERT INTO respuesta VALUES( "RES_02_14_C_01", "Para habilitar el switch de modo que se administre de forma remota", 1);
INSERT INTO respuesta VALUES( "RES_02_14_I_01", "Para habilitar el switch para que reciba tramas de las PC conectadas", 1);
INSERT INTO respuesta VALUES( "RES_02_14_I_02", "Para habilitar el switch para que envíe tramas de broadcast a las PC conectadas", 1);
INSERT INTO respuesta VALUES( "RES_02_14_I_03", "Para habilitar el switch para que funcione como un gateway predeterminado", 1);

INSERT INTO res_pre VALUES( "PRE_02_14", "RES_02_14_C_01", 1);
INSERT INTO res_pre VALUES( "PRE_02_14", "RES_02_14_I_01", 0);
INSERT INTO res_pre VALUES( "PRE_02_14", "RES_02_14_I_02", 0);
INSERT INTO res_pre VALUES( "PRE_02_14", "RES_02_14_I_03", 0);

INSERT INTO preguntas VALUES( "PRE_02_15", "¿Cuál de estos comandos se puede utilizar en un equipo Windows para ver la configuración IP de esa PC?", "FACIL", 1);
INSERT INTO respuesta VALUES( "RES_02_15_C_01", "ipconfig", 1);
INSERT INTO respuesta VALUES( "RES_02_15_I_01", "show interfaces", 1);
INSERT INTO respuesta VALUES( "RES_02_15_I_02", "show ip interface brief", 1);
INSERT INTO respuesta VALUES( "RES_02_15_I_03", "ping", 1);

INSERT INTO res_pre VALUES( "PRE_02_15", "RES_02_15_C_01", 1);
INSERT INTO res_pre VALUES( "PRE_02_15", "RES_02_15_I_01", 0);
INSERT INTO res_pre VALUES( "PRE_02_15", "RES_02_15_I_02", 0);
INSERT INTO res_pre VALUES( "PRE_02_15", "RES_02_15_I_03", 0);

INSERT INTO preguntas VALUES( "PRE_02_16", "Un empleado agregó una nueva PC en la LAN de la empresa. Después de desempaquetar los componentes y realizar todas las conexiones, enciende la PC. Una vez que se carga el SO, el técnico abre un navegador y verifica que la PC tiene conexión a Internet. ¿Por qué pudo la PC conectarse a la red sin configuraciones adicionales?", "FACIL", 1);
INSERT INTO respuesta VALUES( "RES_02_16_C_01", "La PC está preconfigurada para utilizar DHCP.", 1);
INSERT INTO respuesta VALUES( "RES_02_16_I_01", "La PC utiliza DNS para recibir automáticamente información de asignación de direcciones IP de un servidor.", 1);
INSERT INTO respuesta VALUES( "RES_02_16_I_02", "La PC no requiere ninguna información adicional para funcionar en la red.", 1);
INSERT INTO respuesta VALUES( "RES_02_16_I_03", "La interfaz virtual de la PC es compatible con cualquier red.", 1);
INSERT INTO respuesta VALUES( "RES_02_16_I_04", "La PC viene preconfigurada de fábrica con información de asignación de direcciones IP.", 1);

INSERT INTO res_pre VALUES( "PRE_02_16", "RES_02_16_C_01", 1);
INSERT INTO res_pre VALUES( "PRE_02_16", "RES_02_16_I_01", 0);
INSERT INTO res_pre VALUES( "PRE_02_16", "RES_02_16_I_02", 0);
INSERT INTO res_pre VALUES( "PRE_02_16", "RES_02_16_I_03", 0);
INSERT INTO res_pre VALUES( "PRE_02_16", "RES_02_16_I_04", 0);

INSERT INTO preguntas VALUES( "PRE_02_17", "¿Qué intenta determinar un empleado al emitir un comando ping 10.1.1.1 en una PC?", "FACIL", 1);
INSERT INTO respuesta VALUES( "RES_02_17_C_01", "Si hay conectividad con el dispositivo de destino", 1);
INSERT INTO respuesta VALUES( "RES_02_17_I_01", "Qué tipo de dispositivo se encuentra en el destino", 1);
INSERT INTO respuesta VALUES( "RES_02_17_I_02", "Si el stack de TCP/IP funciona en la PC sin colocar tráfico en el cable", 1);
INSERT INTO respuesta VALUES( "RES_02_17_I_03", "La ruta que tomará el tráfico para llegar al destino", 1);

INSERT INTO res_pre VALUES( "PRE_02_17", "RES_02_17_C_01", 1);
INSERT INTO res_pre VALUES( "PRE_02_17", "RES_02_17_I_01", 0);
INSERT INTO res_pre VALUES( "PRE_02_17", "RES_02_17_I_02", 0);
INSERT INTO res_pre VALUES( "PRE_02_17", "RES_02_17_I_03", 0);

INSERT INTO preguntas VALUES( "PRE_02_18", "Seleccione la función de la tecla de “TAB” en la CLI de Cisco IOS.", "FACIL", 1);
INSERT INTO preguntas VALUES( "PRE_02_19", "Seleccione la función de la tecla “Barra Espaciadora” en la CLI de Cisco IOS.", "FACIL", 1);
INSERT INTO preguntas VALUES( "PRE_02_20", "Seleccione la función de la tecla de la “Flecha Arriba” en la CLI de Cisco IOS.", "FACIL", 1);
INSERT INTO preguntas VALUES( "PRE_02_21", "Seleccione la función de comando “?” en la CLI de Cisco IOS.", "FACIL", 1);
INSERT INTO preguntas VALUES( "PRE_02_22", "Seleccione la función del conjunto de teclas “CTRL-MAYUS-6” en la CLI de Cisco IOS.", "FACIL", 1);
INSERT INTO respuesta VALUES( "RES_02_22_CI_01", "Completa comandos y parámetros abreviados.", 1);
INSERT INTO respuesta VALUES( "RES_02_22_CI_02", "Muestra la siguiente pantalla.", 1);
INSERT INTO respuesta VALUES( "RES_02_22_CI_03", "Realiza un desplazamiento hacia atrás por los comandos introducidos anteriormente.", 1);
INSERT INTO respuesta VALUES( "RES_02_22_CI_04", "Proporciona ayuda contextual.", 1);
INSERT INTO respuesta VALUES( "RES_02_22_CI_05", "Anula los comandos como trace y ping.", 1);

INSERT INTO res_pre VALUES( "PRE_02_18", "RES_02_22_CI_01", 1);
INSERT INTO res_pre VALUES( "PRE_02_18", "RES_02_22_CI_02", 0);
INSERT INTO res_pre VALUES( "PRE_02_18", "RES_02_22_CI_03", 0);
INSERT INTO res_pre VALUES( "PRE_02_18", "RES_02_22_CI_04", 0);
INSERT INTO res_pre VALUES( "PRE_02_18", "RES_02_22_CI_05", 0);

INSERT INTO res_pre VALUES( "PRE_02_19", "RES_02_22_CI_01", 0);
INSERT INTO res_pre VALUES( "PRE_02_19", "RES_02_22_CI_02", 1);
INSERT INTO res_pre VALUES( "PRE_02_19", "RES_02_22_CI_03", 0);
INSERT INTO res_pre VALUES( "PRE_02_19", "RES_02_22_CI_04", 0);
INSERT INTO res_pre VALUES( "PRE_02_19", "RES_02_22_CI_05", 0);

INSERT INTO res_pre VALUES( "PRE_02_20", "RES_02_22_CI_01", 0);
INSERT INTO res_pre VALUES( "PRE_02_20", "RES_02_22_CI_02", 0);
INSERT INTO res_pre VALUES( "PRE_02_20", "RES_02_22_CI_03", 1);
INSERT INTO res_pre VALUES( "PRE_02_20", "RES_02_22_CI_04", 0);
INSERT INTO res_pre VALUES( "PRE_02_20", "RES_02_22_CI_05", 0);

INSERT INTO res_pre VALUES( "PRE_02_21", "RES_02_22_CI_01", 0);
INSERT INTO res_pre VALUES( "PRE_02_21", "RES_02_22_CI_02", 0);
INSERT INTO res_pre VALUES( "PRE_02_21", "RES_02_22_CI_03", 0);
INSERT INTO res_pre VALUES( "PRE_02_21", "RES_02_22_CI_04", 1);
INSERT INTO res_pre VALUES( "PRE_02_21", "RES_02_22_CI_05", 0);

INSERT INTO res_pre VALUES( "PRE_02_22", "RES_02_22_CI_01", 0);
INSERT INTO res_pre VALUES( "PRE_02_22", "RES_02_22_CI_02", 0);
INSERT INTO res_pre VALUES( "PRE_02_22", "RES_02_22_CI_03", 0);
INSERT INTO res_pre VALUES( "PRE_02_22", "RES_02_22_CI_04", 0);
INSERT INTO res_pre VALUES( "PRE_02_22", "RES_02_22_CI_05", 1);

/* CAPITULO 3 */

INSERT INTO preguntas VALUES( "PRE_03_01", "¿Cuál de estos métodos pueden utilizar dos PC para asegurar que no se descarten los paquetes debido a que se envían demasiados datos demasiado rápido?", "FACIL", 1);
INSERT INTO respuesta VALUES( "RES_03_01_C_01", "Control de flujo", 1);
INSERT INTO respuesta VALUES( "RES_03_01_I_01", "Encapsulación", 1);
INSERT INTO respuesta VALUES( "RES_03_01_I_02", "Tiempo de espera de respuesta", 1);
INSERT INTO respuesta VALUES( "RES_03_01_I_03", "Método de acceso", 1);

INSERT INTO res_pre VALUES( "PRE_03_01", "RES_03_01_C_01", 1);
INSERT INTO res_pre VALUES( "PRE_03_01", "RES_03_01_I_01", 0);
INSERT INTO res_pre VALUES( "PRE_03_01", "RES_03_01_I_02", 0);
INSERT INTO res_pre VALUES( "PRE_03_01", "RES_03_01_I_03", 0);

INSERT INTO preguntas VALUES( "PRE_03_02", "¿En qué tipo de comunicación se envía un mensaje a todos los dispositivos de una LAN?", "FACIL", 1);
INSERT INTO respuesta VALUES( "RES_03_02_C_01", "Difusión", 1);
INSERT INTO respuesta VALUES( "RES_03_02_I_01", "Multidifusión", 1);
INSERT INTO respuesta VALUES( "RES_03_02_I_02", "Unidifusión", 1);
INSERT INTO respuesta VALUES( "RES_03_02_I_03", "Omnidifusión", 1);

INSERT INTO res_pre VALUES( "PRE_03_02", "RES_03_02_C_01", 1);
INSERT INTO res_pre VALUES( "PRE_03_02", "RES_03_02_I_01", 0);
INSERT INTO res_pre VALUES( "PRE_03_02", "RES_03_02_I_02", 0);
INSERT INTO res_pre VALUES( "PRE_03_02", "RES_03_02_I_03", 0);

INSERT INTO preguntas VALUES( "PRE_03_03", "¿Cuál es el proceso que se utiliza para colocar un mensaje dentro de otro para transferirlo del origen al destino?", "FACIL", 1);
INSERT INTO respuesta VALUES( "RES_03_03_C_01", "Encapsulamiento", 1);
INSERT INTO respuesta VALUES( "RES_03_03_I_01", "Control de acceso", 1);
INSERT INTO respuesta VALUES( "RES_03_03_I_02", "Decodificación", 1);
INSERT INTO respuesta VALUES( "RES_03_03_I_03", "Control del flujo", 1);

INSERT INTO res_pre VALUES( "PRE_03_03", "RES_03_03_C_01", 1);
INSERT INTO res_pre VALUES( "PRE_03_03", "RES_03_03_I_01", 0);
INSERT INTO res_pre VALUES( "PRE_03_03", "RES_03_03_I_02", 0);
INSERT INTO res_pre VALUES( "PRE_03_03", "RES_03_03_I_03", 0);

INSERT INTO preguntas VALUES( "PRE_03_04", "Un cliente Web envía una solicitud de página Web a un servidor WeDesde la perspectiva del cliente, ¿cuál es el orden correcto del stack de protocolos que se utiliza para preparar la solicitud para la transmisión?", "FACIL", 1);
INSERT INTO respuesta VALUES( "RES_03_04_C_01", "HTTP, TCP, IP, Ethernet", 1);
INSERT INTO respuesta VALUES( "RES_03_04_I_01", "Ethernet, TCP, IP, HTTP", 1);
INSERT INTO respuesta VALUES( "RES_03_04_I_02", "Ethernet, IP, TCP, HTTP", 1);
INSERT INTO respuesta VALUES( "RES_03_04_I_03", "HTTP, IP, TCP, Ethernet", 1);

INSERT INTO res_pre VALUES( "PRE_03_04", "RES_03_04_C_01", 1);
INSERT INTO res_pre VALUES( "PRE_03_04", "RES_03_04_I_01", 0);
INSERT INTO res_pre VALUES( "PRE_03_04", "RES_03_04_I_02", 0);
INSERT INTO res_pre VALUES( "PRE_03_04", "RES_03_04_I_03", 0);

INSERT INTO preguntas VALUES( "PRE_03_05", "¿Cuál de estas afirmaciones sobre los protocolos de red es correcta?", "FACIL", 1);
INSERT INTO respuesta VALUES( "RES_03_05_C_01", "Definen cómo se intercambian los mensajes entre el origen y el destino.", 1);
INSERT INTO respuesta VALUES( "RES_03_05_I_01", "Los protocolos de red definen el tipo de hardware que se utiliza y la forma en que se monta en bastidores.", 1);
INSERT INTO respuesta VALUES( "RES_03_05_I_02", "Solo se requieren para el intercambio de mensajes entre dispositivos de redes remotas.", 1);
INSERT INTO respuesta VALUES( "RES_03_05_I_03", "Todos funcionan en la capa de acceso a la red de TCP/IP.", 1);

INSERT INTO res_pre VALUES( "PRE_03_05", "RES_03_05_C_01", 1);
INSERT INTO res_pre VALUES( "PRE_03_05", "RES_03_05_I_01", 0);
INSERT INTO res_pre VALUES( "PRE_03_05", "RES_03_05_I_02", 0);
INSERT INTO res_pre VALUES( "PRE_03_05", "RES_03_05_I_03", 0);

INSERT INTO preguntas VALUES( "PRE_03_06", "¿Cuál de estas afirmaciones sobre los modelos TCP/IP y OSI es verdadera?", "FACIL", 1);
INSERT INTO respuesta VALUES( "RES_03_06_C_01", "La capa de transporte de TCP/IP y la capa 4 de OSI proporcionan servicios y funciones similares.", 1);
INSERT INTO respuesta VALUES( "RES_03_06_I_01", "La capa de acceso a la red de TCP/IP tiene funciones similares a la capa de red de OSI.", 1);
INSERT INTO respuesta VALUES( "RES_03_06_I_02", "Las primeras tres capas de OSI describen servicios generales que también proporciona la capa de Internet de TCP/IP.", 1);
INSERT INTO respuesta VALUES( "RES_03_06_I_03", "La capa 7 de OSI y la capa de aplicación de TCP/IP proporcionan funciones idénticas.", 1);

INSERT INTO res_pre VALUES( "PRE_03_06", "RES_03_06_C_01", 1);
INSERT INTO res_pre VALUES( "PRE_03_06", "RES_03_06_I_01", 0);
INSERT INTO res_pre VALUES( "PRE_03_06", "RES_03_06_I_02", 0);
INSERT INTO res_pre VALUES( "PRE_03_06", "RES_03_06_I_03", 0);

INSERT INTO preguntas VALUES( "PRE_03_07", "¿Cuál de las siguientes es una ventaja de utilizar estándares para el desarrollo y la implementación de protocolos?", "FACIL", 1);
INSERT INTO respuesta VALUES( "RES_03_07_C_01", "Los productos de distintos fabricantes pueden interoperar correctamente.", 1);
INSERT INTO respuesta VALUES( "RES_03_07_I_01", "Solo un fabricante puede implementar un protocolo determinado.", 1);
INSERT INTO respuesta VALUES( "RES_03_07_I_02", "Los estándares proporcionan flexibilidad a los fabricantes para crear dispositivos que cumplan con requisitos exclusivos.", 1);
INSERT INTO respuesta VALUES( "RES_03_07_I_03", "Los distintos fabricantes tienen la libertad de aplicar distintos requisitos cuando implementan un protocolo.", 1);

INSERT INTO res_pre VALUES( "PRE_03_07", "RES_03_07_C_01", 1);
INSERT INTO res_pre VALUES( "PRE_03_07", "RES_03_07_I_01", 0);
INSERT INTO res_pre VALUES( "PRE_03_07", "RES_03_07_I_02", 0);
INSERT INTO res_pre VALUES( "PRE_03_07", "RES_03_07_I_03", 0);

INSERT INTO preguntas VALUES( "PRE_03_08", "¿Qué protocolo de la capa de aplicación forma parte del paquete del protocolo TCP/IP?", "FACIL", 1);
INSERT INTO respuesta VALUES( "RES_03_08_C_01", "FTP", 1);
INSERT INTO respuesta VALUES( "RES_03_08_C_02", "DHCP", 1);
INSERT INTO respuesta VALUES( "RES_03_08_C_03", "DNS", 1);
INSERT INTO respuesta VALUES( "RES_03_08_I_01", "NAT", 1);
INSERT INTO respuesta VALUES( "RES_03_08_I_02", "ARP", 1);
INSERT INTO respuesta VALUES( "RES_03_08_I_03", "PPP", 1);

INSERT INTO res_pre VALUES( "PRE_03_08", "RES_03_08_C_01", 1);
INSERT INTO res_pre VALUES( "PRE_03_08", "RES_03_08_C_02", 1);
INSERT INTO res_pre VALUES( "PRE_03_08", "RES_03_08_C_03", 1);
INSERT INTO res_pre VALUES( "PRE_03_08", "RES_03_08_I_01", 0);
INSERT INTO res_pre VALUES( "PRE_03_08", "RES_03_08_I_02", 0);
INSERT INTO res_pre VALUES( "PRE_03_08", "RES_03_08_I_03", 0);

INSERT INTO preguntas VALUES( "PRE_03_09", "¿Qué son los protocolos exclusivos?", "FACIL", 1);
INSERT INTO respuesta VALUES( "RES_03_09_C_01", "Los protocolos desarrollados por organizaciones que tienen control sobre su definición y operación", 1);
INSERT INTO respuesta VALUES( "RES_03_09_I_01", "Protocolos desarrollados por organizaciones privadas para que operen en hardware de cualquier proveedor", 1);
INSERT INTO respuesta VALUES( "RES_03_09_I_02", "Protocolos que pueden ser utilizados libremente por cualquier organización o proveedor", 1);
INSERT INTO respuesta VALUES( "RES_03_09_I_03", "Un conjunto de protocolos conocidos como “suite de protocolos TCP/IP”", 1);

INSERT INTO res_pre VALUES( "PRE_03_09", "RES_03_09_C_01", 1);
INSERT INTO res_pre VALUES( "PRE_03_09", "RES_03_09_I_01", 0);
INSERT INTO res_pre VALUES( "PRE_03_09", "RES_03_09_I_02", 0);
INSERT INTO res_pre VALUES( "PRE_03_09", "RES_03_09_I_03", 0);

INSERT INTO preguntas VALUES( "PRE_03_10", "¿Cuál de las siguientes es una ventaja de que los dispositivos de red utilicen protocolos de estándar abierto?", "FACIL", 1);
INSERT INTO respuesta VALUES( "RES_03_10_C_01", "Un host cliente y un servidor con distintos sistemas operativos pueden intercambiar datos correctamente.", 1);
INSERT INTO respuesta VALUES( "RES_03_10_I_01", "La competencia y la innovación se limitan a tipos específicos de productos.", 1);
INSERT INTO respuesta VALUES( "RES_03_10_I_02", "Un único ISP en cada mercado puede controlar el acceso a Internet.", 1);
INSERT INTO respuesta VALUES( "RES_03_10_I_03", "Las comunicaciones de red se limitan a transferencias de datos entre dispositivos del mismo proveedor.", 1);

INSERT INTO res_pre VALUES( "PRE_03_10", "RES_03_10_C_01", 1);
INSERT INTO res_pre VALUES( "PRE_03_10", "RES_03_10_I_01", 0);
INSERT INTO res_pre VALUES( "PRE_03_10", "RES_03_10_I_02", 0);
INSERT INTO res_pre VALUES( "PRE_03_10", "RES_03_10_I_03", 0);

INSERT INTO preguntas VALUES( "PRE_03_11", "¿Qué capa del modelo OSI es comparable en su función a la capa de aplicación del modelo TCP/IP?", "FACIL", 1);
INSERT INTO respuesta VALUES( "RES_03_11_C_01", "Aplicación", 1);
INSERT INTO respuesta VALUES( "RES_03_11_C_02", "Presentación", 1);
INSERT INTO respuesta VALUES( "RES_03_11_C_03", "Sesión", 1);
INSERT INTO respuesta VALUES( "RES_03_11_I_01", "Transporte", 1);
INSERT INTO respuesta VALUES( "RES_03_11_I_02", "Física", 1);
INSERT INTO respuesta VALUES( "RES_03_11_I_03", "Enlace de datos", 1);
INSERT INTO respuesta VALUES( "RES_03_11_I_04", "Red", 1);

INSERT INTO res_pre VALUES( "PRE_03_11", "RES_03_11_C_01", 1);
INSERT INTO res_pre VALUES( "PRE_03_11", "RES_03_11_C_02", 1);
INSERT INTO res_pre VALUES( "PRE_03_11", "RES_03_11_C_03", 1);
INSERT INTO res_pre VALUES( "PRE_03_11", "RES_03_11_I_01", 0);
INSERT INTO res_pre VALUES( "PRE_03_11", "RES_03_11_I_02", 0);
INSERT INTO res_pre VALUES( "PRE_03_11", "RES_03_11_I_03", 0);
INSERT INTO res_pre VALUES( "PRE_03_11", "RES_03_11_I_04", 0);

INSERT INTO preguntas VALUES( "PRE_03_12", "¿En cuál de estas capas del modelo OSI se encapsularía una dirección lógica?", "FACIL", 1);
INSERT INTO respuesta VALUES( "RES_03_12_C_01", "Capa de red", 1);
INSERT INTO respuesta VALUES( "RES_03_12_I_01", "Capa física", 1);
INSERT INTO respuesta VALUES( "RES_03_12_I_02", "Capa de enlace de datos", 1);
INSERT INTO respuesta VALUES( "RES_03_12_I_03", "Capa de transporte", 1);

INSERT INTO res_pre VALUES( "PRE_03_12", "RES_03_12_C_01", 1);
INSERT INTO res_pre VALUES( "PRE_03_12", "RES_03_12_I_01", 0);
INSERT INTO res_pre VALUES( "PRE_03_12", "RES_03_12_I_02", 0);
INSERT INTO res_pre VALUES( "PRE_03_12", "RES_03_12_I_03", 0);

INSERT INTO preguntas VALUES( "PRE_03_13", "¿Qué formato de PDU se utiliza cuando la NIC de un host recibe bits del medio de red?", "FACIL", 1);
INSERT INTO respuesta VALUES( "RES_03_13_C_01", "Trama", 1);
INSERT INTO respuesta VALUES( "RES_03_13_I_01", "Archivo", 1);
INSERT INTO respuesta VALUES( "RES_03_13_I_02", "Segmento", 1);
INSERT INTO respuesta VALUES( "RES_03_13_I_03", "Paquete", 1);

INSERT INTO res_pre VALUES( "PRE_03_13", "RES_03_13_C_01", 1);
INSERT INTO res_pre VALUES( "PRE_03_13", "RES_03_13_I_01", 0);
INSERT INTO res_pre VALUES( "PRE_03_13", "RES_03_13_I_02", 0);
INSERT INTO res_pre VALUES( "PRE_03_13", "RES_03_13_I_03", 0);

INSERT INTO preguntas VALUES( "PRE_03_14", "¿Cuál es la PDU que se procesa cuando un equipo host desencapsula un mensaje en la capa de transporte del modelo TCP/IP?", "FACIL", 1);
INSERT INTO respuesta VALUES( "RES_03_14_C_01", "Segmento", 1);
INSERT INTO respuesta VALUES( "RES_03_14_I_01", "Bits", 1);
INSERT INTO respuesta VALUES( "RES_03_14_I_02", "Paquete", 1);
INSERT INTO respuesta VALUES( "RES_03_14_I_03", "Trama", 1);

INSERT INTO res_pre VALUES( "PRE_03_14", "RES_03_14_C_01", 1);
INSERT INTO res_pre VALUES( "PRE_03_14", "RES_03_14_I_01", 0);
INSERT INTO res_pre VALUES( "PRE_03_14", "RES_03_14_I_02", 0);
INSERT INTO res_pre VALUES( "PRE_03_14", "RES_03_14_I_03", 0);

INSERT INTO preguntas VALUES( "PRE_03_15", "¿Qué dirección utiliza una NIC cuando decide si acepta o no una trama?", "FACIL", 1);
INSERT INTO respuesta VALUES( "RES_03_15_C_01", "La dirección MAC de destino", 1);
INSERT INTO respuesta VALUES( "RES_03_15_I_01", "La dirección IP de origen", 1);
INSERT INTO respuesta VALUES( "RES_03_15_I_02", "La dirección MAC de origen", 1);
INSERT INTO respuesta VALUES( "RES_03_15_I_03", "La dirección IP de destino", 1);
INSERT INTO respuesta VALUES( "RES_03_15_I_04", "La dirección Ethernet de origen", 1);

INSERT INTO res_pre VALUES( "PRE_03_15", "RES_03_15_C_01", 1);
INSERT INTO res_pre VALUES( "PRE_03_15", "RES_03_15_I_01", 0);
INSERT INTO res_pre VALUES( "PRE_03_15", "RES_03_15_I_02", 0);
INSERT INTO res_pre VALUES( "PRE_03_15", "RES_03_15_I_03", 0);
INSERT INTO res_pre VALUES( "PRE_03_15", "RES_03_15_I_04", 0);

INSERT INTO preguntas VALUES( "PRE_03_16", "¿Qué sucede si se configura de forma incorrecta la dirección de gateway predeterminado en un host?", "FACIL", 1);
INSERT INTO respuesta VALUES( "RES_03_16_C_01", "El host no puede comunicarse con hosts en otras redes.", 1);
INSERT INTO respuesta VALUES( "RES_03_16_I_01", "El host no puede comunicarse con otros hosts en la red local.", 1);
INSERT INTO respuesta VALUES( "RES_03_16_I_02", "Un ping del host a 127.0.0.1 no se realizaría en forma correcta.", 1);
INSERT INTO respuesta VALUES( "RES_03_16_I_03", "El switch no reenvía paquetes iniciados por el host.", 1);
INSERT INTO respuesta VALUES( "RES_03_16_I_04", "El host debe utilizar el protocolo ARP para determinar la dirección de gateway predeterminada correcta.", 1);

INSERT INTO res_pre VALUES( "PRE_03_16", "RES_03_16_C_01", 1);
INSERT INTO res_pre VALUES( "PRE_03_16", "RES_03_16_I_01", 0);
INSERT INTO res_pre VALUES( "PRE_03_16", "RES_03_16_I_02", 0);
INSERT INTO res_pre VALUES( "PRE_03_16", "RES_03_16_I_03", 0);
INSERT INTO res_pre VALUES( "PRE_03_16", "RES_03_16_I_04", 0);

INSERT INTO preguntas VALUES( "PRE_03_17", "¿Cuál de las siguientes características describe el gateway predeterminado de un equipo host?", "FACIL", 1);
INSERT INTO respuesta VALUES( "RES_03_17_C_01", "La dirección lógica de la interfaz del router en la misma red que el equipo host.", 1);
INSERT INTO respuesta VALUES( "RES_03_17_I_01", "La dirección física de la interfaz del router está en la misma red que el equipo host.", 1);
INSERT INTO respuesta VALUES( "RES_03_17_I_02", "La dirección física de la interfaz del switch conectado al equipo host.", 1);
INSERT INTO respuesta VALUES( "RES_03_17_I_03", "La dirección lógica asignada a la interfaz del switch conectado al router.", 1);

INSERT INTO res_pre VALUES( "PRE_03_17", "RES_03_17_C_01", 1);
INSERT INTO res_pre VALUES( "PRE_03_17", "RES_03_17_I_01", 0);
INSERT INTO res_pre VALUES( "PRE_03_17", "RES_03_17_I_02", 0);
INSERT INTO res_pre VALUES( "PRE_03_17", "RES_03_17_I_03", 0);

/*PREGUNTA NIVEL*/

INSERT INTO preguntas_nivel VALUES( "Nivel_01", "PRE_01_01");
INSERT INTO preguntas_nivel VALUES( "Nivel_01", "PRE_01_02");
INSERT INTO preguntas_nivel VALUES( "Nivel_01", "PRE_01_03");
INSERT INTO preguntas_nivel VALUES( "Nivel_01", "PRE_01_04");
INSERT INTO preguntas_nivel VALUES( "Nivel_01", "PRE_01_05");
INSERT INTO preguntas_nivel VALUES( "Nivel_01", "PRE_01_06");
INSERT INTO preguntas_nivel VALUES( "Nivel_01", "PRE_01_07");
INSERT INTO preguntas_nivel VALUES( "Nivel_01", "PRE_01_08");
INSERT INTO preguntas_nivel VALUES( "Nivel_01", "PRE_01_09");
INSERT INTO preguntas_nivel VALUES( "Nivel_01", "PRE_01_10");
INSERT INTO preguntas_nivel VALUES( "Nivel_01", "PRE_01_11");
INSERT INTO preguntas_nivel VALUES( "Nivel_01", "PRE_01_12");
INSERT INTO preguntas_nivel VALUES( "Nivel_01", "PRE_01_13");
INSERT INTO preguntas_nivel VALUES( "Nivel_01", "PRE_01_14");
INSERT INTO preguntas_nivel VALUES( "Nivel_01", "PRE_01_15");
INSERT INTO preguntas_nivel VALUES( "Nivel_01", "PRE_01_16");
INSERT INTO preguntas_nivel VALUES( "Nivel_01", "PRE_01_17");
INSERT INTO preguntas_nivel VALUES( "Nivel_01", "PRE_01_18");
INSERT INTO preguntas_nivel VALUES( "Nivel_01", "PRE_01_19");
INSERT INTO preguntas_nivel VALUES( "Nivel_01", "PRE_01_20");
INSERT INTO preguntas_nivel VALUES( "Nivel_01", "PRE_01_21");
INSERT INTO preguntas_nivel VALUES( "Nivel_01", "PRE_01_22");
INSERT INTO preguntas_nivel VALUES( "Nivel_01", "PRE_01_23");
INSERT INTO preguntas_nivel VALUES( "Nivel_01", "PRE_01_24");

INSERT INTO preguntas_nivel VALUES( "Nivel_02", "PRE_02_01");
INSERT INTO preguntas_nivel VALUES( "Nivel_02", "PRE_02_02");
INSERT INTO preguntas_nivel VALUES( "Nivel_02", "PRE_02_03");
INSERT INTO preguntas_nivel VALUES( "Nivel_02", "PRE_02_04");
INSERT INTO preguntas_nivel VALUES( "Nivel_02", "PRE_02_05");
INSERT INTO preguntas_nivel VALUES( "Nivel_02", "PRE_02_06");
INSERT INTO preguntas_nivel VALUES( "Nivel_02", "PRE_02_07");
INSERT INTO preguntas_nivel VALUES( "Nivel_02", "PRE_02_08");
INSERT INTO preguntas_nivel VALUES( "Nivel_02", "PRE_02_09");
INSERT INTO preguntas_nivel VALUES( "Nivel_02", "PRE_02_10");
INSERT INTO preguntas_nivel VALUES( "Nivel_02", "PRE_02_11");
INSERT INTO preguntas_nivel VALUES( "Nivel_02", "PRE_02_12");
INSERT INTO preguntas_nivel VALUES( "Nivel_02", "PRE_02_13");
INSERT INTO preguntas_nivel VALUES( "Nivel_02", "PRE_02_14");
INSERT INTO preguntas_nivel VALUES( "Nivel_02", "PRE_02_15");
INSERT INTO preguntas_nivel VALUES( "Nivel_02", "PRE_02_16");
INSERT INTO preguntas_nivel VALUES( "Nivel_02", "PRE_02_17");
INSERT INTO preguntas_nivel VALUES( "Nivel_02", "PRE_02_18");
INSERT INTO preguntas_nivel VALUES( "Nivel_02", "PRE_02_19");
INSERT INTO preguntas_nivel VALUES( "Nivel_02", "PRE_02_20");
INSERT INTO preguntas_nivel VALUES( "Nivel_02", "PRE_02_21");
INSERT INTO preguntas_nivel VALUES( "Nivel_02", "PRE_02_22");

INSERT INTO preguntas_nivel VALUES( "Nivel_03", "PRE_03_01");
INSERT INTO preguntas_nivel VALUES( "Nivel_03", "PRE_03_02");
INSERT INTO preguntas_nivel VALUES( "Nivel_03", "PRE_03_03");
INSERT INTO preguntas_nivel VALUES( "Nivel_03", "PRE_03_04");
INSERT INTO preguntas_nivel VALUES( "Nivel_03", "PRE_03_05");
INSERT INTO preguntas_nivel VALUES( "Nivel_03", "PRE_03_06");
INSERT INTO preguntas_nivel VALUES( "Nivel_03", "PRE_03_07");
INSERT INTO preguntas_nivel VALUES( "Nivel_03", "PRE_03_08");
INSERT INTO preguntas_nivel VALUES( "Nivel_03", "PRE_03_09");
INSERT INTO preguntas_nivel VALUES( "Nivel_03", "PRE_03_10");
INSERT INTO preguntas_nivel VALUES( "Nivel_03", "PRE_03_11");
INSERT INTO preguntas_nivel VALUES( "Nivel_03", "PRE_03_12");
INSERT INTO preguntas_nivel VALUES( "Nivel_03", "PRE_03_13");
INSERT INTO preguntas_nivel VALUES( "Nivel_03", "PRE_03_14");
INSERT INTO preguntas_nivel VALUES( "Nivel_03", "PRE_03_15");
INSERT INTO preguntas_nivel VALUES( "Nivel_03", "PRE_03_16");
INSERT INTO preguntas_nivel VALUES( "Nivel_03", "PRE_03_17");

/*INSERT DATO_CISCO*/

insert into dato_cisco VALUES( "DATO_01_01", "Un router se utiliza para determinar la ruta que los mensajes deben tomar a través de la red.", 1);
insert into dato_cisco VALUES( "DATO_01_02", "Un servidor de seguridad se utiliza para filtrar el tráfico entrante y saliente.", 1);
insert into dato_cisco VALUES( "DATO_01_03", "Un módem DSL se utiliza para proporcionar conexión a Internet para una casa o una organización.", 1);
insert into dato_cisco VALUES( "DATO_01_04", "Los dispositivos finales de una red generan datos.", 1);
insert into dato_cisco VALUES( "DATO_01_05", "Los dispositivos finales alteran el contenido de datos.", 1);
insert into dato_cisco VALUES( "DATO_01_06", "Los dispositivos finales son responsables de iniciar el proceso de encapsulación.", 1);
insert into dato_cisco VALUES( "DATO_01_07", "Intranet es un término utilizado para referirse a una conexión privada de redes LAN y WAN que pertenece a una organización.", 1);
insert into dato_cisco VALUES( "DATO_01_08", "Una intranet está diseñada para ser accesible sólo por miembros, empleados de una organización o personas con autorización.", 1);
insert into dato_cisco VALUES( "DATO_01_09", "Una red convergente está diseñada para ofrecer múltiples tipos de comunicación, como datos, video y voz, utilizando la misma infraestructura de red.", 1);
insert into dato_cisco VALUES( "DATO_01_10", "Cuando la demanda de los recursos de la red excede la capacidad disponible, la red se congestiona.", 1);
insert into dato_cisco VALUES( "DATO_01_11", "Los criterios para seleccionar un medio de red son la distancia, el entorno, la cantidad de datos y la velocidad a la que deben transmitirse los datos y el costo de medio y su instalación.", 1);
insert into dato_cisco VALUES( "DATO_01_12", "En los dispositivos finales se originan los datos que fluyen a través de la red.", 1);
insert into dato_cisco VALUES( "DATO_01_13", "Los dispositivos finales son responsables de iniciar el proceso de encapsulamiento.", 1);
insert into dato_cisco VALUES( "DATO_01_14", "Los dispositivos finales son la interfaz entre la persona y la red de comunicación.", 1);
insert into dato_cisco VALUES( "DATO_01_15", "Los dispositivos intermediarios dirigen los datos por rutas alternativas en caso de fallos en el enlace", 1);
insert into dato_cisco VALUES( "DATO_01_16", "Los dispositivos intermediarios filtran el flujo de datos para mejorar la seguridad", 1);
insert into dato_cisco VALUES( "DATO_01_17", "Los medios de comunicación de red proporcionan el canal a traves del cual viajan los mensajes.", 1);
insert into dato_cisco VALUES( "DATO_01_18", "Una extranet es una red de área donde las personas o socios empresariales externos tengan acceso a los datos de la empresa", 1);
insert into dato_cisco VALUES( "DATO_01_19", "La conexión por cable y DSL  proporcionan un alto ancho de banda, una conexión constante y una conexión Ethernet a un ordenador central o LAN.", 1);
insert into dato_cisco VALUES( "DATO_01_20", "Ancho de banda es una medida de la capacidad de carga de los  datos en los medios de comunicación.", 1);
insert into dato_cisco VALUES( "DATO_01_21", "La tolerancia a fallos es un método para limitar el impacto de un fallo de software o de hardware.", 1);
insert into dato_cisco VALUES( "DATO_01_22", "QoS es un conjunto de técnicas para gestionar la utilización de los recursos de red.", 1);

insert into dato_cisco VALUES( "DATO_02_01", "Para administrar un switch de manera remota SSH proporciona un método seguro.", 1);
insert into dato_cisco VALUES( "DATO_02_02", "CTRL-Z y el comando end permite volver al modo EXEC privilegiado en la CLI de Cisco IOS.", 1);
insert into dato_cisco VALUES( "DATO_02_03", "CTRL-C termina un comando en proceso en la CLI de Cisco IOS.", 1);
insert into dato_cisco VALUES( "DATO_02_04", "El comando exit permite a un usuario volver al nivel anterior en la CLI de Cisco IOS.", 1);
insert into dato_cisco VALUES( "DATO_02_05", "El comando show startup-config muestra la configuración guardada en la NVRAM.", 1);
insert into dato_cisco VALUES( "DATO_02_06", "El comando show running-config muestra el contenido del archivo de configuración se encuentra actualmente en ejecución en la RAM.", 1);
insert into dato_cisco VALUES( "DATO_02_07", "Es importante configurar un nombre de host debido a diversos procesos de autenticación utilizan el nombre de host del dispositivo.", 1);
insert into dato_cisco VALUES( "DATO_02_08", "Los nombres de host son útiles para la documentación, e identifican el dispositivo durante el acceso remoto.", 1);
insert into dato_cisco VALUES( "DATO_02_09", "El comando service password-encryption encripta contraseñas en texto plano en el archivo de configuración de modo que no pueden ser vistos por usuarios no autorizados.", 1);
insert into dato_cisco VALUES( "DATO_02_10", "El contenido de la RAM se pierde al apagar y al volverlo a encender.", 1);
insert into dato_cisco VALUES( "DATO_02_11", "La memoria flash es no volátil, ya que conserva y almacena el contenido al apagarlo y al volverlo a encender.", 1);
insert into dato_cisco VALUES( "DATO_02_12", "Un switch de capa 2 tiene una interfaz virtual (SVI) que proporciona un medio para administrar de forma remota el dispositivo.", 1);
insert into dato_cisco VALUES( "DATO_02_13", "Un SVI es una interfaz virtual.", 1);
insert into dato_cisco VALUES( "DATO_02_14", "VLAN 1 es activado por defecto en los switches Cisco.", 1);
insert into dato_cisco VALUES( "DATO_02_15", "VLAN 99 debe estar configurado para ser utilizado.", 1);
insert into dato_cisco VALUES( "DATO_02_16", "FastEthernet 0/1 y 0/1 GigabitEthernet son interfaces físicas.", 1);
insert into dato_cisco VALUES( "DATO_02_17", "Un switch de capa 2 no necesita una dirección IP para transmitir tramas a los dispositivos conectados.", 1);
insert into dato_cisco VALUES( "DATO_02_18", "Para acceder de manera remota a un switch , se debe tener una dirección de Capa 3.", 1);
insert into dato_cisco VALUES( "DATO_02_19", "La dirección IP debe ser aplicada a una interfaz virtual en lugar de a una interfaz física.", 1);
insert into dato_cisco VALUES( "DATO_02_20", "En un PC con Windows, el comando ipconfig se puede utilizar para verificar la configuración IP actual.", 1);
insert into dato_cisco VALUES( "DATO_02_21", "En un PC con Windows, el comando ping se puede utilizar para verificar la conectividad con otros dispositivos de red.", 1);
insert into dato_cisco VALUES( "DATO_02_22", "En un PC con Windows, los comandos show interfaces y show ip interface brief son comandos de Cisco IOS que se utilizan para ver el estado de las interfaces del router y el switch.", 1);
insert into dato_cisco VALUES( "DATO_02_23", "Un PC es preconfigurado para usar DHCP.", 1);
insert into dato_cisco VALUES( "DATO_02_24", "Todos los dispositivos requieren al menos una dirección IP y la máscara de subred para funcionar en una red LAN.", 1);
insert into dato_cisco VALUES( "DATO_02_25", "Cuando el PC está conectado a una red que utiliza DHCP, se obtiene la configuración de dirección IP desde el servidor DHCP que le permitirá funcionar en la red.", 1);
insert into dato_cisco VALUES( "DATO_02_26", "El comando ping se puede usar para testear conectividad con el dispositivo de destino.", 1);
insert into dato_cisco VALUES( "DATO_02_27", "La tecla TAB completa el resto de un comando tecleado parcialmente", 1);
insert into dato_cisco VALUES( "DATO_02_28", "La barra espaciadora muestra la siguiente pantalla", 1);
insert into dato_cisco VALUES( "DATO_02_29", "La tecla Flecha Arriba realiza un desplazamiento hacia atrás de los comandos introducidos anteriormente.", 1);
insert into dato_cisco VALUES( "DATO_02_30", "El comando ? Proporciona ayuda contextual.", 1);
insert into dato_cisco VALUES( "DATO_02_31", "Las teclas CTRL-MAYUS-6 Anula los comandos como trace y ping.", 1);

insert into dato_cisco VALUES( "DATO_03_01", "Para que dos ordenadores sean capaces de comunicarse efectivamente debe haber un mecanismo que permite a la fuente y al destino establecer tiempo de transmisión y recepción de datos.", 1);
insert into dato_cisco VALUES( "DATO_03_02", "El control de flujo permite que los datos no se envíen demasiado rápido para que pueda ser recibido correctamente.", 1);
insert into dato_cisco VALUES( "DATO_03_03", "La comunicación por difusión es una comunicación de uno a todos.", 1);
insert into dato_cisco VALUES( "DATO_03_04", "La comunicación por unidifución es una comunicación uno a uno.", 1);
insert into dato_cisco VALUES( "DATO_03_05", "La comunicación por multidifución es una comunicación uno a muchos, donde el mensaje se entrega a un grupo específico de hosts.", 1);
insert into dato_cisco VALUES( "DATO_03_06", "La encapsulación es el proceso de colocar un mensaje dentro de otro mensaje para transferirlo del origen al destino", 1);
insert into dato_cisco VALUES( "DATO_03_07", "HTTP rige la forma en que interactúa un servidor web y un cliente.", 1);
insert into dato_cisco VALUES( "DATO_03_08", "TCP administra conversaciones individuales entre servidores web y clientes.", 1);
insert into dato_cisco VALUES( "DATO_03_09", "IP es responsable de la entrega a través de la mejor ruta hasta el destino.", 1);
insert into dato_cisco VALUES( "DATO_03_10", "Ethernet toma el paquete de IP y lo formatea para su transmisión.", 1);
insert into dato_cisco VALUES( "DATO_03_11", "Los protocolos de red se implementan en hardware o software, o ambos.", 1);
insert into dato_cisco VALUES( "DATO_03_12", "Los protocolos de red interactúan entre sí dentro de diferentes capas de una pila de protocolos.", 1);
insert into dato_cisco VALUES( "DATO_03_13", "Los protocolos de red no tienen nada que ver con la instalación de los equipos de red.", 1);
insert into dato_cisco VALUES( "DATO_03_14", "Los protocolos de red se requieren para el intercambio de información entre los dispositivos origen y destino en las redes locales y remotas.", 1);
insert into dato_cisco VALUES( "DATO_03_15", "La capa de Internet del modelo TCP / IP proporciona la misma función que la capa de red del modelo OSI. ", 1);
insert into dato_cisco VALUES( "DATO_03_16", "La capa de transporte, tanto de la modelos OSI y TCP / IP proporcionan la misma función. ", 1);
insert into dato_cisco VALUES( "DATO_03_17", "La capa de aplicación del modelo TCP/IP proporciona las mismas funciones que las capas 5, 6 y 7 del modelo OSI.", 1);
insert into dato_cisco VALUES( "DATO_03_18", "DNS, DHCP y FTP son protocolos de la capa de aplicación del modelo TCP/IP.", 1);
insert into dato_cisco VALUES( "DATO_03_19", "DNS, DHCP y FTP son protocolos de la capa de aplicación del modelo TCP/IP.", 1);
insert into dato_cisco VALUES( "DATO_03_20", "ARP y PPP son protocolos de capa de acceso de red del modelo TCP/IP.", 1);
insert into dato_cisco VALUES( "DATO_03_21", "NAT es un protocolo de capa de Internet del modelo TCP/IP.", 1);
insert into dato_cisco VALUES( "DATO_03_22", "Los protocolos exclusivos son protocolos desarrollados por organizaciones que tienen control sobre su definición y operación.", 1);
insert into dato_cisco VALUES( "DATO_03_23", "Los protocolos exclusivos pueden ser utilizados por diferentes organizaciones con el permiso del propietario.", 1);
insert into dato_cisco VALUES( "DATO_03_24", "El modelo TCP/IP es un estándar abierto, no un protocolo exclusivo.", 1);
insert into dato_cisco VALUES( "DATO_03_25", "Un estándar abierto es un formato o protocolo que está sujeto a evaluación pública completa y se puede utilizar sin restricciones de una manera igualitaria.", 1);
insert into dato_cisco VALUES( "DATO_03_26", "Una ventaja de los dispositivos de red que implementa los protocolos estándar abiertos, es que los clientes y servidores que ejecutan diferentes sistemas operativos pueden comunicarse entre sí.", 1);
insert into dato_cisco VALUES( "DATO_03_27", "El modelo TCP/IP se compone de cuatro capas: la de aplicación, de transporte, de Internet y de acceso a la red.", 1);
insert into dato_cisco VALUES( "DATO_03_28", "El modelo OSI se compone de siete capas: la de aplicación, presentación, sesión, transporte, red, enlace de datos, y físicas.", 1);
insert into dato_cisco VALUES( "DATO_03_29", "La dirección lógica se conoce también como dirección IP.", 1);
insert into dato_cisco VALUES( "DATO_03_30", "La dirección lógica se añade en la capa de red del modelo OSI.", 1);
insert into dato_cisco VALUES( "DATO_03_31", "La dirección física se añade en la capa de enlace de datos del modelo OSI.", 1);
insert into dato_cisco VALUES( "DATO_03_32", "La dirección de los puertos se añade en la capa de transporte del modelo OSI.", 1);
insert into dato_cisco VALUES( "DATO_03_33", "Una trama es el PDU de la capa de enlace de datos.", 1);
insert into dato_cisco VALUES( "DATO_03_34", "Un paquete es el PDU a la capa de red.", 1);
insert into dato_cisco VALUES( "DATO_03_35", "Un segmento es la PDU a la capa de transporte.", 1);
insert into dato_cisco VALUES( "DATO_03_36", "Un archivo es una estructura de datos que puede ser utilizado en la capa de aplicación.", 1);
insert into dato_cisco VALUES( "DATO_03_37", "Cuando un host necesita enviar un mensaje a otro host se encuentra en la misma red, puede reenviar el mensaje directamente.", 1);
insert into dato_cisco VALUES( "DATO_03_38", "Sin embargo, cuando un host necesita enviar un mensaje a una red remota, se debe utilizar el router, también conocida como gateway predeterminada.", 1);
insert into dato_cisco VALUES( "DATO_03_39", "Si el gateway predeterminado no está configurado correctamente, el host puede comunicarse con otros hosts en la misma red, pero no con los hosts en redes remotas.", 1);
insert into dato_cisco VALUES( "DATO_03_40", "El gateway predeterminado es la dirección IP de una interfaz en el router en la misma red que el host emisor.", 1);

/*INSERT DATO_NIVEL*/

INSERT INTO dato_nivel VALUES( "Nivel_01", "DATO_01_01", 0);
INSERT INTO dato_nivel VALUES( "Nivel_01", "DATO_01_02", 0);
INSERT INTO dato_nivel VALUES( "Nivel_01", "DATO_01_03", 0);
INSERT INTO dato_nivel VALUES( "Nivel_01", "DATO_01_04", 0);
INSERT INTO dato_nivel VALUES( "Nivel_01", "DATO_01_05", 0);
INSERT INTO dato_nivel VALUES( "Nivel_01", "DATO_01_06", 0);
INSERT INTO dato_nivel VALUES( "Nivel_01", "DATO_01_07", 0);
INSERT INTO dato_nivel VALUES( "Nivel_01", "DATO_01_08", 0);
INSERT INTO dato_nivel VALUES( "Nivel_01", "DATO_01_09", 0);
INSERT INTO dato_nivel VALUES( "Nivel_01", "DATO_01_10", 0);
INSERT INTO dato_nivel VALUES( "Nivel_01", "DATO_01_11", 0);
INSERT INTO dato_nivel VALUES( "Nivel_01", "DATO_01_12", 0);
INSERT INTO dato_nivel VALUES( "Nivel_01", "DATO_01_13", 0);
INSERT INTO dato_nivel VALUES( "Nivel_01", "DATO_01_14", 0);
INSERT INTO dato_nivel VALUES( "Nivel_01", "DATO_01_15", 0);
INSERT INTO dato_nivel VALUES( "Nivel_01", "DATO_01_16", 0);
INSERT INTO dato_nivel VALUES( "Nivel_01", "DATO_01_17", 0);
INSERT INTO dato_nivel VALUES( "Nivel_01", "DATO_01_18", 0);
INSERT INTO dato_nivel VALUES( "Nivel_01", "DATO_01_19", 0);
INSERT INTO dato_nivel VALUES( "Nivel_01", "DATO_01_20", 0);
INSERT INTO dato_nivel VALUES( "Nivel_01", "DATO_01_21", 0);
INSERT INTO dato_nivel VALUES( "Nivel_01", "DATO_01_22", 0);

INSERT INTO dato_nivel VALUES( "Nivel_02", "DATO_02_01", 0);
INSERT INTO dato_nivel VALUES( "Nivel_02", "DATO_02_02", 0);
INSERT INTO dato_nivel VALUES( "Nivel_02", "DATO_02_03", 0);
INSERT INTO dato_nivel VALUES( "Nivel_02", "DATO_02_04", 0);
INSERT INTO dato_nivel VALUES( "Nivel_02", "DATO_02_05", 0);
INSERT INTO dato_nivel VALUES( "Nivel_02", "DATO_02_06", 0);
INSERT INTO dato_nivel VALUES( "Nivel_02", "DATO_02_07", 0);
INSERT INTO dato_nivel VALUES( "Nivel_02", "DATO_02_08", 0);
INSERT INTO dato_nivel VALUES( "Nivel_02", "DATO_02_09", 0);
INSERT INTO dato_nivel VALUES( "Nivel_02", "DATO_02_10", 0);
INSERT INTO dato_nivel VALUES( "Nivel_02", "DATO_02_11", 0);
INSERT INTO dato_nivel VALUES( "Nivel_02", "DATO_02_12", 0);
INSERT INTO dato_nivel VALUES( "Nivel_02", "DATO_02_13", 0);
INSERT INTO dato_nivel VALUES( "Nivel_02", "DATO_02_14", 0);
INSERT INTO dato_nivel VALUES( "Nivel_02", "DATO_02_15", 0);
INSERT INTO dato_nivel VALUES( "Nivel_02", "DATO_02_16", 0);
INSERT INTO dato_nivel VALUES( "Nivel_02", "DATO_02_17", 0);
INSERT INTO dato_nivel VALUES( "Nivel_02", "DATO_02_18", 0);
INSERT INTO dato_nivel VALUES( "Nivel_02", "DATO_02_19", 0);
INSERT INTO dato_nivel VALUES( "Nivel_02", "DATO_02_20", 0);
INSERT INTO dato_nivel VALUES( "Nivel_02", "DATO_02_21", 0);
INSERT INTO dato_nivel VALUES( "Nivel_02", "DATO_02_22", 0);
INSERT INTO dato_nivel VALUES( "Nivel_02", "DATO_02_23", 0);
INSERT INTO dato_nivel VALUES( "Nivel_02", "DATO_02_24", 0);
INSERT INTO dato_nivel VALUES( "Nivel_02", "DATO_02_25", 0);
INSERT INTO dato_nivel VALUES( "Nivel_02", "DATO_02_26", 0);
INSERT INTO dato_nivel VALUES( "Nivel_02", "DATO_02_27", 0);
INSERT INTO dato_nivel VALUES( "Nivel_02", "DATO_02_28", 0);
INSERT INTO dato_nivel VALUES( "Nivel_02", "DATO_02_29", 0);
INSERT INTO dato_nivel VALUES( "Nivel_02", "DATO_02_30", 0);
INSERT INTO dato_nivel VALUES( "Nivel_02", "DATO_02_31", 0);

INSERT INTO dato_nivel VALUES( "Nivel_03", "DATO_03_01", 0);
INSERT INTO dato_nivel VALUES( "Nivel_03", "DATO_03_02", 0);
INSERT INTO dato_nivel VALUES( "Nivel_03", "DATO_03_03", 0);
INSERT INTO dato_nivel VALUES( "Nivel_03", "DATO_03_04", 0);
INSERT INTO dato_nivel VALUES( "Nivel_03", "DATO_03_05", 0);
INSERT INTO dato_nivel VALUES( "Nivel_03", "DATO_03_06", 0);
INSERT INTO dato_nivel VALUES( "Nivel_03", "DATO_03_07", 0);
INSERT INTO dato_nivel VALUES( "Nivel_03", "DATO_03_08", 0);
INSERT INTO dato_nivel VALUES( "Nivel_03", "DATO_03_09", 0);
INSERT INTO dato_nivel VALUES( "Nivel_03", "DATO_03_10", 0);
INSERT INTO dato_nivel VALUES( "Nivel_03", "DATO_03_11", 0);
INSERT INTO dato_nivel VALUES( "Nivel_03", "DATO_03_12", 0);
INSERT INTO dato_nivel VALUES( "Nivel_03", "DATO_03_13", 0);
INSERT INTO dato_nivel VALUES( "Nivel_03", "DATO_03_14", 0);
INSERT INTO dato_nivel VALUES( "Nivel_03", "DATO_03_15", 0);
INSERT INTO dato_nivel VALUES( "Nivel_03", "DATO_03_16", 0);
INSERT INTO dato_nivel VALUES( "Nivel_03", "DATO_03_17", 0);
INSERT INTO dato_nivel VALUES( "Nivel_03", "DATO_03_18", 0);
INSERT INTO dato_nivel VALUES( "Nivel_03", "DATO_03_19", 0);
INSERT INTO dato_nivel VALUES( "Nivel_03", "DATO_03_20", 0);
INSERT INTO dato_nivel VALUES( "Nivel_03", "DATO_03_21", 0);
INSERT INTO dato_nivel VALUES( "Nivel_03", "DATO_03_22", 0);
INSERT INTO dato_nivel VALUES( "Nivel_03", "DATO_03_23", 0);
INSERT INTO dato_nivel VALUES( "Nivel_03", "DATO_03_24", 0);
INSERT INTO dato_nivel VALUES( "Nivel_03", "DATO_03_25", 0);
INSERT INTO dato_nivel VALUES( "Nivel_03", "DATO_03_26", 0);
INSERT INTO dato_nivel VALUES( "Nivel_03", "DATO_03_27", 0);
INSERT INTO dato_nivel VALUES( "Nivel_03", "DATO_03_28", 0);
INSERT INTO dato_nivel VALUES( "Nivel_03", "DATO_03_29", 0);
INSERT INTO dato_nivel VALUES( "Nivel_03", "DATO_03_30", 0);
INSERT INTO dato_nivel VALUES( "Nivel_03", "DATO_03_31", 0);
INSERT INTO dato_nivel VALUES( "Nivel_03", "DATO_03_32", 0);
INSERT INTO dato_nivel VALUES( "Nivel_03", "DATO_03_33", 0);
INSERT INTO dato_nivel VALUES( "Nivel_03", "DATO_03_34", 0);
INSERT INTO dato_nivel VALUES( "Nivel_03", "DATO_03_35", 0);
INSERT INTO dato_nivel VALUES( "Nivel_03", "DATO_03_36", 0);
INSERT INTO dato_nivel VALUES( "Nivel_03", "DATO_03_37", 0);
INSERT INTO dato_nivel VALUES( "Nivel_03", "DATO_03_38", 0);
INSERT INTO dato_nivel VALUES( "Nivel_03", "DATO_03_39", 0);
INSERT INTO dato_nivel VALUES( "Nivel_03", "DATO_03_40", 0);