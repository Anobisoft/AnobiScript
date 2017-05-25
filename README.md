# AnobiScript
iOS Developer Helpers

**ВНИМАНИЕ!** Скрипты написаны под GNU bash, версия 4.4.5(1)-release и часто испобльзуют GNU версии утилит. Настоятельно рекомендую использовать только самое лучшее!

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
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
```
---

## iconsetwith1024 - создает минимально необходимый набор иконок AppIcon.appiconset в папке с картинкой из параметра
**Важно!** требует наличия папки `iconsetwith1024json` с уже настроенным `Contents.json`

```
21:38:14 pletnev@WS0441 ~ # iconsetwith1024 ~/Documents/Resources/MyProject/icon-iOS_1024-itunes.png 
OK 3911 iconsetwith1024.log
21:39:12 pletnev@WS0441 ~ # ls ~/Documents/Resources/MyProject/AppIcon.appiconset/Contents.json     Icon-180x180.png  Icon-58x58.png  Icon-87x87.png
Icon-120x120.png  Icon-20x20.png    Icon-60x60.png
Icon-152x152.png  Icon-29x29.png    Icon-76x76.png
Icon-167x167.png  Icon-40x40.png    Icon-80x80.png
```

---

## colorize - скрипт для окраски текста
Заменяет текст после тэга вида `<color=Red>` на текст соответствующего цвета.<br />
Автоматически сбрасывает цвет _в конце строки_, либо вручную тэгом `</color>` в любом месте текста.<br />
Использовать так:<br />
`echo 'OMG! <color=Green>Green text. </color>Normal text. <color=Blue>Blue text. <color=Red>Red text' | colorize`<br />
Или так:<br />
`colorize 'OMG! <color=Green>Green text. </color>Normal text. <color=Blue>Blue text. <color=Red>Red text'`<br />

---

## cleanup_provision_profiles - вычищает все provision профайлы из xcode
Просто запускаем и радуемся.

---

## killxcode - когда ничего не помогает
прибивает :hammer: жестко (-9) все процессы xcode

---

## filebirthdate - выводит даты создания файлов
```
filebirthdate ./D*
./Desktop:2015-08-13
./Documents:2015-07-09
./Downloads:2015-07-09
```

---

*Это свободное программное обеспечение. Вы можете изменять и распространять его.<br />
НИКАКАЯ ГАРАНТИЯ не предоставляется в пределах, допускаемых законом.*
