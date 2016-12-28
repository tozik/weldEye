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

    explicit scaner();

Q_SIGNALS:
public slots:

    void search();
    void connectionTO();
    void measurement();
    void disconnection();
    void releaseMemory();
    void cleanUpRfdevice();
    float* Points();
    void getRes(float*,USHORT);


private:
    float points;
signals:

};

#endif // SCANER_H
