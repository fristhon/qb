cmake_minimum_required(VERSION 3.16)

project(deepExpose VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appdeepExpose
    main.cpp
)

qt_add_qml_module(appdeepExpose
    URI deepExpose
    VERSION 1.0
    QML_FILES Main.qml
    FirstPage.qml
    SecondPage.qml
)

set_target_properties(appdeepExpose PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
    QT_ANDROID_PACKAGE_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/android
)

target_link_libraries(appdeepExpose
    PRIVATE Qt6::Quick
)

install(TARGETS appdeepExpose
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

add_compile_options(-fsanitize=address)
add_link_options(-fsanitize=address)
