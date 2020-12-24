#!/bin/bash

cat /home/analyst/create_mr_mega_input.R | R --vanilla --args "$@"
