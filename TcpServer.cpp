#include "TcpServer.h"

#define PORT 5020
TcpServer::TcpServer(QObject *parent) : QObject(parent)
{

serverPointer = new QTcpServer(this);
}

void TcpServer::startServer()
{
    serverPointer=new QTcpServer(this);
    if(!serverPointer->listen(QHostAddress::Any,5020))
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

    QTcpSocket *socketPointer= serverPointer->nextPendingConnection();//получить сокет входящего подключения
    qDebug()<<"incoming connection";
    socketPointer->readAll();

   // qDebug()<<socketPointer->read();
    qDebug()<<"finish transl";

   // socketPointer->write("Hello client\r\n");
    socketPointer->flush();
    socketPointer->waitForBytesWritten(3000);
}

void TcpServer::closeServer()
{
    serverPointer->close();

    qDebug()<<"socket\server close";
}
