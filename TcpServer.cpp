#include "TcpServer.h"

#define PORT 5020
TcpServer::TcpServer(QObject *parent) : QObject(parent)
{

serverPointer = new QTcpServer(this);
}

void TcpServer::startServer()
{
    serverPointer=new QTcpServer(this);
    if(!serverPointer->listen(QHostAddress("192.168.13.5"),5020))
    {
        qDebug() << "Server could not start";
    }
    else
    {
        qDebug() << "Server started!";
    }
    connect(serverPointer,SIGNAL(newConnection()),this,SLOT(incommingConnection()));

}

void TcpServer::incommingConnection()
{

//    bool arr[31623] = {false};
//         for (int i = 0; i < 31623; i++)
//             arr[i] = (i%2==0);

//         for (int i = 0; i < 31623; i++)
//             cout<< arr[i]?1:0;
    socketPointer= serverPointer->nextPendingConnection();//получить сокет входящего подключения
    qDebug()<<"incoming connection";
    connect(socketPointer,SIGNAL(readyRead()),this,SLOT(read()));

   // socketPointer->write("Hello client\r\n");
//    socketPointer->flush();
//    socketPointer->waitForBytesWritten(3000);
}

void TcpServer::read()
{
        qDebug()<<"read";
       data=socketPointer->readAll();
       qDebug()<<"dataread";
       qDebug()<<"data is=>>>>"<<data;
       socketPointer->write(data);

}

void TcpServer::closeServer()
{
    serverPointer->close();

    qDebug()<<"socket\server close";
}
