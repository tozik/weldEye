#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QApplication>
#include <QQuickView>
#include <QQuickStyle>
#include "scaner.h"
#include <QtWidgets/QApplication>
#include <QtQml/QQmlContext>
#include <QtQuick/QQuickView>
#include <QtQml/QQmlEngine>
#include <QtCore/QDir>
#include <QQmlEngine>
#include <QThread>
#include "TcpServer.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QApplication app(argc,argv);
    QQuickStyle::setStyle("Material");
    QQuickView viewer;

    viewer.setSource(QUrl("qrc:/main.qml"));
    viewer.setResizeMode(QQuickView::SizeRootObjectToView);
    QString extraImportPath(QStringLiteral("%1/../../../../%2"));

    viewer.engine()->addImportPath(extraImportPath.arg(QGuiApplication::applicationDirPath(),
                                      QString::fromLatin1("qml")));

//    QThread* thread = new QThread;
    scaner* deviceScaner=new scaner(&viewer);
    //передаем права владения классом, классу QTHread
//    deviceScaner->moveToThread(thread);
//    // Связываем сигнал об ошибки со слотом обработки ошибок(не показан).
//    connect(deviceScaner, SIGNAL(error(QString)), this, SLOT(errorHandler(QString)));

//    // Соединяем сигнал started потока, со слотом process "рабочего" класса, т.е. начинается выполнение нужной работы.
//    connect(thread, SIGNAL(started()), deviceScaner, SLOT(process()));

//    // По завершению выходим из потока, и удаляем рабочий класс
//    connect(deviceScaner, SIGNAL(finished()), thread, SLOT(quit()));
//    connect(deviceScaner, SIGNAL(finished()), deviceScaner, SLOT(deleteLater()));

//    // Удаляем поток, после выполнения операции
//    connect(thread, SIGNAL(finished()), thread, SLOT(deleteLater()));

//    thread->start();
    viewer.rootContext()->setContextProperty("deviceScaner",deviceScaner);
    TcpServer objServer;
    viewer.rootContext()->setContextProperty("objServer",&objServer);

//    QQmlApplicationEngine engine;
//    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

    viewer.showMaximized();
    return app.exec();
}
