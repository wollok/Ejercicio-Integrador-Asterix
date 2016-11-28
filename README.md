# Astérix el galo

##Ejercicio integrador

**Estamos en el año 50 antes de Jesucristo. Toda la Galia está ocupada por los romanos. ¿Toda? ¡No! Una aldea poblada por irreductibles galos resiste todavía y siempre al invasor…**

![asterix](https://pbs.twimg.com/profile_images/581484737182724096/0fl1wz69.png)

Se quieren modelar batallas entre galos y romanos, teniendo en cuenta que las personas pueden tomar pociones mágicas para mejorar su desempeño y unirse con otros guerreros para enfrentarse a sus enemigos en ejércitos.

###La poción mágica
Una poción se prepara mezclando diferentes ingredientes y el efecto de la poción dependerá de qué ingredientes tenga. Cuando una persona toma una poción cada uno de sus ingredientes afectar a la persona. 

De momento nos interesa modelar los siguientes ingredientes pero deben poder agregarse muchos más con facilidad:
- Dulce de leche: aumenta la fuerza en 10 unidades. Si la persona estaba fuera de combate, la revive con 2 puntos de resistencia.
- Manojo de muérdago: aumenta la fuerza en tantas unidades como el tamaño del manojo. Si es más de 5 además le disminuye a la mitad la resistencia.
- Aceite de roca (petra-oleum): vuelve a quien la ingiera tantas veces más fuerte como cm3 tenga la dosis.
- Zumo de Zanahoria: mismo efecto que el Aceite de roca, pero además su buen gusto agrega 1 a la resistencia.

1. Conocer el poder de una persona, que se calcula como el producto entre su fuerza y su resistencia.
2. Hacer que una persona reciba una cantidad de daño, disminuyendo su resistencia en esa cantidad. El mínimo de resistencia que puede tener una persona es 0, quedando fuera de combate.
3. Hacer que una persona tome una poción mágica modificandose de acuerdo a lo indicado.

###La unión hace a la fuerza
Las personas se pueden organizar en grupos para las batallas. Los grupos pueden luchar contra otros grupos o también contra personas individuales.

1. Calcular el poder de un grupo, siendo éste la sumatoria de los poderes de todos sus integrantes que no están fuera de combate.
2. Hacer que un grupo reciba un daño determinado, que se reparte en partes iguales entre los integrantes que van adelante. Los que van adelante son los 10 más poderosos (si son menos de 10 van todos adelante).
3. Hacer que un grupo o persona pelee contra un enemigo (otro grupo o persona). Cuando esto pasa, el menos poderoso recibe tanto daño como diferencia de poder haya con el contrincante. Pelear contra alguien no debe ser posible para grupos que tengan a todos su integrantes fuera de combate.

###Legiones romanas
En los romanos, a los grupos se los denomina “legiones” que, a diferencia de los grupos normales, pueden adoptar distintas formaciones modificando sus características básicas en el momento en que se usan:
- Formación “tortuga”: netamente defensiva, el poder de la legión es 0 pero ningún integrante recibe daño independientemente del daño recibido por la legión.
- Formación “en cuadro”: mantiene el mismo comportamiento que los ejércitos comunes en todo sentido, salvo por la cantidad de integrantes que van adelante. Esta cantidad se determina al armar la formación.
- Formación “frontem allargate”: el poder de la legión es un 10% por encima de lo normal, la mitad de los integrantes van adelante pero el daño a recibir se duplica.

1. Integrar a las legiones con sus posibles formaciones al sistema de modo que pueda seguir funcionando todo lo anterior también para legiones.
2. Tener en cuenta que la legión debe poder cambiar de formación en cualquier momento de la batalla arbitrariamente.
3. Si al recibir daño queda con un poder por debajo de un mínimo preestablecido (igual para todas las legiones independientemente de la formación adoptada) debe cambiar su formación a tortuga automáticamente.
