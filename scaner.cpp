#include "scaner.h"
#include <QtCharts/QXYSeries>
#include <QtCharts/QAreaSeries>
#include <QtQuick/QQuickView>
#include <QtQuick/QQuickItem>
#include <QtCore/QDebug>
#include <QtCore/QtMath>

#define con qDebug()

    QT_CHARTS_USE_NAMESPACE

Q_DECLARE_METATYPE(QAbstractSeries *)
Q_DECLARE_METATYPE(QAbstractAxis *)

scaner::scaner(QQuickView *appViewer, QObject *parent) :    QObject(parent),
    m_appViewer(appViewer),
    m_index(-1)
{
    qRegisterMetaType<QAbstractSeries*>();
    qRegisterMetaType<QAbstractAxis*>();

    generateData(0, 2, 20);
    con<<" CONSTRUCTORgenerateData";
    }
void scaner::update(QAbstractSeries *series)
{
    con<<"func update";
    if (series) {                                                   //если график
        QXYSeries *xySeries = static_cast<QXYSeries *>(series);     // приведение типов
                                                                    //classB* B = static_cast<classB*>A;
                                                                    //Эта конструкция приведет указатель на classA к Указателю на classB
                                                                    //при том условии что класс classB является наследдником класса classA

        con<<"QXYSeries";

        m_index++;
        if (m_index > m_data.count() - 1)
            m_index = 0;

        QVector<QPointF> points = m_data.at(m_index);
        // Use replace instead of clear + append, it's optimized for performance
        xySeries->replace(points);
        con<<"replace";
    }
}

void scaner::generateData(int type, int rowCount, int colCount)
{
    con<<"func generate";
    // Remove previous data
    foreach (QVector<QPointF> row, m_data)
        row.clear();
    con<<"foreach row.clear";
    m_data.clear();

    // Append the new data depending on the type
    for (int i(0); i < rowCount; i++) {
        con<<"first for appened"<<rowCount;
        QVector<QPointF> points;
        points.reserve(colCount);
        for (int j(0); j < colCount; j++) {
            qreal x(0);
            qreal y(0);
            switch (type) {
            case 0:
                // data with sin + random component
                y = qSin(3.14159265358979 / 50 * j) + 0.5 + (qreal) rand() / (qreal) RAND_MAX;
                x = j;
                break;
            case 1:
                // linear data
                x = j;
                y = (qreal) i / 10;
                break;
            default:
                // unknown, do nothing
                break;
            }
            points.append(QPointF(x, y));
            std::cout<<"i="<<i<<"\tj="<<j<<std::endl;
            std::cout<<"x== "<<x<<"\ty== "<<y<<"; ";

        }
        m_data.append(points);
        std::cout<<std::endl;
    std::cout<<"  m_data.append(points); rowCount=="<<rowCount<<std::endl;
    }
}
void scaner:: search()
{
    RFDevice::Initialize();
    std::cout << "Searching..." << std::endl;
    nRF625 = ld.Search(625, 2);
    std::cout << "Found " << nRF625 << " of RF625" << std::endl;               //	NRF содержит количество найденных девайсов

    if(nRF625!=0)
    {
        for (i=0; i<nRF625; i++)                                       //	Создание объектов для всех найденных девайсов
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

/*void scaner::measurement()
{
    for (k=0; k<MEASURES_TO_DO; k++)
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
*/

void scaner::measurement()
{

        for (k=0; k<MEASURES_TO_DO; k++)
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


