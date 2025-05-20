cmake_minimum_required(VERSION 3.16)

project(qt-media-player VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(appqt-media-player
    main.cpp
)

qt_add_qml_module(appqt-media-player
    URI qt-media-player
    VERSION 1.0
    QML_FILES
        Main.qml
        RESOURCES resource.qrc
        RESOURCES README.md
        RESOURCES .gitignore
)

qt_add_resources(appqt-media-player "Resource"
    PREFIX "/"
    FILES
        Image/background.png
        Image/BuiAnhTuan.png
        Image/center_point.png
        Image/HaAnhTuan.png
        Image/hold.png
        Image/hold-next.png
        Image/hold-pause.png
        Image/hold-play.png
        Image/hold-prev.png
        Image/Hongkong1.png
        Image/music.png
        Image/next.png
        Image/pause.png
        Image/PhoKhongMua_BAT.png
        Image/play.png
        Image/playing.png
        Image/playlist.png
        Image/playlist_item.png
        Image/point.png
        Image/prev.png
        Image/progress_bar.png
        Image/progress_bar_bg.png
        Image/repeat.png
        Image/repeat1_hold.png
        Image/shuffle.png
        Image/shuffle-1.png
        Image/title.png
        Image/USBMusic.png
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appqt-media-player PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appqt-media-player
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appqt-media-player
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appqt-media-player
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
