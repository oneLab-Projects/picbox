![Picbox](https://user-images.githubusercontent.com/25152332/79056633-36209b80-7c61-11ea-9e75-07acb2f84444.png)

#
###### Language: [English](https://github.com/oneLab-Projects/picbox/blob/master/README.md) • [Русский](https://github.com/oneLab-Projects/picbox/blob/master/README-ru.md)
[![android](https://github.com/oneLab-Projects/picbox/workflows/android/badge.svg)](https://github.com/oneLab-Projects/picbox/actions)
[![CodeFactor](https://www.codefactor.io/repository/github/onelab-projects/picbox/badge)](https://www.codefactor.io/repository/github/onelab-projects/picbox)
### Разворачивание среды

> Убедитесь, что в системе установлен Flutter (master).

#### Обязательные плагины для VSCode

- Dart
- Flutter

#### Рекомендуемые плагины для VSCode

- [GitLens](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens)
- [Awesome Flutter Snippets](https://marketplace.visualstudio.com/items?itemName=Nash.awesome-flutter-snippets)
- [Pubspec Assist](https://marketplace.visualstudio.com/items?itemName=jeroen-meijer.pubspec-assist)
- [dart-import](https://marketplace.visualstudio.com/items?itemName=luanpotter.dart-import)
- [#region folding for VS Code](https://marketplace.visualstudio.com/items?itemName=maptz.regionfolder)
- [Todo Tree](https://marketplace.visualstudio.com/items?itemName=Gruntfuggly.todo-tree)
- [VSCode Great Icons](https://marketplace.visualstudio.com/items?itemName=emmanuelbeziat.vscode-great-icons)
- [One Monokai Theme](https://marketplace.visualstudio.com/items?itemName=azemoh.one-monokai)

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
