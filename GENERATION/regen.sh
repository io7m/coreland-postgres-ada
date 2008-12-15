#!/bin/sh

./make-errors-spec.lua > ../pgada-errors.ads.tmp &&
  mv ../pgada-errors.ads.tmp ../pgada-errors.ads || exit 112
./make-errors-body.lua > ../pgada-errors.adb.tmp &&
  mv ../pgada-errors.adb.tmp ../pgada-errors.adb || exit 112
