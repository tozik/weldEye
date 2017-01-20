#ifndef TCPSERVER_H
#define TCPSERVER_H
#include <QTcpServer>
#include <QTcpSocket>
#include <QObject>
#include <iostream>
#include <QDataStream>
#include <QTime>
#include <QString>
#include <QByteArray>
using namespace std;
class TcpServer : public QObject
{
    Q_OBJECT
public:
    explicit TcpServer(QObject *parent = 0);

signals:

public slots:
    void startServer();
    void incommingConnection();
    void closeServer();
    void read();
//    void sendToClient(QTcpSocket* pSocket, const QString& str);

private:
    QTcpServer *serverPointer;
    QTcpSocket *socketPointer;
    QByteArray data;
    };

#endif // TCPSERVER_H
