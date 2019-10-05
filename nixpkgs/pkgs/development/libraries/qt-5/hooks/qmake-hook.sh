qmakeConfigurePhase() {
    runHook preConfigure

    qmake PREFIX=$out \
          NIX_OUTPUT_OUT=$out \
          NIX_OUTPUT_DEV=${!outputDev} \
          NIX_OUTPUT_BIN=${!outputBin} \
          NIX_OUTPUT_DOC=${!outputDev}/${qtDocPrefix:?} \
          NIX_OUTPUT_QML=${!outputBin}/${qtQmlPrefix:?} \
          NIX_OUTPUT_PLUGIN=${!outputBin}/${qtPluginPrefix:?} \
          $qmakeFlags

    if ! [[ -v enableParallelBuilding ]]; then
        enableParallelBuilding=1
        echo "qmake: enabled parallel building"
    fi

    runHook postConfigure
}

if [ -z "$dontUseQmakeConfigure" -a -z "$configurePhase" ]; then
    configurePhase=qmakeConfigurePhase
fi
