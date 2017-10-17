#ifndef SCANERRIFTEK_H
#define SCANERRIFTEK_H

#include <QVariant>
#include <iostream>
#include <vector>
#include "headerRiftek/RF625Device.h"
#include "headerRiftek/RFEthernetDetector.h"
#include <QtCore/QObject>
#include <QtCharts/QAbstractSeries>
#include <QTcpServer>
#include <QTcpSocket>

#define GETRESULT_ERROR_VALUE ((USHORT)0xffff)
#define MIN(a,b) (a<b ? a : b)
#define MEASURES_TO_DO 3000 // quantity measures
#define VALUES_TO_PRINT 10//prints quantity

QT_BEGIN_NAMESPACE
class QQuickView;
QT_END_NAMESPACE

using namespace QtCharts;

class scanerRIFTEK : public QObject
{
    Q_OBJECT

public:

    explicit scanerRIFTEK(QQuickView *appViewer, QObject *parent = 0);

Q_SIGNALS:
public slots:

    void firstTemplate(QAbstractSeries *series);
    void secondTemplate(QAbstractSeries *series);
    void update(QAbstractSeries *series);
    void search();
    void connectionTO();
    void measurement();
    void disconnection();
    void releaseMemory();
    void cleanUpRfdevice();



private:

    int nRF625;                                                      // Количество найденных девайсов
    int i, j, k;
    float PointsBuffer[RFDevice::RF625Device::ProfileValuesCount];  //	Буфер для максимального количества (Х,Z *1280)
    std::vector <RFDevice::RF625Device *> vRF625;
    RFDevice::RFEthernetDetector ld;                                 //	Создание объекта для поиска
    USHORT nPoints;                                                  //  количество тоечк

    QQuickView *m_appViewer;
    long unsigned int counter=0;


    QTcpServer *TcpServer;
    QTcpSocket *TcpSocket;
signals:

};

#endif // SCANER_H
