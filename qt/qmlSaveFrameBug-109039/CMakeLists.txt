cmake_minimum_required(VERSION 3.16)

project(qmlSaveFrame VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 COMPONENTS Quick Core Multimedia REQUIRED)

add_subdirectory(ExtraModule)

qt_add_executable(appqmlSaveFrame
    main.cpp
)

qt_add_qml_module(appqmlSaveFrame
    URI qmlSaveFrame
    VERSION 1.0
    QML_FILES main.qml
)

set_target_properties(appqmlSaveFrame PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appqmlSaveFrame
    PRIVATE Qt6::Quick
    PRIVATE Qt6::Core
    PRIVATE Qt6::Multimedia
)


target_link_libraries(appqmlSaveFrame PRIVATE extra_moduleplugin)


install(TARGETS appqmlSaveFrame
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
