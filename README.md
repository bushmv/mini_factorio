
# mini factorio

mini factorio - небольшое приложение, написанное используя язык Java и Processing, реализующее логику транспортеров и сборочных зданий популярной игры factorio (и других подобных).

Основная цель - показать как можно реализовать подобную логику, поэтому графически все элементы выглядят как простые геометрические фигуры.

Пару изображений для сравнения. 

Слева оригинал с хорошими текстурами: 3 части транспортера, соединенные между собой и 8 предметов на последней части. Справа та же логика, но вместо красивой картинки прямоугольники и окружности.

![Image alt](https://github.com/bushmv/mini_factorio/blob/master/images/img1.png)

В оригинале при повороте предметы на транспортере идут по дугообразной траектории. В данном варианте для простоты все предметы идут под прямым углом. Однако можно заметить, что внутренний радиус окружности, которую описывают предметы на угловом транспортере меньше, чем внешний. Поэтому на внутренней окружности располагается 3 предмета, а на внешнем - 5. Вместе они все равно дают 8 предметов.

![Image alt](https://github.com/bushmv/mini_factorio/blob/master/images/img2.png)

Вся оставшаяся часть посвящена описанию реализации логики. Если вы хотите просто посмотреть на реализацию, не разбираясь с устройством, вы можете склонировать репозиторий, изменить в  файле mini_factorio создание файла Instance с помощью типа DEMO, следующим образом

![Image alt](https://github.com/bushmv/mini_factorio/blob/master/images/img3.png)

Найдите файл Demo.pde и выберите любой класс для демонстрации, остальные закомментируйте. Например, чтобы посмотреть на то, как транспортер перемещает предметы справа налево по прямому транспортеру, раскомментируйте класс RightToLeftDirectTransporterDemo

![Image alt](https://github.com/bushmv/mini_factorio/blob/master/images/img4.png)

## Как это работает

Каждый транспортер состоит из отдельных частей. Каждая часть может поместить 8 предметов (4 слева от центра и 4 справа)

![Image alt](https://github.com/bushmv/mini_factorio/blob/master/images/img5.png)

Для хранения каждого предмета используется int(32-х битное число). Под каждый предмет отводится 4 бита, при этом 1 бит указывает на наличие предмета, а оставшиеся 3 на смещение (для создания более плавной анимации перемещения предметов)

В итоге если есть 8 предметов (от А до H)

![Image alt](https://github.com/bushmv/mini_factorio/blob/master/images/img6.png)

То они будут представлены следующим образом

![Image alt](https://github.com/bushmv/mini_factorio/blob/master/images/img7.png)

Буква от А до D - левая сторона, от E до H - правая

Первые 4 бита определяют первый предмет, вторые 4 бита(5 - 8) определяют второй предмет и т.д. При этом последний бит (выделенный с буквой) говорит о наличии предмета, а остальные 3 бита дают число от 0 до 7 - это смещение по транспортеру.

Каждый фрейм изменяет смещение. Если смещение меньше 7 - к смещению добавляется 1. Если смещение равно 7, то предмет двигается к следующей позиции, а все его 4 бита становятся равны 0. Движение начинается только если в есть свободные места для перемещения. Для примера приведен привет перемещения предмета из В в А.

![Image alt](https://github.com/bushmv/mini_factorio/blob/master/images/img8.png)

Подобное представление дает очевидное преимущество - независимость от изображения. Мы можем проверить логику транспортера, используя просто число, что удобно для unit тестов. Т.е. если транспортер имел значение 1000 0000 0000 0000 1000 0000 0000 0000, то после 24 (8 * 3) итераций он должен иметь значение состояния 0000 0000 0000 1000 0000 0000 0000 1000. Говоря проще, число -2147450880 после 24 итераций должно стать 524296. Для подобных вариантов довольно легко написать unit тесты (все тесты находятся в файле TEST.pde), так как отрисовывать сам транспортер не требуется

## Обновление транспортера

Каждый транспортер состоит из частей (тех самых прямоугольников). Несколько частей образуют транспортер в виде ссылок на предыдущую часть. Т.е. транспортер - это связный список.

![Image alt](https://github.com/bushmv/mini_factorio/blob/master/images/img9.png)

Когда мы хотим обновить транспортер (передвинуть предметы на транспортере), мы вызываем отрисовку самой первой (№3) части транспортера. Если у части №3 previous не равен null, то он вызывает отрисовку для части №2 и т.д. Затем вызывается метод обновления для части №3 и всех частей в списке. Затем вызывается метод отрисовки предметов на транспортере по той же логике 

## Иерархия частей транспортера

Есть 3 типа частей, которые по разному реализуют логику перемещения

- DirectTransporterPart - самый простой, представляет перемещение по прямой (например слева направо).

![Image alt](https://github.com/bushmv/mini_factorio/blob/master/images/img10.png)

- ClockWiseAngleAngleTransporterPart - представляет перемещение по часовой стрелке (например слева вниз)

![Image alt](https://github.com/bushmv/mini_factorio/blob/master/images/img11.png)

- AntiClockWiseAngleTransporterPart - представляет перемещение против часовой стрелки

![Image alt](https://github.com/bushmv/mini_factorio/blob/master/images/img21.png)

Каждый тип имеет 4 вида, буквы обозначают направление - откуда и куда движется. Например RD - означает движение справа вниз (left, right,down, up) 

Угловые части транспортера имеют различную длину для внутренней и внешней(левой и правой) сторон. Это так, т.к. длина радиуса внешней окружности больше и прохождение ее должно занимать больше времени.

## Resources

Помимо наличия предмета на транспортере, нужно знать какой конкретно это предмет. Каждый предмет кодируется с помощью id, или просто номера. Для хранения предмета используется 8 бит, т.е. возможно 255 (0 - нет предметов) возможных вариантов предметов.

Для удобства предметы слева и справа от центра хранятся в отдельном int. Когда происходит перемещение из одной позиции транспортера в следующую, номер предмета также копируется в следующие 8 бит. 

Для примера возьмем пример выше, но добавим ему тип предмета.

![Image alt](https://github.com/bushmv/mini_factorio/blob/master/images/img12.png)

Слева также остался статус, справа int, представляющий тип ресурсов слева от центра. 

Предмет В находится на втором месте и кодируется вторыми 8-ю битами(обозначены зеленым). В тот момент, когда В переходит в позицию А (на последней итерации), значение id предмета копируется в следующие 8 бит (т.е. в первые, выделенные красным)

Так происходит перемещение предметов и типа ресурса, который этот предмет представляет

## Splitter

Splitter, или разделитель - элемент, который делит один транспортер на 2, разделяя элементы поровну между ними.

Разделитель состоит из 2-х частей (DirectTransporterPart), которые обновляются независимо

Если есть свободное место на обоих транспортерах, предметы кладутся по очереди в первый и второй, сохраняя позицию относительно центра(слева или справа). 

Если свободен только один транспортер разделителя, то все предметы переходят на него

![Image alt](https://github.com/bushmv/mini_factorio/blob/master/images/img13.png)

Возьмем для примера 2 части транспортера, полностью загруженные предметами (изображения слева). Каждого предмета по 8 штук, всего 16. Транспортер должен разделить эти предметы поровну, на 2 транспортера. 

Для этого транспортер делит весь транспортер на 3 линии: 2 те, что идет спереди и 1 позади

## Mediator

Mediator - общий класс для передачи предметов. Медиатор является посредником между 2 типами - один может удалить с себя предмете (интерфейс Removable), а второй может принять на себя предметы (Insertable). В качестве медиатора может выступать все что угодно, например транспортер, который "врезается" в другой транспортер

![Image alt](https://github.com/bushmv/mini_factorio/blob/master/images/img14.png)

В данном случае медиатор никак не изображается, но он находится находится между 2 частями транспортера. Если из removable можно взять предмет, медиатор берет. Если в insertable можно "вставить" предмет, медиатор вставляет. В данном случае то, какие предметы берутся, в каком порядке и куда кладутся зависит от реализации removable и insertable, но не от медиатора. В оригинале они смешиваются, в данной версии сначала передаются предметы слева, если они есть, а затем справа (поэтому все кружочки первые). 

Таким образом можно добавлять различную логику перемещения предмета от одной части к другой вне зависимости что из себя эти части представляют.

![Image alt](https://github.com/bushmv/mini_factorio/blob/master/images/img15.png)

## Underground transporter

Транспортер может быть проложен под землей. Подземный транспортер ничем не отличается от наземного, кроме того что его не нужно изображать на экране. Визуально здесь подземный транспортер не отличается от наземного, но логика остается такой же. В некоторый момент предметы на транспортере просто пропадают и через некоторое время появляются с другой стороны.

![Image alt](https://github.com/bushmv/mini_factorio/blob/master/images/img16.png)

## MiningDrill

MiningDrilll добывает предметы. Для того, чтобы положить предметы на транспортер нужен медиатор. Сам MiningDrill реализует интерфейс Removable, т.к. из него можно взять предмет.

![Image alt](https://github.com/bushmv/mini_factorio/blob/master/images/img17.png)

## Manipulator

Манипулятор способен перекладывать предметы с одного транспортера на другой. Он также расширяет интерфейс Mediator, значит ему нужны insertable и removable, которые могут быть

![Image alt](https://github.com/bushmv/mini_factorio/blob/master/images/img18.png)

у манипулятора есть 4 состояния:

- ожидает предмета (постоянно опрашивая removable)
- перемещение предмета к insertable (т.е. с первого транспортера на второй)
- ожидание возможности вставить предмет (постоянно опрашивает insertable), т.к. возмоно второй транспортер полностью занят предметами
- Возвращение обратно к ожиданию предмета.

Транспортер в различных состояниях

![Image alt](https://github.com/bushmv/mini_factorio/blob/master/images/img19.png)

Визуально в данной версии транспортер это окружность с выделенной прямой линией, которая показывает что собирается делать манипулятор

## Assembler 

Самым важным является ассемблер, или сборщик. Он принимает в себя некоторые ресурсы и делает из них новый ресурс. 

Для определения того, что делает сборщик, существует класс рецепта (Recipe). Он говорит, сколько предметов ему нужно, каких конкретно предметов и сколько нужно каждого предмета и какой предмет можно получить с помощью этого предмета. 

Вот как выглядит логика для 3-х элементов: транспортера, манипулятора и ассемблера. 

Ассемблер хранит в себе рецепт и знает, сколько ему нужно и каких предметов. Также он знает, сколько и каких предметов у него сейчас. Медиатор знает о транспортере (об removable,  а точнее об peekRemovable. Этот интерфейс позволяет узнать предметы, не убирая их с транспортера) и знает, какие предметы на нем находятся. Медиатор подсмтривает все предметы и сохраняет их в массив, после чего для каждого предмета спрашивает, нужен ли он ассемблеру. Ассемблер сам решит, нужен ли ему данный предмет. Если нужен, медиатор через PeekRemovable удаляет предмет, а через CheckBeforeInsertable вставляет предмет в ассемблер. Ассемблер также хранит лимит для каждого ресурса, чтобы он не накапливал один из двух нужных ресурсов постоянно.

Ассемблер имеет 3 состояния:

- ожидание сбора всех ресурсов
- производство (при этом ресурсы продолжают поступать)
- ожидание, когда предметы заберут из ассемблера. В этом состоянии ассемблер не принимает предметы

![Image alt](https://github.com/bushmv/mini_factorio/blob/master/images/img20.png)

Примерно так можно реаизовать базовую логику для подобных перемещений.
