#!/bin/sh

COMPILER=/usr/bin/fpc
${COMPILER} deftypes
${COMPILER} squeue
${COMPILER} bintree
${COMPILER} layertravel.pas
