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
    qmlRegisterType<scaner>("ScanerModule",1,0,"ScanerType");

//    scaner Scaner(&viewer);
//    viewer.rootContext()->setContextProperty("Scaner",&Scaner);

//    QQmlApplicationEngine engine;
//    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

    viewer.showMaximized();
    return app.exec();
}
