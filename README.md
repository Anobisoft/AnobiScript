# AnobiScript
iOS Developer Helpers

**ВНИМАНИЕ!** Скрипты написаны под GNU bash, версия 4.4.5(1)-release и часто используют GNU версии утилит. Настоятельно рекомендую использовать только самое лучшее!

```
\curl -sSL https://get.rvm.io | bash -s stable
rvm install ruby-2.4.1
rvm use ruby-2.4.1 --default
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:$PATH"
brew install coreutils
brew install binutils
brew install bash
brew install grep --with-default-names
brew install gawk
brew install gnu-sed --with-default-names
brew install findutils --with-default-names
brew install gnu-tar --with-default-names
brew install gzip
brew install diffutils
brew install wget

sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
chsh -s /usr/local/bin/bash
```
---

## 🆕 xcodeprojfix_device_switch_button - исправляет баг отсутствия кнопок iPad/iPhone в секции Deployment Info везде где найдет
Баг лечится удалением строчки `CreatedOnToolsVersion = X.X.X;`, с чем скрипт прекрасно справляется.
Поиск начинается из директории указанной в параметре, или из текущей, если ничего не указанно.

---

## iconsetwith1024ios - создает минимально необходимый набор иконок AppIcon.appiconset в папке с картинкой из параметра
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

## colorize - скрипт для окраски текста при выводе в терминале
Заменяет текст после тэга вида `<color=Red>` на текст соответствующего цвета.<br />
Автоматически сбрасывает цвет _в конце строки_, либо вручную тэгом `</color>` в любом месте текста.<br />
Использовать так:<br />
`echo 'OMG! <color=Green>Green text. </color>Normal text. <color=Blue>Blue text. <color=Red>Red text' | colorize`<br />
Или так:<br />
`colorize 'OMG! <color=Green>Green text. </color>Normal text. <color=Blue>Blue text. <color=Red>Red text'`<br />

---

## filebirthdate - выводит даты создания файлов
```
filebirthdate ./D*
./Desktop:2015-08-13
./Documents:2015-07-09
./Downloads:2015-07-09
```

---

# Aliases
### Xcode
- openws - открывает все workspace файлы рекурсивно начиная с текущей директории
- clearmobileprovision - вычищает все provision профайлы из xcode
- clearderiveddata - не менее полезный алиас для вычищения DerivedData (все время забываю где именно эта папка)
- killxcode - когда ничего не помогает (прибивает :hammer: жестко (-9) все процессы xcode)

### Pods
alias repod='pod update --no-repo-update'
alias repodexample='pod update --no-repo-update --project-directory=Example'
alias podspecversion='grep ".version\s*=" *.podspec | grep -oP "\d+\.\d+\.\d+"'
alias podpush='pod lib lint && git tag v$(podspecversion) && git push --tags && pod trunk push && pod repo update master'
alias clearpodcache='rm -rf /Users/pletnev/Library/Caches/CocoaPods/Pods/External/'

---

# Webtest
### Набор скриптов для мониторинга в терминале состояния веб интефейсов
некогда объяснять. смотри пример:
```
cd webtest_example
webtest_loop 300 feswebtest_getmethod.config feswebtest_postmethod.config color > webtest.log& tail -f webtest.log
```

---

*Это свободное программное обеспечение. Вы можете изменять и распространять его.<br />
НИКАКАЯ ГАРАНТИЯ не предоставляется в пределах, допускаемых законом.*
