#ifndef SCANER_H
#define SCANER_H

#include <QVariant>
#include <iostream>
#include <vector>
#include "include/RF625Device.h"
#include "include/RFEthernetDetector.h"
#include <QtCore/QObject>
#include <QtCharts/QAbstractSeries>


#define GETRESULT_ERROR_VALUE ((USHORT)0xffff)
#define MIN(a,b) (a<b ? a : b)
#define MEASURES_TO_DO 3000 // quantity measures
#define VALUES_TO_PRINT 10//prints quantity

QT_BEGIN_NAMESPACE
class QQuickView;
QT_END_NAMESPACE

using namespace QtCharts;

class scaner : public QObject
{
    Q_OBJECT

public:

    explicit scaner(QQuickView *appViewer, QObject *parent = 0);

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
    std::vector <RFDevice::RF625Device *> vRF625;                         //
    RFDevice::RFEthernetDetector ld;                                 //	Создание объекта для поиска
    USHORT nPoints;                                                  //  количество тоечк

    QQuickView *m_appViewer;
    float pointrand[22]={1,1,2,2,3,3,4,2,5,1,6,2,7,3,8,2,9,1,10,2,4,6};
    long int counter=0;
signals:

};

#endif // SCANER_H
