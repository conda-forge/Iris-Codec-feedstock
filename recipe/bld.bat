:: Build step

mkdir build
cd  build

cmake .. -G Ninja ^
    -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -D CMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
    -D CMAKE_INSTALL_PYTHON_LIBDIR=%SP_DIR% ^
    -D CMAKE_BUILD_TYPE=Release ^
    -D IRIS_BUILD_SHARED=ON ^
    -D IRIS_BUILD_STATIC=OFF ^
    -D IRIS_BUILD_ENCODER=ON ^
    -D IRIS_BUILD_DEPENDENCIES=OFF ^
    -D IRIS_BUILD_PYTHON=ON ^
    -D IRIS_USE_OPENSLIDE=OFF ^
    %SRC_DIR%
if errorlevel 1 exit 1

cmake --build . --config Release
if errorlevel 1 exit 1

:: Install step
cmake --install .
if errorlevel 1 exit 1