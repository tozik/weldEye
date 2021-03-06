#include "scaner.h"

    int nRF625;                                                      // Количество найденных девайсов
    int i, j, k;
    float PointsBuffer[RFDevice::RF625Device::ProfileValuesCount];  //	Буфер для максимального количества (Х,Z *1280)
    vector <RFDevice::RF625Device *> vRF625;                         //
    RFDevice::RFEthernetDetector ld;                                 //	Создание объекта для поиска
    USHORT nPoints;                                                  //  количество тоечк

scaner::scaner()
{
                                            //	Initialize RFDevice

}

void scaner:: search()
{
    RFDevice::Initialize();
    cout << "Searching..." << endl;
    nRF625 = ld.Search(625, 2);
    cout << "Found " << nRF625 << " of RF625" << endl;               //	NRF содержит количество найденных девайсов

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
                  cout << "Failed to construct RF625Device #" << i << endl;
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
            cout << "Failed to Connect(TCP) to RF625Device #" << i << endl;
        }
        else
        {
            cout << "Connected(TCP) to RF625Device #" << i << endl;
        }
    }
    }
    cout<<"san9"<<endl;
}

void scaner::measurement()
{
    for (k=0; k<MEASURES_TO_DO; k++)
    {
        for (i=0; i<nRF625; i++)
        {
            if (GETRESULT_ERROR_VALUE == vRF625[i]->GetNormalizedResult(PointsBuffer, &nPoints))
            {
                cout << "Failed to read measure from RF625Device #" << i << endl;
            }
            else
            {
                cout << "RF625Device #" << i << ": " << nPoints << " points:" << endl << "  {";//	Print first VALUES_TO_PRINT values
                for (j=0; j<MIN(VALUES_TO_PRINT,nPoints); j++)
                {
                    cout << PointsBuffer[j*2] << "," << PointsBuffer[j*2+1];
                    if (j<MIN(VALUES_TO_PRINT-1,nPoints-1)) cout << "; ";
                }
                cout << "...}" << endl;
            }
        }
        if (nRF625 > 0) ::Sleep(100);
    }
}

float* scaner :: Points()
{
    for (k=0; k<MEASURES_TO_DO; k++)
    {
        for (i=0; i<nRF625; i++)
        {
            if (GETRESULT_ERROR_VALUE==vRF625[0]->GetNormalizedResult(PointsBuffer, &nPoints))
            {
                cout << "Failed to read measure from RF625Device #" << i << endl;

            }
            else {
                scaner::getRes(PointsBuffer,nPoints);
            }
            if (nRF625 > 0) ::Sleep(1);


        }
}

}

void scaner::getRes(float* buf, USHORT numb)
{
    cout << "RF625Device #0 TEST"  << ": " <<  endl << "  {";
    for (j=0; j<numb; j++)
    {
        cout << buf[j*2] << "," << buf[j*2+1];
        if (j<numb-1)
            cout<<"; ";
    }
    cout << "--------------------OK}" << endl;
}

void scaner::disconnection()
{
    for (i=0; i<nRF625; i++)
    {
        if (FALSE == vRF625[i]->Disconnect())
        {
            cout << "Failed to Disconnect(TCP) RF625Device #" << i << endl;
        }
        else
        {
            cout << "Disconnected(TCP) RF625Device #" << i << endl;
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
}

void scaner::cleanUpRfdevice()
{
    RFDevice::Cleanup();
}

