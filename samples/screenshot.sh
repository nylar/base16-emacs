#!/bin/bash

emacs -Q --load screenshot.el

echo '* Base16 Theme Previews' > README.org

for file in *.png; do
    echo -e "\n** $file\n" >> README.org
    echo "[[./$file]]" >> README.org
done
