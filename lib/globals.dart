import 'dart:collection';

final frasesMap = SplayTreeMap<String, String>.from({
'2024-02-08': '¡Espero que te haya gustado tu regalito corazón! Aprovecha para preguntarme lo que quieras sobre como funciona, te amo bebé :)',
'2024-02-09': 'Hoy se cumplen 6 meses desde que empezó lo mejor que me ha pasado en la vida, el poder llamarte mi novia preciosa. También son 6 meses desde el anuncio de 1989 TV. ¿Quizá las mejores cosas nacen en días como este? Te adoro bebé, espero podamos pasar mucho más tiempo agarraditas de la manita y aprendiendo y creciendo juntas <3',
'2024-02-10': 'Me contó patata que mañana es el cumpleaños de una niña muy bonita, una niña que me robó el corazoncito con su sonrisa desde el primer día y que merece el mundo entero :). Le compramos un regalito, ¿crees que le guste? Ya no puedo esperar para celebrar contigo mi vida, te adoro <3',
'2024-02-11': '¡Feliz cumpleaños a mi niña preciosa y al amor de mi vida! Espero que pases un día tan bonito e increíble como tú, porque te mereces eso y más. Te adoro con todo mi corazoncito bebé, siento muy bonito de finalmente poder celebrarte en tu día y consentirte, espero te guste mi regalito. No olvides felicitar a tu mami por crear una cosa tan preciosa y checar la sección de días especiales :)',
'2024-02-12': 'Dato curioso: según la MONU, hoy es el Día Internacional para la Prevención del Extremismo Violento cuando Conduzca al Terrorismo. Que bueno que mis comportamientos de amor extremo hacia tí no conducen al terrorismo, porque no pienso prevenirlos :D JAJAJAJAAJAJJ te adoro bebé <3',
'2024-02-13': 'En otro dato random, la UNESCO declaró hoy como el Día Internacional de la Radio. Ojalá tu estuvieras en la radio, para poder escuchar tu vocecita preciosa todos los días y sentir lo bonito de tener a una niña tan increíble con cositas tan lindas y chistosas que contar a mi lado. Te amo mi niña bonita <3',
'2024-02-14': '¡Feliz día de San Valentín mi preciosa! Creo que es un día muy bonito para agradecerte por la magia que me has hecho sentir en este amor, sabes que me diste las fuerzas para volver a intentarlo y me has hecho ver cositas muy bonitas que antes me costaba. Te adoro bebé, no se te olvide checar la sección de días especiales :)',
'2024-02-15': 'Me contaron que hoy unas bebés preciosas cumplen 7 meses de salir. Gracias por darme los meses más llenos de cosas bonitas que pude haber soñado cielo, por la oportunidad de caminar agarradita de la mano con el amor de mi vida y por volverte mi espacio seguro, mi mejor amiga y la persona con la que algún día me casaré :). Te amo mi xime, no se te olvide revisar la sección de días especiales <3',
'2024-02-16': 'Hoy es el Día Nacional de la Almendra en EE.UU., y a tu novia le encantan las almendras, así que por hoy serás mi almendrita bonita. También porque tengo ganitas de comerme una almendra. Te quiero muchísimo mi niña <3',
'2024-02-17': 'Hoy quería recordarte lo preciosa que eres mi niña, aún me pongo nerviosita cuando me ven esos ojitos preciosos y se me derrite el corazoncito. Tienes una carita preciosa, la sonrisita más bonita que he visto (verla es el highlight de mis días), unos ojitos súper bonitos, cachetitos adorables, un pelito súper bonito, y neta todo de ti me encanta :). Espero tengas bonito día, te adoro preciosa <3',
'2024-02-18': 'Hoy hace 94 años se descubrió Plutón, el cual era considerado el noveno planeta de nuestro Sistema Solar. En 2006 dejó  de ser planeta, y su clasificación cambió a planeta enano. Curiosamente tu naciste en ese mismo año: ¿no serás Plutón? Porque ciertamente eres mi planeta (enano) entero <3. Te adoro mi niña pequeñita :)',
'2024-02-19': 'Hoy sentí que era un día bonito para agradecerte por todo lo que has hecho por mí. Desde el primer día me hiciste creer en mí y me ayudaste a descubrir mi chispita, me escuchaste y me hiciste sentir que podía ser amada. Lo cambiaste todo mi vida. Gracias por decidir seguir caminando conmigo hoy, y espero que nunca dejemos de  hacerlo agarraditas de la mano y llenas de amorcito. ¿Toca casarse un día no?',
'2024-02-20': 'Pocas cosas son tan bonitas como levantarse cada mañana y saber que no importa que pasará hoy, tengo a la niña más increíble del mundo entero a mi lado y juntas podemos con lo que sea. Gracias por mostrarme lo bonito que puede ser el amor bebé, te mereces el mundo y yo te lo voy a dar :) Eres la mejor novia del mundo mi cielo, la mejor amiga y la mejor persona, nunca  te lo cuestiones pls, te amo <3',
'2024-02-21': '¿Te dolió? Hoy hace 52 años el robot soviético Luna 20 aterrizó en la Luna (tú), con el propósito de obtener una roca y regresarla a la Tierra. Obvio todo el mundo quería un pedacito aunque fuera de ella, así como todo mundo quisiera tener a una niña tan increíble como tú y el amor tan bonito que tenemos. Te adoro cielo, gracias por elegirme hoy de nuevo <3',
'2024-02-22': '"ya terminaste tu investigacion?" fue la pregunta que hizo un niño nervioso hoy hace un año a la niña bonita del salón, con quién le había tocado hacer un proyecto de Ética. Quizá solo buscaba una excusa para platicar aunque fuera un ratito con ella, porque podría ser que le atrayera. ¿Quién diría que después de unos meses se volverían novias? Por algo eres mi invisible string, mi personita, el amor de mi vida y mi futura esposa <3',
'2024-02-23': 'Hace mucho no sentía una conexión tan bonita con alguien, cada día que pasa me haces sentir más la magia de conocer tanto a alguien y poco a poco ir formando parte de su vida cotidiana. Me has hecho amar cada momentito que compartimos todos los días, como el comer tu torta juntos o molestarnos la una a la otra durante clase de Irina. Conectar contigo es lo más bonito que me pudo haber pasado, y te adoro mi niña <3',
'2024-02-24': 'Si tuviera que elegir mi cosita favorita de ti, probablemente elegiría esa sonrisita tan bonita. Nada me puede animar el día tanto o hacerme tan feliz como verla aunque sea unos segundos, creo que es una de esas cosas bonitas del universo que espero poder ver todos los días. Te adoro linda, gracias por enseñarme lo mucho que puede cambiar el mundo de alguien con una sola sonrisita como la tuya <3',
'2024-02-25': 'Andaba con ganitas de un abracito cuando escribí esto así que pensé que sería bonito explicarte porque amo tanto tus abracitos. Siento que estar en tus bracitos es lo más cercano al cielo que se puede estar aquí, me haces sentir que estoy segura y hay mucho amor para mí. Es mi lugar favorito en el mundo. Espero que podamos abrazarnos el resto de nuestras vidas mi bebé <3',
'2024-02-26': 'Hoy te quería decir que tienes el corazoncito más lindo que he visto en mi vida, amas de una forma tan bonita y pura que se me llena de amor el corazoncito cada vez que estamos juntitas. Amo la forma que tienes de demostrarme amor, me fascinan tus detallitos, el contacto físico contigo, que no tengas miedo de ser intensa conmigo, y como vamos creando nuestras tradiciones y nos volvemos parte de la cotidianidad del otro. Te amo <3',
'2024-02-27': '¡Feliz día del Pokémon! Hoy te toca soportar ser mi Cyndaquil, porque está bonito y lo elijo siempre así como siempre te elegiré <3. Quejas con patata o me ataco. Te amo mucho, gracias por soportarme :)',
'2024-02-28': 'La neta ya sabíamos que eras una rata, pero me sorprendió enterarme de que además robabas dientes :O. ¡Feliz día del Ratón Pérez! La neta se siente bonito saber que incluso antes de ser novias ya me consentías con regalitos cuando me sentía mal por mis dientecitos, eres un amor, gracias por cuidarme siempre mi preciosa <3',
'2024-02-29': 'Hoy es un día raro (aunque no tanto como tú), porque solo ocurre una vez cada 4 años. Es un día más en el año, un día más que puedo pasar contigo. Antes de conocerte quería que pasara el tiempo más rápido, quería huir de todo, quería que ya acabara todo. Ahora, quisiera que pasara más lento el tiempo, que hubiera siempre más días en el año, para poder pasarlo a tu lado. Y así, y en muchísimas formas más, es como has cambiado mi vida y como la veo. Te amo <3',
'2024-03-01': 'Para que inicies más bonito tu mes, ¿sabías que hoy es el Día Mundial del Cumplido? Así que quería decirte que eres la mejor amiga y novia que pude haber pedido, eres todo lo que soñé y más, y amo cada parte de tí: desde tu súper lindo corazoncito, tu(s) increíble(s) personalidad(es), lo preciosa que te ves, y lo bonito que ves al mundo y que amas todos los días. Espero poder seguir creciendo todos los días, te amo mi Xime <3',
'2024-03-02': 'No hay nada que ame más ver que a esos ojitos cafecitos (negros según tú jsjsjsj), más cuando me ves de vuelta. Siento maripositas, me pongo un poco nerviosa, pero es uno de los sentimientos más bonitos que existen. Amo esos ojitos preciosos, y adoro como se iluminan cuando me cuentas algo que te emociona, que enciende tu chispita, que es especial para tí. Supe que me iba a enamorar de ellos desde que los ví por primera vez y ahora no puedo dejar de verlos nunca. Te amo bebé <3',
'2024-03-03': '¡Felicidades bebé, hoy es tu día! Eso es porque hoy es el Día de los gatos y los perros con pulgares oponibles, y tu eres una pobre perra con pulgares :D. Es bromita, te amo bebé y espero que hoy tengas un día súper precioso como tú, y si quieres platicamos un rato sobre cuando desmadre haría mazapán si tuviera pulgares. Te adoro <3',
'2024-03-04': 'Escribí este mensajito después de una date que tuvimos para comer taquitos, algo que amé hacer contigo y que se me antojaba hace tiempo. Amo tener esos momentitos tan sencillos pero tan bonitos contigo, compartir las cosas de mi vida que para mi eran muy especiales con mi familia me hace sentir una conexión y un amor tan lindo hacia la niña de mis sueños, me hace sentir que de verdad eres mi persona. Gracias por acompañarme siempre bebé, te amo <3',
'2024-03-05': 'Hoy solo quería agradecerte por existir. Sé que has pasado muchas cosas díficiles, y a veces aún hay cosas complicaditas que nos toca enfrentar. Por eso estoy súper orgullosa de tí por seguir dándolo todo, y porque aunque a veces no te des cuenta siento que has logrado tomar todo eso y crecer mucho. Siento que es gracias a ese esfuerzo que has podido iluminar muchísimos corazoncitos y chispitas como la mía, y cuando tengas miedo, recuerda que siempre tendrás personitas como yo apoyándote para que sigas adelante. Te amo bebé, gracias por ser mi inspiración <3',
'2024-03-06': 'Andaba buscando otras fechas chistosas para poner en tus mensajitos, y me topé con que hoy es el Día Nacional del Vestido en EE.UU. Cuando lo ví solo me puse a pensar en lo mucho que amo tus vestiditos, y todos tus outfits en general. Siento que tienes un estilo súper bonito, y combinado con lo preciosa que estás no puedo evitar sorprenderme y querer presumirte cada vez que tenemos una date. ¿Tengamos otra date pronto va? Y escogemos outfits juntas :). Te amo <3',
'2024-03-07': 'Creo que nunca he sentido algo tan bonito como tus besitos. Recuerdo cuando tuvimos el primero, no me lo esperaba pero es lo que más quería, y finalmente poder sentir esa conexión física y emocional tan bonita contigo me llenó de amor y emoción, tanto que corrí a contarle a Mariana después de la date porque no podía contener la felicidad que sentía. Siento que cada besito contigo se siente más y más mágico, y amo como cositas como los besitos en la frente para despedirnos se han vuelto parte de nuestra cotidianidad. Te amo, y amo tus besitos y tus formas de demostrar amor <3',
'2024-03-08': 'A veces me gusta recordar lo bonito de como nos conocimos: desde la emoción de platicar y conectar un poco contigo en los recreos durante el SM, como quería agarrar tu manita en el coche yendo a la clausura, como me metiste a MUNAM y tuvimos esa primera llamadita, y como lo que solo era un sueño loco para mí poco a poco se convirtió en vernos todos los días, en tirarnos indirectas, y finalmente en lo precioso que tenemos hoy. Creo que verdaderamente eres mi invisible string, me haces sentir que todo lo que ha pasado hasta ahora tuvo un sentido y estoy súper agradecida de tenerte en mi vida. Te amo preciosa, gracias por los mejores 7 meses de toda mi vida y por seguir caminando a mi ladito <3',
'2024-03-09': 'Hoy es el Día de la Albóndiga, así que mándale felicitaciones a patatita de mi parte. Algún día me gustaría comer unas contigo, y me dijiste que las de tu abuelita están súper ricas así que te toca invitarme a ir. Fuera de bromita, siento que si sería bonito que comiéramos juntas un día algo así. Te amo bebé, ten un bonito día y recuerda que te adoro <3',
'2024-03-10': 'Hoy es el Día de Mario, así que aprovechaba para contarte que me encantaría tener una date para jugar videojuegos así bonitos contigo. Sé que no le sabes mucho, pero me encantaría enseñarte y sabes que me encanta compartir cositas que me apasionan mucho contigo. Siento que sería muy bonito reírme contigo jugando Wii Sports, o morirnos 300 veces jugando Mario, o quizá echar a los aldeanos feos en una partida de Animal Crossing. Te quiero mucho bebé, ojalá podamos hacerlo algún día :)',
'2024-03-11': 'Hoy quería agradecerte por la seguridad que me has dado en mí misma. Desde que empezamos a platicar siempre me escuchaste, me das reassurance cuando la necesito y siempre que me siento mal estás ahí para recordarme que valgo la pena. Me has hecho sentir mucho más feliz y cómoda conmigo misma, y que si ha valido la pena mi esfuerzo. Gracias por ser siempre mi apoyo emocional y la persona en la que me puedo apoyar, incluso antes de haber conectado de nuevo (no se me va a olvidar jamás como me apoyaste en el SM), eres la persona con el corazoncito más lindo que conozco. Te adoro mi niña <3',
'2024-03-12': 'A veces es bonito pensar cuantas veces nos topamos directamente: en Paseo de Montejo, en los MUNs, cuando nos sentaron juntas, etc.; pero el universo nos hizo esperar hasta el momento perfecto para conectar de verdad y conocernos bien, para poder querernos bonito y crecer juntas. Me gusta pensar cuantas cositas tuvieron que pasar de la manera indicada, los miles efectos mariposa que me harían no estar hoy aquí contigo, pero sin embargo todo salió como debía y hoy puedo decir que conocí al amor de mi vida a los 16, la personita con la que sé me casaré. Te amo, la niña de mis sueños <3',
'2024-03-13': 'Algunas veces nuestra vida cambia por completo, a veces incluso de la noche a la mañana. Hoy hace 4 años fue mi último día de clases en el Tere antes de la pandemia. Unos años después, estaba a punto de ser sentada junto a una personita especial. La vida está llena de cambios, y tu cambiaste mi vida de una manera increíble, y ahora cada vez que me da miedo otro cambio sé que estarás ahí para abrazarme y acompañarme en cada pasito. Te amo bebé <3',
'2024-03-14': 'Como soy nerd, tengo que decirte que hoy es el Día de Pi. Este número es una de esas cositas de las matemáticas que me fascina y me hace reflexionar mucho: en su infinidad de dígitos podría estar contenido cualquier cosa de nuestro mundo: desde una canción de Taylor hasta el texto entero de Orgullo y Prejuicio. Incluso podría estar nuestra historia de amor, escondida entre la distribución de números, tan alejada que jamás la descubriríamos pero al mismo tiempo tan cerca de nosotras en cualquier figura de la naturaleza. Quizá, lo más bello de esta historia de amor sea la idea de poder explorar estos misterios del universo juntitas. Te amo, mi compañera de vida <3',
'2024-03-15': 'Hoy cumplimos 8 increíbles meses de salir, y aprovechando el Día de las Verdaderas Confesiones quería contarte algo. Ya sabías esto, pero sentí que era el día para hablar de eso: desde que me tocó trabajar contigo en MUNAM 2022 no te podía quitar los ojitos de encima, una niña tan preciosa y a la vez que le apasionaban tanto las mismas cositas que a mí, te volviste esa personita que quería conocer más pero que nunca supe como acercarme. ¿Que lindo que al final todo pasó como debía no? Gracias por haber sido mi mastermind y por los mejores 8 meses de mi vida preciosa, te adoro <3',
'2024-03-16': 'Hoy quería contarte que para mí no hay nada más lindo que verte apasionada por algo, verte esforzarte para cumplir tus metas y tus sueños, por crecer y ser una mejor persona. Amo que me cuentes todo sobre tu vida, amo oírte hablar de medicina, adoro oírte hablar de las infancias cuando vas a trabajar, se me iluminan los ojitos como a tí cuando me hablas de la educación, etc. Quiero que sepas que siempre te voy a ayudar para que puedas cumplir esos sueños que tienes, quiero verte como doctora, quiero verte luchando por las cosas que son importantes para tí, y quiero verte feliz. Te amo, y te acompañaré en todo <3',
'2024-03-17': 'Si no me fallan las cuentas, fue hoy que nos sentaron juntas por primera vez, antes de que tuviéramos la plática del Tec mientras tu veías tu grupito de propes. No sé si Ile lo hizo al azar, si fue a propósito, si todo fue parte del guión, pero no sabes como me emocioné al ver tu nombrecito junto al mío cuando llegué ese día. Aunque no nos duró mucho, amé compartir chistecitos y cositas contigo ese día, y sentí bonito de platicar contigo después de tanto tiempo.',
'2024-03-18': 'Hoy es el Día de los Momentos Incómodos, y la verdad me dio risa que sea un día después de que nos sentaron juntas. Afortunadamente creo que nunca he tenido momentos incómodos contigo, siento que a pesar de que la manera en la que empezamos a hablar estuvo chistosa (cuando se durmió Nia) logramos conectar muy rápido y en pocos días hablar contigo se volvió mi cosa favorita y lo que me daba motivación para levantarme e ir a la escuela o ponerme a trabajar cada mañana. Gracias por vivir esos momentos tan lindos conmigo, te amo mi académica preciosa <3',
'2024-03-19': 'Me pasa mucho que me paso el día pensando en lo bonito que es tener una novia con la que me sienta tan cómoda y que me ayuda a explorar cositas nuevas de mí. Termino pensando en lo mucho que amo platicar y tener aventuras con ella, como quiero abracitos y besitos suyos, y como quisiera que todos los días pudiera regresar a casa con ella a darle besitos y dormir a su lado. Sé que algún día todos esos sueños que tengo contigo se van a cumplir, y no puedo esperar. Pero mientras, gracias por hacer todas estas cositas conmigo, por quererme tanto y por ser tan linda conmigo, te amo cielo <3',
'2024-03-20': 'Hoy es el Día Internacional de la Felicidad, así que quería aprovechar para agradecer a la personita que me hace feliz todos los días. Gracias por siempre sacarme una sonrisa desde que te levantas y me mandas tu mensajito precioso de buenos días, por hacerme reír con tus tonterías, por apoyarme cuando no estoy del todo bien, por consentirme, y por siempre estar pendiente. Tú me enseñaste la magia que puede tener una sonrisita como la tuya. Te amo bebé, y me voy a esforzar por hacerte aún más feliz todos los días :D',
'2024-03-21': 'Hoy es el día de lo de las flores amarillas y marca el inicio de la primavera (más o menos), así que quería aprovechar para agradecerte porque cada día contigo se siente como primavera: todo vuelve a crecer, lleno de florecitas, un sol brillante y el mundo lleno de color. Te quiero con todo mi corazón bebé, no sé si habré podido conseguir florecitas pero seguro te daré algo bonito para que recuerdes, te adoro muchísimo mi princesita <3',
'2024-03-22': 'Ya solo falta hoy para que empiecen las vacaciones de Semana Santa así que quería darte un último ánimo, ya casi tendremos un ratito para descansar y con un poquito de suerte quizá podamos hacer muchas cosas padres en estas dos semanitas, o quizás decidas estudiar y te apoyaré lo más que pueda. Te adoro muchísimo mi vida, espero que tengas un bonito día y nos la pasemos lindo en las vacaciones <3',
'2024-03-23': 'Hoy toca felicitarte porque es el Día del Orgullo Ravenclaw (aunque quizás deberías ser Gryffindor porque me recuerdas a Hermione JAJAJA). Me da mucha risa que sea tu casa porque eres súper inteligente, aunque sabes que me fascina que seas así y que me motives a superarme más. Es bonito tener a alguien con quien compartir cositas que otras personitas considerarían nerds (y si yo soy más y soporta), y amo oírte hablar de tus cosas de medicina y así. Espero que tengas un bonito día mi niña, te adoro mi futura doctora <3',
'2024-03-24': 'Andaba pensando en lo linda que eres y en mis cositas favoritas de tí, así que hoy solo te quería decir que me fascina tu pelito precioso, siempre te lo dejas súper bonito (ya sea largo o cortito) y cuando te pones rizos o te peinas de formas especiales solo puedo pensar en lo stunning que te ves. También me fascina como huele (ya préstame el perfume de pelito jsjsjs), y amo jugar con el y acariciártelo como perrito. Estás preciosa mi vida, para mi eres y siempre serás la niña más bonita de mi salón y del mundo entero, y soy súper afortunada de tenerte <3',
'2024-03-25': 'Hoy es el Día Internacional del Waffle y me recordó a nuestra date en La Libertad. Amo muchísimo las cositas que hacemos juntas mi vida, me encantan nuestras dates y que siempre busquemos algo diferente o nuevo para hacer. Amo verte siempre que podemos y me encanta cuando hacemos un plan aesthetic, cuando vamos a pasear, o cuando intentamos algo nuevo. Te amo con todo mi corazoncito mi niña, espero que podamos comer waffles de nuevo pronto :)',
'2024-03-26': 'Algo que me encanta de tí y de nosotras son nuestros chistecitos y como nos molestamos y hacemos pendejadas. Me hacen sentir muy unida a tí y me encanta divertirme así contigo, amo que eres una persona con la que puedo pasar de hablar de cosas súper serias a hacer chistes de ratas en dos segundos. Aunque siempre te hago drama amaba como en el principio me dabas empujoncitos y siempre me jodías con todo, me da risa que de alguna manera se volvió nuestro love language. Te adoro mi ximonito <3',
'2024-03-27': 'Andaba pensando en lo bonito que se siente siempre agarrar esa manita preciosa que tienes. Es una forma quizá pequeñita pero tan delicada y especial de contacto físico que me hace sentir muy bonito por dentro; por eso siempre te digo la frase de caminar agarraditas de la mano, porque es lo que sueño poder hacer algún día. Para mí simboliza que realmente somos la persona del otro y vamos juntitas a todos lados, y me llena de amor cada vez que me pides la manita o me dejas agarrarla, más si me dejas darle un besito. Te adoro bebé, sigamos caminando juntitas <3',
'2024-03-28': 'Supongo que ya sabes que soy una intensa y siempre ando pensando en tí, y justo ahorita andaba pensando en nuestras dates y en lo lindo que fue para mi que desde la primera vez en Galerías siempre nos sentamos juntitas. Creo que es un detallito que quizá es pequeño pero para mí es súper bonito, el poder sentirte más cerquita y poder agarrarte la manita y abrazarte mientras tenemos esos ratitos juntos me fascina, y adoro que a ti igual te gusten esas cositas. Te amo y amo nuestra relación, gracias por elegirme todos los días mi preciosa <3',
'2024-03-29': 'Otra cosa que amo de nosotras es que podemos ser intensas juntas. Quizá ya lo sabías pero amo pensar en vivir un futuro contigo, en apoyarte mientras estudias, en casarnos, en viajar, en tener gatitos, en quizá ser papás algún día, y en poder vivir miles de cosas increíbles a tu lado todos los días. Siento que tu verdaderamente eres mi persona, y confío en el guión para que pase todo lo que sueño contigo. Gracias por permitirme ser intensa contigo, amo platicar de estas cositas contigo, amo que no me tengo que limitar y que te puedo mostrar mi amor como soy, te adoro mi amorcito <3',
'2024-03-30': 'Hoy es el Día del Lápiz, y me dio risa cuando me salió porque estas notitas las ando escribiendo en computadora en vez de con lápiz. De todas maneras, quería aprovechar para decirte que amo escribirte estas notitas, se que hay muchas raritas o nerds o quizá cursis pero soportas. Amo poder demostrarte así mi amor y poder contarte cositas random que sé o que fui buscando, siento que puedo compartir un pedacito de mi corazón contigo todos los días. Te amo mi corazoncito precioso <3',
'2024-03-31': 'Después del Día del Lápiz de ayer hoy es el Día de los Crayones en EE.UU., y me recordó a cuando dibujamos cositas chistosas en tu libretita y en como te ríes de mis gatitos mal dibujados y de mis letras al revés. Siento bonito de recordarlo porque sé que no te burlas como otras personas, sino que nos reímos juntitas y hacemos de ratos que pueden ser aburridos como una clase (o el line-by-line) algo en donde nos la pasamos bien juntitas. Amo recordar hasta las cositas pequeñas así contigo, gracias por hacer de cada cosita conmigo algo especial, te adoro <3',
'2024-04-01': 'Empezando abril solo quiero desearte que este sea un mes bonito bebé, estoy segura de que tendremos muchos momentitos bonitos y me aseguraré de cuidarte y hacerte feliz todos los días :). Gracias por otro mes juntitas mi niña preciosa, te adoro mucho y espero que tengamos muchísimos meses juntitas más. Eres increíble mi vida, te adoro <3',
'2024-04-02': 'Hoy quería agradecerte por algo que quizás es pequeñito, pero que valoro muchísimo todos los días: los mensajitos de buenos días que me mandas todos los días. En los días de escuela me ayudan mucho a animarme sabiendo que te voy a poder ver en un ratito y darte un abracito fuerte, y cuando no aunque muchas veces me despierto antes que tú siento súper bonito de saber que piensas en mi cuando te levantas de tus sueños (espero muy bonitos). Gracias por todos esos esfuerzos pequeñitos que haces por mí mi vida, te adoro <3',
'2024-04-03': 'Hoy es el Día Mundial del Arcoíris, y me hizo pensar en ti porque tu eres como ese tesoro precioso que encontré al final de un caminito lleno de colores, como fue llegar a conocerte y empezar a conectar contigo. Podría pasarme toda la vida buscando, pero jamás encontraría algo igual de valioso que tú y todo el amorcito que me das. Eres la mejor niña del mundo, te adoro y espero que siempre seas mi tesorito :)',
'2024-04-04': '¡Feliz día bebé! Hoy es el Día Mundial de la Rata, así que no quería dejar pasar la ocasión sin felicitarte por ser la mejor rata del mundo. Más que robar quesito, tu robas mi corazoncito todos los días, y me lo cuidas muy muy bonito. Te adoro bebé, soportas que ame molestarte y espero que tengas un día muy bonito :)',
'2024-04-05': 'Otra cosa que amo de tí son los detallitos que me das de vez en cuando. Amo tus notitas, tus cartitas, tus regalitos, incluso cuando solo me haces un dibujito de una hormiguita, amo cada uno de ellos porque siento que pones una partecita de tí en cada uno y todo el amor posible. Guardo todas esas cositas y me encanta verlas o releerlas de vez en cuando, me salen lagrimitas siempre y me hacen muy muy feliz y me llenan de amorcito. Siempre las voy a cuidar como a tu corazoncito precioso. Gracias por ser tan detallista conmigo corazón, te amo mucho <3',
'2024-04-06': 'Me dió penita pero andaba pensando en tu carita y en darle besitos y se me ocurrió que quiero decirte que amo tu naricita, está super bonita y amo darle besitos normales y de esquimal. También me fascinan tus cachetitos, se te ven preciosos y adorables y me gusta apretártelos suavecito y ver como reaccionas. Adoro todas las cositas de tu cara, estás super preciosa y te lo seguiré recordando una y otra vez para que nunca se te olvide. Te adoro mi niña bonita <3',
'2024-04-07': 'Mañana regresamos a clases así que solo quería decirte que vamos a terminar lo que queda del semestre con todo mi niña, vamos a lograr que nos vaya bien y estemos bien y que te voy a apoyar en todo lo que queda. Te adoro bebé, sé que se vienen cositas díficiles pero también muchísimas cositas increíbles y vamos a estar juntitas para apoyarnos en todo <3',
'2024-04-08': 'Hoy se cumplen 0.6\u0305 del año desde que empezó lo más bonito que me ha pasado en la vida, el poder llamar novia a la niña de mis sueños y poder acompañarla aún más de cerca en cada caminito que nos da la vida. Además para mi es especial porque es el mes 8 de nuestra relación que empezó el 8/8 :). Gracias por otro mes más compartiendo tanto amor y pendejadas contigo, estos han sido los mejores meses de mi vida y quiero que sepas que todos los días haces de mi vida algo precioso y lleno de magia. Eres lo mejor que me pudo haber pasado corazón, y espero tengamos muchísimos meses, años, y que podamos algún día cumplir juntas nuestros sueños. Te adoro mi bebé <3',
'2024-04-09': 'Hoy es el Día del Unicornio, así que soportas que hoy te toca ser mi unicornio porque soñaba con tener uno, así como siempre soñé con encontrarme a una personita tan increíble como tú (y resultaste ser aún mejor). También me hizo pensar que me gustaría mucho ir en una plaza montando en los unicornios de los que se rentan contigo, siento que nos reiríamos mucho y tendríamos un ratito muy bonito. Te adoro con todo mi corazoncito mi princesita unicornio <3',
'2024-04-10': 'placeholder for 2024-04-10',
'2024-04-11': 'placeholder for 2024-04-11',
'2024-04-12': 'placeholder for 2024-04-12',
'2024-04-13': 'placeholder for 2024-04-13',
'2024-04-14': 'placeholder for 2024-04-14',
'2024-04-15': 'MESI',
'2024-04-16': 'DIA DEL PIJAMA',
'2024-04-17': 'DIA DE LAS BOLAS DE QUESO',
'2024-04-18': 'placeholder for 2024-04-18',
'2024-04-19': 'placeholder for 2024-04-19',
'2024-04-20': 'placeholder for 2024-04-20',
'2024-04-21': 'XIME Y YO RESOLVIMOS CON ILE LO DEL SM',



'2024-04-22': 'placeholder for 2024-04-22',
'2024-04-23': 'DIA DEL LIBRO',
'2024-04-24': 'INAG SM',
'2024-04-25': 'placeholder for 2024-04-25',
'2024-04-26': 'placeholder for 2024-04-26',
'2024-04-27': 'placeholder for 2024-04-27',
'2024-04-28': 'CLAUSURA SM',
'2024-04-29': 'placeholder for 2024-04-29',
'2024-04-30': 'placeholder for 2024-04-30',
'2024-05-01': 'placeholder for 2024-05-01',


'2024-05-02': 'placeholder for 2024-05-02',
'2024-05-03': 'placeholder for 2024-05-03',
'2024-05-04': 'placeholder for 2024-05-04',
'2024-05-05': 'placeholder for 2024-05-05',
'2024-05-06': 'placeholder for 2024-05-06',


'2024-05-07': 'placeholder for 2024-05-07',
'2024-05-08': 'placeholder for 2024-05-08',
'2024-05-09': 'placeholder for 2024-05-09',
'2024-05-10': 'placeholder for 2024-05-10',
'2024-05-11': 'ME PIDIO FOTITO PARA LA PRESENTACION DE MAESTROS',
'2024-05-12': 'placeholder for 2024-05-12',
'2024-05-13': 'placeholder for 2024-05-13',
'2024-05-14': 'placeholder for 2024-05-14',
'2024-05-15': 'placeholder for 2024-05-15',
'2024-05-16': 'placeholder for 2024-05-16',
'2024-05-17': 'placeholder for 2024-05-17',
'2024-05-18': 'placeholder for 2024-05-18',
'2024-05-19': 'placeholder for 2024-05-19',
'2024-05-20': 'placeholder for 2024-05-20',
'2024-05-21': 'placeholder for 2024-05-21',
'2024-05-22': 'PRESENTACION CON MAESTROS y HICIMOS EQUIPO JUNTAS',
'2024-05-23': 'placeholder for 2024-05-23',
'2024-05-24': 'GANAMOS SG',
'2024-05-25': 'FUIMOS A PLATICA SDGS y PRIMERA LLAMADITA',
'2024-05-26': 'EMPEZAMOS A PLATICAR',
'2024-05-27': 'placeholder for 2024-05-27',
'2024-05-28': 'placeholder for 2024-05-28',
'2024-05-29': 'placeholder for 2024-05-29',
'2024-05-30': 'placeholder for 2024-05-30',
'2024-05-31': 'placeholder for 2024-05-31',
'2024-06-01': 'EN LA NOCHE LA AYUDE CON LO DE EMMA',
'2024-06-02': 'placeholder for 2024-06-02',
'2024-06-03': 'placeholder for 2024-06-03',
'2024-06-04': 'placeholder for 2024-06-04',
'2024-06-05': 'placeholder for 2024-06-05',
'2024-06-06': 'placeholder for 2024-06-06',
'2024-06-07': 'placeholder for 2024-06-07',
'2024-06-08': 'placeholder for 2024-06-08',
'2024-06-09': 'placeholder for 2024-06-09',
'2024-06-10': 'placeholder for 2024-06-10',
'2024-06-11': 'placeholder for 2024-06-11',
'2024-06-12': 'ME LLEGO EL LINK DE TAYLOR',
'2024-06-13': 'placeholder for 2024-06-13',
'2024-06-14': 'CONSEGUIMOS BOLETOS TAYLOR',
'2024-06-15': 'placeholder for 2024-06-15',
'2024-06-16': 'placeholder for 2024-06-16',
'2024-06-17': 'placeholder for 2024-06-17',
'2024-06-18': 'placeholder for 2024-06-18',
'2024-06-19': 'placeholder for 2024-06-19',
'2024-06-20': 'placeholder for 2024-06-20',
'2024-06-21': 'placeholder for 2024-06-21',
'2024-06-22': 'placeholder for 2024-06-22',
'2024-06-23': 'placeholder for 2024-06-23',
'2024-06-24': 'placeholder for 2024-06-24',
'2024-06-25': 'placeholder for 2024-06-25',
'2024-06-26': 'placeholder for 2024-06-26',
'2024-06-27': 'placeholder for 2024-06-27',
'2024-06-28': 'placeholder for 2024-06-28',
'2024-06-29': 'placeholder for 2024-06-29',
'2024-06-30': 'placeholder for 2024-06-30',
'2024-07-01': 'placeholder for 2024-07-01',
'2024-07-02': 'placeholder for 2024-07-02',
'2024-07-03': 'placeholder for 2024-07-03',
'2024-07-04': 'placeholder for 2024-07-04',
'2024-07-05': 'placeholder for 2024-07-05',
'2024-07-06': 'placeholder for 2024-07-06',
'2024-07-07': 'placeholder for 2024-07-07',
'2024-07-08': 'placeholder for 2024-07-08',
'2024-07-09': 'placeholder for 2024-07-09',
'2024-07-10': 'placeholder for 2024-07-10',
'2024-07-11': 'placeholder for 2024-07-11',
'2024-07-12': 'placeholder for 2024-07-12',
'2024-07-13': 'ME DIO LA PULSERA',
'2024-07-14': 'placeholder for 2024-07-14',
'2024-07-15': 'EMPEZAMOS A SALIR',
'2024-07-16': 'placeholder for 2024-07-16',
'2024-07-17': 'placeholder for 2024-07-17',
'2024-07-18': 'placeholder for 2024-07-18',
'2024-07-19': 'placeholder for 2024-07-19',
'2024-07-20': 'placeholder for 2024-07-20',
'2024-07-21': 'placeholder for 2024-07-21',
'2024-07-22': 'placeholder for 2024-07-22',
'2024-07-23': 'placeholder for 2024-07-23',
'2024-07-24': 'placeholder for 2024-07-24',
'2024-07-25': 'placeholder for 2024-07-25',
'2024-07-26': 'placeholder for 2024-07-26',
'2024-07-27': 'placeholder for 2024-07-27',
'2024-07-28': 'placeholder for 2024-07-28',
'2024-07-29': 'placeholder for 2024-07-29',
'2024-07-30': 'placeholder for 2024-07-30',
'2024-07-31': 'placeholder for 2024-07-31',
'2024-08-01': 'placeholder for 2024-08-01',
'2024-08-02': 'placeholder for 2024-08-02',
'2024-08-03': 'placeholder for 2024-08-03',
'2024-08-04': 'placeholder for 2024-08-04',
'2024-08-05': 'placeholder for 2024-08-05',
'2024-08-06': 'placeholder for 2024-08-06',
'2024-08-07': 'placeholder for 2024-08-07',
'2024-08-08': 'placeholder for 2024-08-08',
});

final especialMap = SplayTreeMap<String, String>.from({
  '2024-02-11': '',
  '2024-02-14': '',
  '2024-02-15': '',
  '2024-02-22': 'LE MANDE MENSAJE POR LA INVESTIGACION',
  '2024-03-08': '',
  '2024-03-15': '',
  '2024-03-17': 'NOS SENTARON JUNTAS',
  '2024-04-08': '',
  '2024-04-15': '',
  '2024-04-28': 'CLAUSURA SM? podria poner todo lo que quise decirle...',
  '2024-05-08': '',
  '2024-05-15': '',
  '2024-05-22': 'PRESENTACION CON MAESTROS Y EQUIPO JUNTAS',
  '2024-05-25': 'PRIMERA LLAMADITA Y DESPUES EMPEZAMOS A PLATICAR',
  '2024-06-08': '',
  '2024-06-15': '',
  '2024-07-08': '',
  '2024-07-15': '',
  '2024-08-08': '',
});