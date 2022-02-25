#!/bin/bash

for configfile in /mnt/emirkoroglu/for-loop-task/config/
do
gzip /mnt/emirkoroglu/for-loop-task/config/*
mv /mnt/emirkoroglu/for-loop-task/config/*  /mnt/emirkoroglu/for-loop-task/backup
done