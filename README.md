![Picbox](https://user-images.githubusercontent.com/25152332/71856627-9b5e7100-30f5-11ea-8050-4a883f518222.png)
#
![android](https://github.com/oneLab-Projects/picbox/workflows/android/badge.svg)
[![CodeFactor](https://www.codefactor.io/repository/github/onelab-projects/picbox/badge)](https://www.codefactor.io/repository/github/onelab-projects/picbox)

### Разворачивание среды
> Убедитесь, что в системе установлен Flutter.

#### Обязательные плагины для VSCode
- Dart
- Flutter

#### Рекомендуемые плагины для VSCode
- Awesome Flutter Snippets
- Pubspec Assist
- dart-import
- #region folding for VS Code
- Todo Tree
- VSCode Great Icons
- One Monokai Theme

### Сборка
> Если консоль жалуется на команду flutter, попробуйте добавить путь к Flutter в Path.

#### Debug
```shell
flutter build --debug
```

#### Release
```shell
flutter build --release
```

### Параметры непрерывной интеграции
> У нас есть CI! И при оформлении коммитов, вы должны грамотно им пользоваться.
> При добавлении в описание коммита данных тегов, вы можете управлять дальнейшим процессом сборки.

#### Теги
- `[ignore]` – не выполнять процесс интеграции
- `[publish]` – опубликовать как релиз (обязательно ставить тег с версией, а также расписать последние изменения в описании коммита)
- Отсутствие какого-либо тега – сборка и публикация артефакта в workflow

#### Оформление тега с версией
v`год`.`месяц`.`день`.`номер сборки за весь день`

Например: v2020.1.21.1

## Лицензия

Лицензировано под [GNU Affero General Public License v3.0](https://github.com/oneLab-Projects/picbox/blob/master/LICENSE).

**Дополнительные условия лицензии:**

* Запрещается заменять или удалять из продуктов и компонентов Picbox оригинальный копирайт, логотип.
* В документации модифицированных версиях исходного и объектного кода Программного продукта должны отображать соответствующие правовые уведомления (см. [раздел 5 лицензии GNU AGPL v3.0](https://github.com/oneLab-Projects/picbox/blob/master/LICENSE#L196)).
