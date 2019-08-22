# README
#Lesson10
    Создать новое rails-приложение в отдельном репозитории (!!!)
    Используя scaffolding создать ресурс RailwayStation (как показано в скринкасте)
    Используя scaffolding создать ресурс Train, который имеет номер в качестве атрибута

#Lesson11
    Создать ресурс Маршруты (Routes), для которого возможны все CRUD-операции.
    Маршрут имеет название, требуется валидация на наличие этого атрибута.
    Внимание! Создать ресурс нужно вручную, без ипользования скаффолдинга и других генераторов (генератор можно использовать только для создания миграции).

#Lesson12
Создать (если еще не созданы) следюущие модели и добавить к ним ассоциации:

    Модель Маршрут имеет множество станций. Станция может принадлежать множеству маршрутов
    Поезд может иметь один маршрут, на одном маршруте может быть несколько поездов
    Билет содержит информацию о (связан с) поезде, начальной и конечной станциях. Билет принадлежит пользователю
    Пользователь может иметь произвольное кол-во билетов
    Поезд содержит информацию о билетах на него.
    Поезд связан с текущей станцией (ассоциация должна называться current_station)
    Станция имеет множество поездов (все поезда, у которых установлена ассоциация current_station с этой станцией)
#Lesson13
Внимание! При реализации заданий с этого урока запрещается использовать scaffolding. Все контроллеры должны создаваться вручную. Если что-то уже сделано через scaffolding, нужно "вычистить" контроллеры от ненужного.


    Сделать вывод списка станций, используя анонимные partials
    Сделать то же самое для списка поездов
    Через layout добавить на все страницы футер, содержащий информацию об авторе (о вас), например "(с) 2015 Иван Иванов (подставьте ваше имя). Учебный проект в онлайн-школе Thinknetica". Слова "онлайн-школе Thinknetica" нужно сделать ссылкой на www.thinknetica.com
    Создать интерфейс для создания/удаления/изменения маршрутов. Пока у маршрута может быть только название.
    Из интерфейса должна быть возможность назначать маршрут поезду из списка доступных маршрутов.
    При просмотре поезда, должно быть видно его маршрут или значение "Маршрут не назначен"
    При просмотре маршрута должен выводиться список поездов на этом маршруте (или сообщение "поездов на маршруте нет" и список станций, из которых состоит маршрут (или сообщение "станций в маршруте нет").
#Lesson14
    Возможность управления вагонами (добавление/удаление/изменение)
        - При добавлении вагона указывается поезд, к которому он добавляется, а также:
        - Тип вагона (купейный/плацкартный)
        - Кол-во мест: верхних/нижних
    При просмотре поезда, также должна отображаться следующая информация:
        - Кол-во плацкартный/купейных вагонов в составе поезда
        - Кол-во мест: плацкартных верхних/нижних, купейных верхних/нижних
#Lesson15
    Добавить возможность указать порядковый номер станции в маршруте (поле для сортировки). Учесть, что одна и та же станция может входить в разные маршруты и иметь разный порядковый номер в разных маршрутах. Пока установку порядкового номера сделать без веб-интерфейса, можно это делать через rails-консоль.
    Выводить список станций в маршруте по порядковому номеру (использовать скоуп для сортировки)
    Реализовать через STI следующие типы вагонов:
    - Купейный (имеет верхние и нижние места)
    - Плацкартный (имеет верхние/нижние места + боковые верхние и нижние)
    - СВ (имеет только нижние места)
    - Сидячий (имеет только сидячие места)

    При добавлении вагона к поезду, автоматически назначать вагону порядковый номер (использовать коллбеки).

    роверять уникальность номера вагона у поезда. Не может быть ситуации, когда у поезда 2 вагона с номером 11, например.

    На странице просмотра поезда выводить список номеров вагонов (как ссылки). При переходе по ссылке на конкретный вагон показывать тип вагона и актуальную информацию по нему (кол-во верхних/нижних мест, если есть - боковые и т.п. в зависимости от типа вагона)

У поезда сделать флаг (поле в таблице типа boolean) - сортировка вагона. Значения: с головы/c хвоста поезда. Если выбран вариант “с головы поезда”, то вагоны на странице поезда выводятся в прямом порядке, если “с хвоста поезда” - в обратном.

Усложненное задание: используя AR Query Interface, реализовать метод в модели Train, который принимает в качестве аргумента тип вагона и тип мест (вернхние/нижние/cидячие) и вовзращает их общее кол-во для поезда (т.е. считает по всем вагонам указанного типа).

 #Hole
 Сущности:
 1. Пользователи:
    - админимстраторы
    - обычные
 2. Станции(города)
 3. Маршруты
 4. Поезда:
    - маршрут
    - количество мест
    - количество свободных мест
5. Расписание
    -по каким числам ходит поезд
    - время отправления/прибытия на каждую станцию
6. Заказ:
    - создан
    - оплачен
7. Билет:
    - номер поезда
    - начальная станция
    - конечная станция

Связывание сущностей
 - на уровне БД
 - на уровне моделей

