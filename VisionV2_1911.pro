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
    TcpServer.cpp \
    scanerRiftek.cpp

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
    TcpServer.h \
    scanerRiftek.h \
    headerArdeonova/x32/Base/GCArray.h \
    headerArdeonova/x32/Base/GCBase.h \
    headerArdeonova/x32/Base/GCError.h \
    headerArdeonova/x32/Base/GCException.h \
    headerArdeonova/x32/Base/GCLinkage.h \
    headerArdeonova/x32/Base/GCNamespace.h \
    headerArdeonova/x32/Base/GCRTSSUtilities.h \
    headerArdeonova/x32/Base/GCString.h \
    headerArdeonova/x32/Base/GCStringVector.h \
    headerArdeonova/x32/Base/GCSynch.h \
    headerArdeonova/x32/Base/GCTypes.h \
    headerArdeonova/x32/Base/GCUtilities.h \
    headerArdeonova/x32/CLProtocol/CLAllAdapter.h \
    headerArdeonova/x32/CLProtocol/ClAllSerial.h \
    headerArdeonova/x32/CLProtocol/CLAutoBuffer.h \
    headerArdeonova/x32/CLProtocol/CLException.h \
    headerArdeonova/x32/CLProtocol/CLPort.h \
    headerArdeonova/x32/CLProtocol/CLProtocol.h \
    headerArdeonova/x32/CLProtocol/CLProtocolLinkage.h \
    headerArdeonova/x32/CLProtocol/ClSerial.h \
    headerArdeonova/x32/CLProtocol/ClSerialTypes.h \
    headerArdeonova/x32/CLProtocol/CVersion.h \
    headerArdeonova/x32/CLProtocol/DeviceID.h \
    headerArdeonova/x32/CLProtocol/ISerial.h \
    headerArdeonova/x32/CLProtocol/ISerialAdapter.h \
    headerArdeonova/x32/CLProtocol/ISerialAdapterCStyle.h \
    headerArdeonova/x32/CLProtocol/XMLID.h \
    headerArdeonova/x32/device/Device.h \
    headerArdeonova/x32/device/DeviceDefs.h \
    headerArdeonova/x32/device/DeviceFactory.h \
    headerArdeonova/x32/device/DeviceInfo.h \
    headerArdeonova/x32/device/Discovery.h \
    headerArdeonova/x32/device/ErrorCodes.h \
    headerArdeonova/x32/device/EthDevice.h \
    headerArdeonova/x32/device/EthDeviceInfo.h \
    headerArdeonova/x32/device/GrabResult.h \
    headerArdeonova/x32/device/GrabTypes.h \
    headerArdeonova/x32/device/InfoTypes.h \
    headerArdeonova/x32/device/Scanner020.h \
    headerArdeonova/x32/device/Scanner020Params.h \
    headerArdeonova/x32/device/StandaloneGrabbersManager.h \
    headerArdeonova/x32/device/StreamGrabber.h \
    headerArdeonova/x32/GenApi/GenApiTutorial/GettingStarted_StaticUseCase.h \
    headerArdeonova/x32/GenApi/GenApiTutorial/GettingStarted_StaticUseCaseParams.h \
    headerArdeonova/x32/GenApi/SnipperTest/PostprocessingTest_TestStatic.h \
    headerArdeonova/x32/GenApi/SnipperTest/PostprocessingTest_TestStaticParams.h \
    headerArdeonova/x32/GenApi/SnipperTest/XMLExtractionTest_TestGenICamSupport_FloatingInt.h \
    headerArdeonova/x32/GenApi/SnipperTest/XMLExtractionTest_TestGenICamSupport_FloatingIntParams.h \
    headerArdeonova/x32/GenApi/Autovector.h \
    headerArdeonova/x32/GenApi/ChunkAdapter.h \
    headerArdeonova/x32/GenApi/ChunkAdapterDcam.h \
    headerArdeonova/x32/GenApi/ChunkAdapterGeneric.h \
    headerArdeonova/x32/GenApi/ChunkAdapterGEV.h \
    headerArdeonova/x32/GenApi/ChunkAdapterU3V.h \
    headerArdeonova/x32/GenApi/ChunkPort.h \
    headerArdeonova/x32/GenApi/Compatibility.h \
    headerArdeonova/x32/GenApi/Container.h \
    headerArdeonova/x32/GenApi/Counter.h \
    headerArdeonova/x32/GenApi/DLLLoad.h \
    headerArdeonova/x32/GenApi/EnumClasses.h \
    headerArdeonova/x32/GenApi/EventAdapter.h \
    headerArdeonova/x32/GenApi/EventAdapter1394.h \
    headerArdeonova/x32/GenApi/EventAdapterCL.h \
    headerArdeonova/x32/GenApi/EventAdapterGeneric.h \
    headerArdeonova/x32/GenApi/EventAdapterGEV.h \
    headerArdeonova/x32/GenApi/EventAdapterU3V.h \
    headerArdeonova/x32/GenApi/EventPort.h \
    headerArdeonova/x32/GenApi/Filestream.h \
    headerArdeonova/x32/GenApi/GenApi.h \
    headerArdeonova/x32/GenApi/GenApiDll.h \
    headerArdeonova/x32/GenApi/GenApiLinkage.h \
    headerArdeonova/x32/GenApi/GenApiNamespace.h \
    headerArdeonova/x32/GenApi/GenApiVersion.h \
    headerArdeonova/x32/GenApi/IBase.h \
    headerArdeonova/x32/GenApi/IBoolean.h \
    headerArdeonova/x32/GenApi/ICategory.h \
    headerArdeonova/x32/GenApi/IChunkPort.h \
    headerArdeonova/x32/GenApi/ICommand.h \
    headerArdeonova/x32/GenApi/IDestroy.h \
    headerArdeonova/x32/GenApi/IDeviceInfo.h \
    headerArdeonova/x32/GenApi/IEnumEntry.h \
    headerArdeonova/x32/GenApi/IEnumeration.h \
    headerArdeonova/x32/GenApi/IEnumerationT.h \
    headerArdeonova/x32/GenApi/IFloat.h \
    headerArdeonova/x32/GenApi/IInteger.h \
    headerArdeonova/x32/GenApi/INode.h \
    headerArdeonova/x32/GenApi/INodeMap.h \
    headerArdeonova/x32/GenApi/INodeMapDyn.h \
    headerArdeonova/x32/GenApi/IPort.h \
    headerArdeonova/x32/GenApi/IPortConstruct.h \
    headerArdeonova/x32/GenApi/IPortRecorder.h \
    headerArdeonova/x32/GenApi/IRegister.h \
    headerArdeonova/x32/GenApi/ISelector.h \
    headerArdeonova/x32/GenApi/ISelectorDigit.h \
    headerArdeonova/x32/GenApi/IString.h \
    headerArdeonova/x32/GenApi/IUserData.h \
    headerArdeonova/x32/GenApi/IValue.h \
    headerArdeonova/x32/GenApi/NodeCallback.h \
    headerArdeonova/x32/GenApi/NodeMapFactory.h \
    headerArdeonova/x32/GenApi/NodeMapRef.h \
    headerArdeonova/x32/GenApi/Persistence.h \
    headerArdeonova/x32/GenApi/Pointer.h \
    headerArdeonova/x32/GenApi/PortImpl.h \
    headerArdeonova/x32/GenApi/PortWriteList.h \
    headerArdeonova/x32/GenApi/Reference.h \
    headerArdeonova/x32/GenApi/RegisterSetHelper.h \
    headerArdeonova/x32/GenApi/SelectorSet.h \
    headerArdeonova/x32/GenApi/StructPort.h \
    headerArdeonova/x32/GenApi/Synch.h \
    headerArdeonova/x32/GenApi/Types.h \
    headerArdeonova/x32/GenCP/gencp_defines.h \
    headerArdeonova/x32/Log/CLog.h \
    headerArdeonova/x32/Log/LogDll.h \
    headerArdeonova/x32/log4cpp/Extensions/RTSSUtilities.h \
    headerArdeonova/x32/log4cpp/Extensions/Utilities.h \
    headerArdeonova/x32/log4cpp/threading/BoostThreads.hh \
    headerArdeonova/x32/log4cpp/threading/DummyThreads.hh \
    headerArdeonova/x32/log4cpp/threading/MSThreads.hh \
    headerArdeonova/x32/log4cpp/threading/OmniThreads.hh \
    headerArdeonova/x32/log4cpp/threading/PThreads.hh \
    headerArdeonova/x32/log4cpp/threading/Threading.hh \
    headerArdeonova/x32/log4cpp/AbortAppender.hh \
    headerArdeonova/x32/log4cpp/Appender.hh \
    headerArdeonova/x32/log4cpp/AppendersFactory.hh \
    headerArdeonova/x32/log4cpp/AppenderSkeleton.hh \
    headerArdeonova/x32/log4cpp/BasicConfigurator.hh \
    headerArdeonova/x32/log4cpp/BasicLayout.hh \
    headerArdeonova/x32/log4cpp/BufferingAppender.hh \
    headerArdeonova/x32/log4cpp/Category.hh \
    headerArdeonova/x32/log4cpp/CategoryStream.hh \
    headerArdeonova/x32/log4cpp/config-openvms.h \
    headerArdeonova/x32/log4cpp/config-win32.h \
    headerArdeonova/x32/log4cpp/config.h \
    headerArdeonova/x32/log4cpp/Configurator.hh \
    headerArdeonova/x32/log4cpp/convenience.h \
    headerArdeonova/x32/log4cpp/Export.hh \
    headerArdeonova/x32/log4cpp/FactoryParams.hh \
    headerArdeonova/x32/log4cpp/FileAppender.hh \
    headerArdeonova/x32/log4cpp/Filter.hh \
    headerArdeonova/x32/log4cpp/FixedContextCategory.hh \
    headerArdeonova/x32/log4cpp/HierarchyMaintainer.hh \
    headerArdeonova/x32/log4cpp/IdsaAppender.hh \
    headerArdeonova/x32/log4cpp/Layout.hh \
    headerArdeonova/x32/log4cpp/LayoutAppender.hh \
    headerArdeonova/x32/log4cpp/LayoutsFactory.hh \
    headerArdeonova/x32/log4cpp/LevelEvaluator.hh \
    headerArdeonova/x32/log4cpp/LoggingEvent.hh \
    headerArdeonova/x32/log4cpp/Manipulator.hh \
    headerArdeonova/x32/log4cpp/NDC.hh \
    headerArdeonova/x32/log4cpp/NTEventLogAppender.hh \
    headerArdeonova/x32/log4cpp/OstreamAppender.hh \
    headerArdeonova/x32/log4cpp/PassThroughLayout.hh \
    headerArdeonova/x32/log4cpp/PatternLayout.hh \
    headerArdeonova/x32/log4cpp/Portability.hh \
    headerArdeonova/x32/log4cpp/Priority.hh \
    headerArdeonova/x32/log4cpp/PropertyConfigurator.hh \
    headerArdeonova/x32/log4cpp/RemoteSyslogAppender.hh \
    headerArdeonova/x32/log4cpp/RollingFileAppender.hh \
    headerArdeonova/x32/log4cpp/SimpleConfigurator.hh \
    headerArdeonova/x32/log4cpp/SimpleLayout.hh \
    headerArdeonova/x32/log4cpp/StringQueueAppender.hh \
    headerArdeonova/x32/log4cpp/SyslogAppender.hh \
    headerArdeonova/x32/log4cpp/TimeStamp.hh \
    headerArdeonova/x32/log4cpp/TriggeringEventEvaluator.hh \
    headerArdeonova/x32/log4cpp/TriggeringEventEvaluatorFactory.hh \
    headerArdeonova/x32/log4cpp/Win32DebugAppender.hh \
    headerArdeonova/x32/log4cpp/Wrapper.hh \
    headerArdeonova/x32/_GenICamVersion.h \
    headerArdeonova/x32/anovacore_global.h \
    headerArdeonova/x32/anovaincludes.h \
    headerArdeonova/x32/GenICam.h \
    headerArdeonova/x32/GenICamFwd.h \
    headerArdeonova/x32/GenICamVersion.h \
    headerArdeonova/x64/Base/GCArray.h \
    headerArdeonova/x64/Base/GCBase.h \
    headerArdeonova/x64/Base/GCError.h \
    headerArdeonova/x64/Base/GCException.h \
    headerArdeonova/x64/Base/GCLinkage.h \
    headerArdeonova/x64/Base/GCNamespace.h \
    headerArdeonova/x64/Base/GCRTSSUtilities.h \
    headerArdeonova/x64/Base/GCString.h \
    headerArdeonova/x64/Base/GCStringVector.h \
    headerArdeonova/x64/Base/GCSynch.h \
    headerArdeonova/x64/Base/GCTypes.h \
    headerArdeonova/x64/Base/GCUtilities.h \
    headerArdeonova/x64/CLProtocol/CLAllAdapter.h \
    headerArdeonova/x64/CLProtocol/ClAllSerial.h \
    headerArdeonova/x64/CLProtocol/CLAutoBuffer.h \
    headerArdeonova/x64/CLProtocol/CLException.h \
    headerArdeonova/x64/CLProtocol/CLPort.h \
    headerArdeonova/x64/CLProtocol/CLProtocol.h \
    headerArdeonova/x64/CLProtocol/CLProtocolLinkage.h \
    headerArdeonova/x64/CLProtocol/ClSerial.h \
    headerArdeonova/x64/CLProtocol/ClSerialTypes.h \
    headerArdeonova/x64/CLProtocol/CVersion.h \
    headerArdeonova/x64/CLProtocol/DeviceID.h \
    headerArdeonova/x64/CLProtocol/ISerial.h \
    headerArdeonova/x64/CLProtocol/ISerialAdapter.h \
    headerArdeonova/x64/CLProtocol/ISerialAdapterCStyle.h \
    headerArdeonova/x64/CLProtocol/XMLID.h \
    headerArdeonova/x64/device/Device.h \
    headerArdeonova/x64/device/DeviceDefs.h \
    headerArdeonova/x64/device/DeviceFactory.h \
    headerArdeonova/x64/device/DeviceInfo.h \
    headerArdeonova/x64/device/Discovery.h \
    headerArdeonova/x64/device/ErrorCodes.h \
    headerArdeonova/x64/device/EthDevice.h \
    headerArdeonova/x64/device/EthDeviceInfo.h \
    headerArdeonova/x64/device/GrabResult.h \
    headerArdeonova/x64/device/GrabTypes.h \
    headerArdeonova/x64/device/InfoTypes.h \
    headerArdeonova/x64/device/Scanner020.h \
    headerArdeonova/x64/device/Scanner020Params.h \
    headerArdeonova/x64/device/StandaloneGrabbersManager.h \
    headerArdeonova/x64/device/StreamGrabber.h \
    headerArdeonova/x64/GenApi/GenApiTutorial/GettingStarted_StaticUseCase.h \
    headerArdeonova/x64/GenApi/GenApiTutorial/GettingStarted_StaticUseCaseParams.h \
    headerArdeonova/x64/GenApi/SnipperTest/PostprocessingTest_TestStatic.h \
    headerArdeonova/x64/GenApi/SnipperTest/PostprocessingTest_TestStaticParams.h \
    headerArdeonova/x64/GenApi/SnipperTest/XMLExtractionTest_TestGenICamSupport_FloatingInt.h \
    headerArdeonova/x64/GenApi/SnipperTest/XMLExtractionTest_TestGenICamSupport_FloatingIntParams.h \
    headerArdeonova/x64/GenApi/Autovector.h \
    headerArdeonova/x64/GenApi/ChunkAdapter.h \
    headerArdeonova/x64/GenApi/ChunkAdapterDcam.h \
    headerArdeonova/x64/GenApi/ChunkAdapterGeneric.h \
    headerArdeonova/x64/GenApi/ChunkAdapterGEV.h \
    headerArdeonova/x64/GenApi/ChunkAdapterU3V.h \
    headerArdeonova/x64/GenApi/ChunkPort.h \
    headerArdeonova/x64/GenApi/Compatibility.h \
    headerArdeonova/x64/GenApi/Container.h \
    headerArdeonova/x64/GenApi/Counter.h \
    headerArdeonova/x64/GenApi/DLLLoad.h \
    headerArdeonova/x64/GenApi/EnumClasses.h \
    headerArdeonova/x64/GenApi/EventAdapter.h \
    headerArdeonova/x64/GenApi/EventAdapter1394.h \
    headerArdeonova/x64/GenApi/EventAdapterCL.h \
    headerArdeonova/x64/GenApi/EventAdapterGeneric.h \
    headerArdeonova/x64/GenApi/EventAdapterGEV.h \
    headerArdeonova/x64/GenApi/EventAdapterU3V.h \
    headerArdeonova/x64/GenApi/EventPort.h \
    headerArdeonova/x64/GenApi/Filestream.h \
    headerArdeonova/x64/GenApi/GenApi.h \
    headerArdeonova/x64/GenApi/GenApiDll.h \
    headerArdeonova/x64/GenApi/GenApiLinkage.h \
    headerArdeonova/x64/GenApi/GenApiNamespace.h \
    headerArdeonova/x64/GenApi/GenApiVersion.h \
    headerArdeonova/x64/GenApi/IBase.h \
    headerArdeonova/x64/GenApi/IBoolean.h \
    headerArdeonova/x64/GenApi/ICategory.h \
    headerArdeonova/x64/GenApi/IChunkPort.h \
    headerArdeonova/x64/GenApi/ICommand.h \
    headerArdeonova/x64/GenApi/IDestroy.h \
    headerArdeonova/x64/GenApi/IDeviceInfo.h \
    headerArdeonova/x64/GenApi/IEnumEntry.h \
    headerArdeonova/x64/GenApi/IEnumeration.h \
    headerArdeonova/x64/GenApi/IEnumerationT.h \
    headerArdeonova/x64/GenApi/IFloat.h \
    headerArdeonova/x64/GenApi/IInteger.h \
    headerArdeonova/x64/GenApi/INode.h \
    headerArdeonova/x64/GenApi/INodeMap.h \
    headerArdeonova/x64/GenApi/INodeMapDyn.h \
    headerArdeonova/x64/GenApi/IPort.h \
    headerArdeonova/x64/GenApi/IPortConstruct.h \
    headerArdeonova/x64/GenApi/IPortRecorder.h \
    headerArdeonova/x64/GenApi/IRegister.h \
    headerArdeonova/x64/GenApi/ISelector.h \
    headerArdeonova/x64/GenApi/ISelectorDigit.h \
    headerArdeonova/x64/GenApi/IString.h \
    headerArdeonova/x64/GenApi/IUserData.h \
    headerArdeonova/x64/GenApi/IValue.h \
    headerArdeonova/x64/GenApi/NodeCallback.h \
    headerArdeonova/x64/GenApi/NodeMapFactory.h \
    headerArdeonova/x64/GenApi/NodeMapRef.h \
    headerArdeonova/x64/GenApi/Persistence.h \
    headerArdeonova/x64/GenApi/Pointer.h \
    headerArdeonova/x64/GenApi/PortImpl.h \
    headerArdeonova/x64/GenApi/PortWriteList.h \
    headerArdeonova/x64/GenApi/Reference.h \
    headerArdeonova/x64/GenApi/RegisterSetHelper.h \
    headerArdeonova/x64/GenApi/SelectorSet.h \
    headerArdeonova/x64/GenApi/StructPort.h \
    headerArdeonova/x64/GenApi/Synch.h \
    headerArdeonova/x64/GenApi/Types.h \
    headerArdeonova/x64/GenCP/gencp_defines.h \
    headerArdeonova/x64/Log/CLog.h \
    headerArdeonova/x64/Log/LogDll.h \
    headerArdeonova/x64/log4cpp/Extensions/RTSSUtilities.h \
    headerArdeonova/x64/log4cpp/Extensions/Utilities.h \
    headerArdeonova/x64/log4cpp/threading/BoostThreads.hh \
    headerArdeonova/x64/log4cpp/threading/DummyThreads.hh \
    headerArdeonova/x64/log4cpp/threading/MSThreads.hh \
    headerArdeonova/x64/log4cpp/threading/OmniThreads.hh \
    headerArdeonova/x64/log4cpp/threading/PThreads.hh \
    headerArdeonova/x64/log4cpp/threading/Threading.hh \
    headerArdeonova/x64/log4cpp/AbortAppender.hh \
    headerArdeonova/x64/log4cpp/Appender.hh \
    headerArdeonova/x64/log4cpp/AppendersFactory.hh \
    headerArdeonova/x64/log4cpp/AppenderSkeleton.hh \
    headerArdeonova/x64/log4cpp/BasicConfigurator.hh \
    headerArdeonova/x64/log4cpp/BasicLayout.hh \
    headerArdeonova/x64/log4cpp/BufferingAppender.hh \
    headerArdeonova/x64/log4cpp/Category.hh \
    headerArdeonova/x64/log4cpp/CategoryStream.hh \
    headerArdeonova/x64/log4cpp/config-openvms.h \
    headerArdeonova/x64/log4cpp/config-win32.h \
    headerArdeonova/x64/log4cpp/config.h \
    headerArdeonova/x64/log4cpp/Configurator.hh \
    headerArdeonova/x64/log4cpp/convenience.h \
    headerArdeonova/x64/log4cpp/Export.hh \
    headerArdeonova/x64/log4cpp/FactoryParams.hh \
    headerArdeonova/x64/log4cpp/FileAppender.hh \
    headerArdeonova/x64/log4cpp/Filter.hh \
    headerArdeonova/x64/log4cpp/FixedContextCategory.hh \
    headerArdeonova/x64/log4cpp/HierarchyMaintainer.hh \
    headerArdeonova/x64/log4cpp/IdsaAppender.hh \
    headerArdeonova/x64/log4cpp/Layout.hh \
    headerArdeonova/x64/log4cpp/LayoutAppender.hh \
    headerArdeonova/x64/log4cpp/LayoutsFactory.hh \
    headerArdeonova/x64/log4cpp/LevelEvaluator.hh \
    headerArdeonova/x64/log4cpp/LoggingEvent.hh \
    headerArdeonova/x64/log4cpp/Manipulator.hh \
    headerArdeonova/x64/log4cpp/NDC.hh \
    headerArdeonova/x64/log4cpp/NTEventLogAppender.hh \
    headerArdeonova/x64/log4cpp/OstreamAppender.hh \
    headerArdeonova/x64/log4cpp/PassThroughLayout.hh \
    headerArdeonova/x64/log4cpp/PatternLayout.hh \
    headerArdeonova/x64/log4cpp/Portability.hh \
    headerArdeonova/x64/log4cpp/Priority.hh \
    headerArdeonova/x64/log4cpp/PropertyConfigurator.hh \
    headerArdeonova/x64/log4cpp/RemoteSyslogAppender.hh \
    headerArdeonova/x64/log4cpp/RollingFileAppender.hh \
    headerArdeonova/x64/log4cpp/SimpleConfigurator.hh \
    headerArdeonova/x64/log4cpp/SimpleLayout.hh \
    headerArdeonova/x64/log4cpp/StringQueueAppender.hh \
    headerArdeonova/x64/log4cpp/SyslogAppender.hh \
    headerArdeonova/x64/log4cpp/TimeStamp.hh \
    headerArdeonova/x64/log4cpp/TriggeringEventEvaluator.hh \
    headerArdeonova/x64/log4cpp/TriggeringEventEvaluatorFactory.hh \
    headerArdeonova/x64/log4cpp/Win32DebugAppender.hh \
    headerArdeonova/x64/log4cpp/Wrapper.hh \
    headerArdeonova/x64/_GenICamVersion.h \
    headerArdeonova/x64/anovacore_global.h \
    headerArdeonova/x64/anovaincludes.h \
    headerArdeonova/x64/GenICam.h \
    headerArdeonova/x64/GenICamFwd.h \
    headerArdeonova/x64/GenICamVersion.h

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/libsArdeonova/x32/ -lANovaCore
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/libsArdeonova/x32/ -lANovaCored

INCLUDEPATH += $$PWD/headerArdeonova/x32/device
DEPENDPATH += $$PWD/headerArdeonova/x32/device

DISTFILES += \
    headerArdeonova/x32/CLProtocol/ClProtocol.def \
    headerArdeonova/x32/CLProtocol/ClSerial.def \
    headerArdeonova/x64/CLProtocol/ClProtocol.def \
    headerArdeonova/x64/CLProtocol/ClSerial.def
