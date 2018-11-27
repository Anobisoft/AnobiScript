# AnobiScript
iOS Developer Helpers

---

# Aliases
как подключать смотрите пример `.bash_profile`
### Xcode
- __openws__ - открывает все workspace файлы рекурсивно начиная с текущей директории.
- __xclear_mobileprovision__ - вычищает все provision профайлы из xcode.
- __xclear_deriveddata__ - не менее полезный алиас для вычищения DerivedData (все время забываю где именно эта папка).
- __xclear_cache__ - чистит кэш.
- __xclear__ - выполняет последовательно `xclear_mobileprovision && xclear_deriveddata && xclear_cache`.
- __killxcode__ - когда ничего не помогает (прибивает :hammer: жестко (-9) все процессы xcode).

### Pods
- __repod__ - короткий алиас для обновления подов в проекте без обновления репозиториев спецификаций 
- __repodexample__ - то же, но для папки Example (полезно для проектов библиотек поддерживающих управление зависимостями средствами Cocoapods)
- __podspecversion__ - показывает версию из спецификации podspec
- __podpush__ - валидирует, ставит тег на HEAD, пушит библиотеку, обновляет репозиторий спецификаций
- __clearpodcache__ - чистит кэш библиотек, полезно если на этапе публикации произошла ошибка и релиз нужно перенести

---

### xcodeprojfix_device_switch_button - исправляет баг отсутствия кнопок iPad/iPhone в секции Deployment Info везде где найдет
Баг лечится удалением строчки `CreatedOnToolsVersion = X.X.X;`, с чем скрипт прекрасно справляется.
Поиск начинается из директории указанной в параметре, или из текущей, если ничего не указанно.

---

# Refactoring
*Используйте с большой осторожностью! Всегда проверяйте изменения!*
### prefix example
```
cd $MyProjectPath
refactor '\([^A-Za-z]\)IndividualAccountType' '\1AFAIndividualAccountType' -e
refactorfiles IndividualAccountType AFAIndividualAccountType
git status
git diff
```

---

### filebirthdate - выводит даты создания файлов
```
filebirthdate ./D*
./Desktop:2015-08-13
./Documents:2015-07-09
./Downloads:2015-07-09
```

---

### colorize - скрипт для окраски текста при выводе в терминале
Заменяет текст после тэга вида `<color=Red>` на текст соответствующего цвета.<br />
Автоматически сбрасывает цвет _в конце строки_, либо вручную тэгом `</color>` в любом месте текста.<br />
Использовать так:<br />
`echo 'OMG! <color=Green>Green text. </color>Normal text. <color=Blue>Blue text. <color=Red>Red text' | colorize`<br />
Или так:<br />
`colorize 'OMG! <color=Green>Green text. </color>Normal text. <color=Blue>Blue text. <color=Red>Red text'`<br />

---

### iconsetwith1024ios - создает минимально необходимый набор иконок AppIcon.appiconset в папке с картинкой из параметра
**Важно!** требует наличия папки `iconsetwith1024json` с уже настроенным `Contents.json`

```
21:38:14 pletnev@WS0256 ~ # iconsetwith1024 ~/Documents/Resources/MyProject/icon-iOS_1024-itunes.png 
OK 3911 iconsetwith1024.log
21:39:12 pletnev@WS0256 ~ # ls ~/Documents/Resources/MyProject/AppIcon.appiconset/
Contents.json     Icon-180x180.png  Icon-58x58.png  Icon-87x87.png
Icon-120x120.png  Icon-20x20.png    Icon-60x60.png
Icon-152x152.png  Icon-29x29.png    Icon-76x76.png
Icon-167x167.png  Icon-40x40.png    Icon-80x80.png
```

---

# Webtest
### Набор скриптов для мониторинга в терминале состояния веб интефейсов
Некогда объяснять. Смотри пример:
```
cd webtest_example
webtest_loop 300 webtest_get.config_example webtest_post.config_example color > webtest.log& tail -f webtest.log
```

---

**ВНИМАНИЕ!** Скрипты написаны под GNU bash, версия 4.4.5(1)-release и не редко могут использовать GNU версии утилит. Настоятельно рекомендую использовать только самое лучшее!

```
\curl -sSL https://get.rvm.io | bash -s stable
rvm install ruby-2.5.1
rvm use ruby-2.5.1 --default
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install bash
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
chsh -s /usr/local/bin/bash

brew install coreutils findutils grep gawk gnu-sed gnu-tar gzip diffutils binutils wget --with-default-names
echo 'export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:$PATH"' >> ~/.bash_profile
```

*Это свободное программное обеспечение. Вы можете изменять и распространять его.<br />
НИКАКАЯ ГАРАНТИЯ не предоставляется в пределах, допускаемых законом.*
