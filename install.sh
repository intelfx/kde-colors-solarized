#!/bin/sh

kde_path="$(kde4-config --localprefix)"

# KDE Color Palette
install -Dm644 Solarized_Colors "${kde_path}/share/config/colors"

# Kate Color Schema and syntax highligting
for file in *Dark*; do
	./solarized_convert.sh "$file" > "${file/Dark/Light}"
done

install -d "${kde_path}/share/config"
cat *.kateschema >> "${kde_path}/share/config/kateschemarc"
cat *.katesyntax >> "${kde_path}/share/config/katesyntaxhighlightingrc"

rm *Light*
