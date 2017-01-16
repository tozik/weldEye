QT += qml
QT += quick
QT += quickcontrols2
QT += widgets
QT += core
QT += charts
QT += network
CONFIG += c++11

SOURCES += main.cpp \
    scaner.cpp

RESOURCES += qml.qrc

contains(TARGET, qml.*) {
    QT += qml quick
}

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/libs/ -lrfdevice_mingw
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/libs/ -lrfdevice_mingwd
else:unix: LIBS += -L$$PWD/libs/ -lrfdevice_mingw

INCLUDEPATH += $$PWD/libs
DEPENDPATH += $$PWD/libs

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/libs/ -lrfdevice_mingw
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/libs/ -lrfdevice_mingwd
else:unix: LIBS += -L$$PWD/libs/ -lrfdevice_mingw

INCLUDEPATH += $$PWD/libs
DEPENDPATH += $$PWD/libs

HEADERS += \
    scaner.h \
    include/linuxTypeDefs.h \
    include/RF625DDevice.h \
    include/RF625Device.h \
    include/RF625Device_Legacy.h \
    include/RFDevice.h \
    include/RFEthernetDetector.h \
    include/RFEthernetDevice.h \
    include/RFQDPMotorDevice.h \
    include/RFSerialDevice.h \
    include/RFString.h \
    include/RFTypeDefs.h \
    include/serial.h
