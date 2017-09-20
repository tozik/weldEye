QT += qml
QT += quick
QT += quickcontrols2
QT += widgets
QT += core
QT += charts
QT += network
CONFIG += c++11

TARGET = TcpServer

SOURCES += main.cpp \
    scaner.cpp \
    TcpServer.cpp

RESOURCES += qml.qrc

contains(TARGET, qml.*) {
    QT += qml quick
}
RC_ICONS=indexICO.ico
# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/libsRiftek/ -lrfdevice_mingw
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/libsRiftek/ -lrfdevice_mingwd
else:unix: LIBS += -L$$PWD/libsRiftek/ -lrfdevice_mingw

INCLUDEPATH += $$PWD/libsRiftek
DEPENDPATH += $$PWD/libsRiftek

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/libsRiftek/ -lrfdevice_mingw
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/libsRiftek/ -lrfdevice_mingwd
else:unix: LIBS += -L$$PWD/libsRiftek/ -lrfdevice_mingw

INCLUDEPATH += $$PWD/libsRiftek
DEPENDPATH += $$PWD/libsRiftek

HEADERS += \
    scaner.h \
    headerRiftek/linuxTypeDefs.h \
    headerRiftek/RF625DDevice.h \
    headerRiftek/RF625Device.h \
    headerRiftek/RF625Device_Legacy.h \
    headerRiftek/RFDevice.h \
    headerRiftek/RFEthernetDetector.h \
    headerRiftek/RFEthernetDevice.h \
    headerRiftek/RFQDPMotorDevice.h \
    headerRiftek/RFSerialDevice.h \
    headerRiftek/RFString.h \
    headerRiftek/RFTypeDefs.h \
    headerRiftek/serial.h \
    TcpServer.h

#DISTFILES += \
#    ButtonsConnectionScaner.qml\
#    Chart.qml\
#    Controls.qml\
#    ControlsConnetcionRobot.qml\
#    ControlsSettingsScaner.qml\
#    Log.qml\
#    MultiButton.qml\
#    Template.qml\
#    TemplateSet.qml\
