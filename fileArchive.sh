#!/usr/bin/bash
tar -cf archive.tar
for myfile in files/*
do
        tar -uf archive.tar $myfile && rm $myfile || echo "error tar -uf archive.tar $myfile"
done
