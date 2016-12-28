#ifndef SCANER_H
#define SCANER_H

#include <QVariant>
#include <iostream>
#include <vector>
#include "RF625Device.h"
#include "RFEthernetDetector.h"
#include <QtCore/QObject>
#include <QtCharts/QAbstractSeries>


using namespace std;
#define GETRESULT_ERROR_VALUE ((USHORT)0xffff)
#define MIN(a,b) (a<b ? a : b)
#define MEASURES_TO_DO 3000 // quantity measures
#define VALUES_TO_PRINT 10//prints quantity

class scaner //: public QObject
{


public:

    explicit scaner();
    void search();
    void connectionTO();
    void measurement();
    void disconnection();
    void releaseMemory();
    void cleanUpRfdevice();
    float* Points();
    void getRes(float*,USHORT);
};

#endif // SCANER_H
