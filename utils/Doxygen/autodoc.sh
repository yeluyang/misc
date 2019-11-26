#! /bin/bash

version='v0.0.1'

function remove_dir(){
    echo '-------- remove doxydoc/: start --------'
    if [ -d $1 ]
    then
        rm -rf $1
        echo 'del old docs'
    fi
    echo '-------- remove doxydoc/: done ---------'
}

check_doxygen(){
    echo '-------- checking doxygen: start --------'
    echo "checking configuration : Doxyfile"
    if type doxygen
    then
        echo "Doxygen looks good"
    else
        echo "Doxygen missing, please install doxygen"
        echo "Maybe you can type sudo apt-get install doxygen"
        echo '------- checking doxygen: failed --------'
        exit -1
    fi
    echo '-------- checking doxygen: done ---------'
}

link_doc(){
    echo '-------- linking doc.html: start --------'
    echo "linking doxydoc/html/index.html to ./doc.html"
    ln -sf doxydoc/html/index.html ./doc.html
    echo "now you can open doc.html with web browser"
    echo '-------- linking doc.html: done ---------'
}

git_ignore(){
    echo '-------- setting .gitignore: start --------'
    if [ `cat .gitignore | grep tmp/Doxygen/` ]
    then
        echo "already ignore tmp/Doxygen/"
    else
        echo 'tmp/Doxygen/' >> .gitignore
    fi
    if [ `cat .gitignore | grep doc.html` ]
    then
        echo "already ignore doc.html"
    else
        echo 'doc.html' >> .gitignore
    fi
    echo 'git ignore looks good, dont worry'
    echo '-------- setting .gitignore: done ---------'
}

echo "-------- "auto_gen_doc_${version}" --------"
remove_dir './tmp/Doxygen'
check_doxygen
doxygen Doxyfile
link_doc
git_ignore
echo "-------- "auto_gen_doc_${version}" --------"
