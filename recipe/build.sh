#!/bin/bash
set -ex

mkdir build
cd build

cmake -GNinja \
    $CMAKE_ARGS \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_PREFIX_PATH=$PREFIX \
    -DCMAKE_INSTALL_PREFIX="$SP_DIR/torchtext" \
    -DPython_INCLUDE_DIR=$PREFIX/include \
    -DTORCH_INSTALL_PREFIX:STRING="$SP_DIR/torch" \
    -DBUILD_TORCHTEXT_PYTHON_EXTENSION:BOOL=ON \
    -DTORCH_COMPILED_WITH_CXX_ABI=True \
    ..

cmake --build .
cmake --install .

$PYTHON -m pip install . --no-deps -vv
