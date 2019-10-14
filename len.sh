#!/usr/bin/env bash
###
##
#
var="hello,tom! this is my house"
varlen=${#var}
echo ${varlen}
echo "${var: 11 :4}"

