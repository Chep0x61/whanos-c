#!/bin/bash

arr=()

if [[ -f Makefile ]]; then
        arr+=("c")
fi
if [[ -f ./app/pom.xml ]]; then
        arr+=("java")
fi
if [[ -f package.json ]] && [[ -f tsconfig.json ]]; then
        language+=("typescript")
elif [[ -f package.json ]]; then
        language+=("javascript")
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