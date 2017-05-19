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

## killxcode - когда ничего не помогает
прибивает :hammer: жестко (-9) все процессы xcode

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

*Это свободное программное обеспечение. Вы можете изменять и распространять его.<br />
НИКАКАЯ ГАРАНТИЯ не предоставляется в пределах, допускаемых законом.*
