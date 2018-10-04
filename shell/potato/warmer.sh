#!/bin/sh
WARMER_SCRIPT=warmer.php
QUEUE_SCRIPT=queue.php
BASEDIR=`echo $0 | sed 's/warmer\.sh//g'`
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
PHP_BIN=`which php`

if ! ps auxwww | grep "$WARMER_SCRIPT" | grep -v grep 1>/dev/null 2>/dev/null
then $PHP_BIN $SCRIPTPATH/$WARMER_SCRIPT &
fi ;
if ! ps auxwww | grep "$QUEUE_SCRIPT" | grep -v grep 1>/dev/null 2>/dev/null
then $PHP_BIN $SCRIPTPATH/$QUEUE_SCRIPT &
fi ;