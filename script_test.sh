#!/bin/bash

make

rm -f resultat.txt

test(){
       echo "./as < $1)" >> resultat.txt
    ./as < $1 >> resultat.txt

    if [ $? = 0 ]; then
        out="$1 est conforme à la syntaxe."
    else
        out="$1 n'est pas conforme à la syntaxe."
    fi

    echo $out >> resultat.txt
    echo -e "\n" >>resultat.txt

}

for i in test/fonctionnels/*; do test $i; done
for j in test/infonctionnels/*; do test $j; done                     #!/bin/bash

make

rm -f resultat.txt

test(){
       echo "./as < $1)" >> resultat.txt
    ./as < $1 >> resultat.txt

    if [ $? = 0 ]; then
        out="$1 est conforme à la syntaxe."
    else
        out="$1 n'est pas conforme à la syntaxe."
    fi

    echo $out >> resultat.txt
    echo -e "\n" >>resultat.txt

}

for i in test/fonctionnels/*; do test $i; done
for j in test/infonctionnels/*; do test $j; done