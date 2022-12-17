qt_add_library(extra_module STATIC)
qt_add_qml_module(extra_module
    URI "ExtraModule"
    VERSION 1.0
    SOURCES
    helper.h helper.cpp
)


target_link_libraries(extra_module PUBLIC
    Qt::Quick
    Qt::Core
    Qt::Multimedia
)



