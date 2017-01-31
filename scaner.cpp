#include "scaner.h"
#include <QtCharts/QXYSeries>
#include <QtCharts/QScatterSeries>
#include <QtCharts/QAreaSeries>
#include <QtQuick/QQuickView>
#include <QtQuick/QQuickItem>
#include <QtCore/QDebug>
#include <QtCore/QtMath>


#define con qDebug()

QT_CHARTS_USE_NAMESPACE

//Q_DECLARE_METATYPE(QAbstractSeries *)
//Q_DECLARE_METATYPE(QAbstractAxis *)


scaner::scaner(QQuickView *appViewer, QObject *parent) :    QObject(parent),
    m_appViewer(appViewer)

{
//    qRegisterMetaType<QAbstractSeries*>();
//    qRegisterMetaType<QAbstractAxis*>();

    }

void scaner::update(QAbstractSeries *series)
{
    qDebug("scaner::update");
    if (series) {
        QScatterSeries *xySeries = static_cast<QScatterSeries *>(series);     // приведение типов
                                                                             //classB* B = static_cast<classB*>A;
                                                                              //Эта конструкция приведет указатель на classA к Указателю на classB
                                                                              //при том условии что класс classB является наследдником класса classA
        xySeries->clear();
        for (i=0; i<nRF625; i++)
        {
            if (GETRESULT_ERROR_VALUE == vRF625[i]->GetNormalizedResult(PointsBuffer, &nPoints))
            {
                std::cout << "Failed to read measure from RF625Device #" << i << std::endl;
            }
            else
            {

                for (j=0; j<nPoints; j++)
                {
                   xySeries->append(PointsBuffer[j*2],PointsBuffer[j*2+1]);

                }

                qDebug("end cycle scaner::update");
                counter++;

            }
        }

      }

    }
void scaner::firstTemplate(QAbstractSeries *series)
{

    qDebug("scaner::firsttemplate");
    QScatterSeries *point = static_cast<QScatterSeries *>(series);     // приведение типов
    point->clear();
    for (i=0; i<nRF625; i++)
    {
        if (GETRESULT_ERROR_VALUE == vRF625[i]->GetNormalizedResult(PointsBuffer, &nPoints))
        {
            std::cout << "Failed to read measure from RF625Device #" << i << std::endl;
        }
        else
        {
            float findX=150;
            float findY=150;
            for (j=0; j<nPoints; j++)
            {
                if (PointsBuffer[j*2+1]<findY)
                {
                        findX=PointsBuffer[j*2];
                        findY=PointsBuffer[j*2+1];
                 }
            }
            point->append(findX,findY);
        }
    }

}
void scaner::secondTemplate(QAbstractSeries *series)
{

}

void scaner:: search()
{
    RFDevice::Initialize();
    std::cout << "Searching..." << std::endl;
    nRF625 = ld.Search(625, 2);
    std::cout << "Found " << nRF625 << " of RF625" << std::endl;               //	NRF содержит количество найденных девайсов

    if(nRF625!=0)
    {
        for (i=0; i<nRF625; i++)                                               //	Создание объектов для всех найденных девайсов
          {
              RFDevice::RF625Device *p = new RFDevice::RF625Device(ld[i]);
              if (p)
              {
                  vRF625.push_back(p);
              }
              else
              {
                  std::cout << "Failed to construct RF625Device #" << i << std::endl;
              }
          }
      nRF625 = vRF625.size();
    }

}

void scaner::connectionTO()
{
    if(nRF625!=0)
    {
    for (i=0; i<nRF625; i++)                                        //	Поочередное подключение к девайсам
    {
        if (FALSE == vRF625[i]->Connect())
        {
            std::cout << "Failed to Connect(TCP) to RF625Device #" << i << std::endl;
        }
        else
        {
            std::cout << "Connected(TCP) to RF625Device #" << i << std::endl;
        }
    }
    }
    std::cout<<"san9"<<std::endl;
}


void scaner::measurement()
{
    qDebug()<<"counter from c++="<<counter;

        for (k=0; k<10; k++)
        {
            for (i=0; i<nRF625; i++)
            {
                if (GETRESULT_ERROR_VALUE == vRF625[i]->GetNormalizedResult(PointsBuffer, &nPoints))
                {
                    std::cout << "Failed to read measure from RF625Device #" << i << std::endl;
                }
                else
                {
                    std::cout << "RF625Device #" << i << ": " << nPoints << " points:" << std::endl << "  {";//	Print first VALUES_TO_PRINT values
                    for (j=0; j<MIN(VALUES_TO_PRINT,nPoints); j++)
                    {
                        std::cout << PointsBuffer[j*2] << "," << PointsBuffer[j*2+1];
                        if (j<MIN(VALUES_TO_PRINT-1,nPoints-1)) std::cout << "; ";
                    }
                    std::cout << "...}" << std::endl;
                }
            }
            if (nRF625 > 0) ::Sleep(100);
        }
    }


void scaner::disconnection()
{
    for (i=0; i<nRF625; i++)
    {
        if (FALSE == vRF625[i]->Disconnect())
        {
            std::cout << "Failed to Disconnect(TCP) RF625Device #" << i << std::endl;
        }
        else
        {
            std::cout << "Disconnected(TCP) RF625Device #" << i << std::endl;
            std::cout<<"couner="<<counter;
        }
    }
}

void scaner::releaseMemory()
{
    while (!vRF625.empty())
    {
        RFDevice::RF625Device *p = vRF625.back();
        if (p) delete p;
        vRF625.pop_back();
    }
    std::cout<<"ReleaseMemory"<<std::endl;
}

void scaner::cleanUpRfdevice()
{
    RFDevice::Cleanup();
    std::cout<<"cleanUP"<<std::endl;
}


