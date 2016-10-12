#!/bin/bash

#emacs -Q --load screenshot.el

echo '* Base16 Theme Previews' > ../index.org

for file in *.png; do
    echo -e "\n** ${file%.png}\n" >> ../index.org
    echo "[[./samples/$file]]" >> ../index.org
done
