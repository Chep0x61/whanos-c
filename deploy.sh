#!/bin/bash

arr=()

if [[ -f Makefile ]]; then
        arr+=("c")
fi
if [[ -f ./app/pom.xml ]]; then
        arr+=("java")
fi
if [[ -f tsconfig.json && -f package.json ]]; then
        arr+=("typescript")
elif [[ -f package.json ]]; then
        arr+=("javascript")
fi
if [[ -f requirements.txt ]]; then
        arr+=("python")
fi
if [[ -f ./app/main.bf ]]; then
        arr+=("befunge")
fi
if [[ ${#arr[@]} < 1 ]]; then
        echo "Error: no language matched."
        exit 1
fi
if [[ ${#arr[@]} > 1 ]]; then
        echo "Error: several languages matched."
        exit 1
fi

echo ${arr[@]} matched