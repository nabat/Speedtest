# Тест швидкості
#### Даний модуль вимірює швидкість інтернету в користувацькому режимі
#### Опис
В папці SpeedTest знаходиться модуль.

В папці speedtest_api знаходиться API для модуля.

##### speedtest_api:
- garbage.pl - файл для тесту завантаження.
- empty.pl - файл для тесту відвантаження та пінгу.
- getIp.pl - файл для отримання IP.
- speedtest_worker.js - файл з інтерфейсом.

#### Установка:
Папку SpeedTest перемістити в /usr/abills/Abills/modules/

Папку speedtest_api перемістити в /usr/abills/Abills/templates/

В файлі **config.pl**:
```
@MODULES = (
             'SpeedTest'
           );
```


