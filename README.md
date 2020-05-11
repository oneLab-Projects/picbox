![Picbox](https://user-images.githubusercontent.com/25152332/79056633-36209b80-7c61-11ea-9e75-07acb2f84444.png)

#
###### Language: [English](https://github.com/oneLab-Projects/picbox/blob/master/README.md) • [Русский](https://github.com/oneLab-Projects/picbox/blob/master/README-ru.md)
[![android](https://github.com/oneLab-Projects/picbox/workflows/android/badge.svg)](https://github.com/oneLab-Projects/picbox/actions)
[![CodeFactor](https://www.codefactor.io/repository/github/onelab-projects/picbox/badge)](https://www.codefactor.io/repository/github/onelab-projects/picbox)

[![Package for beautiful interface](https://img.shields.io/badge/powered_by-pansy__ui-orange)](https://github.com/oneLab-Projects/pansy_ui)

### Deploying environment

> Make sure that Flutter (master) is installed in the system.

#### Required plugins for VSCode

- Dart
- Flutter

#### Recommended plugins for VSCode

- [GitLens](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens)
- [Awesome Flutter Snippets](https://marketplace.visualstudio.com/items?itemName=Nash.awesome-flutter-snippets)
- [Pubspec Assist](https://marketplace.visualstudio.com/items?itemName=jeroen-meijer.pubspec-assist)
- [dart-import](https://marketplace.visualstudio.com/items?itemName=luanpotter.dart-import)
- [#region folding for VS Code](https://marketplace.visualstudio.com/items?itemName=maptz.regionfolder)
- [Todo Tree](https://marketplace.visualstudio.com/items?itemName=Gruntfuggly.todo-tree)
- [VSCode Great Icons](https://marketplace.visualstudio.com/items?itemName=emmanuelbeziat.vscode-great-icons)
- [One Monokai Theme](https://marketplace.visualstudio.com/items?itemName=azemoh.one-monokai)

### Build

> If the console complains about the flutter command, try adding the path to Flutter in Path.

#### Debug

```shell
flutter build --debug
```

#### Release

```shell
flutter build --release
```

### Continuous integration parameters

> We have CI! And when you make a commit, you should continue to use it.
> When you add these tags to the commit description, you can control the further build process.

#### Tags

- `[ignore]` – don't perform the integration process
- `[publish]` – publish as a release (you must put a tag with the version, as well as describe the latest changes in the commit description)
- The absence of any tag – Assembly and publishing of artifact in the workflow

#### Design of the tag with the version

v`year`.`mouth`.`day`.`build number for the entire day`

For example: v2020.1.21.1

## License

Licensed under the [GNU Affero General Public License v3.0](https://github.com/oneLab-Projects/picbox/blob/master/LICENSE).

**Additional license conditions**

* You may not replace or remove the original copyright or logo from Picbox products or components.
* The documentation of the modified versions of the source and object code of the software product must display the appropriate legal notices (see [section 5 of the GNU AGPL v3.0](https://github.com/oneLab-Projects/picbox/blob/master/LICENSE#L196)).
