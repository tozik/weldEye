#ifndef DEVICEPUB_H
#define DEVICEPUB_H

#include <device/DeviceInfo.h>
#include <GenApi/INodeMap.h>
#include <device/StreamGrabber.h>
#include <device/DeviceDefs.h>

namespace ANOVA_NAMESPACE {


class ANOVACORESHARED_EXPORT Device
{
    friend class DeviceFactory;
public:
    virtual ~Device();
    /**
     * @brief open function establishes connection to device
     * @return true on success, false if function fails
     */
    virtual bool open();

    /**
     * @brief close closes connection to device
     */
    virtual void close();

    /**
     * @brief connectionState returns current connection state
     * @return Current connection state
     */
    virtual ConnectionState connectionState();

    /**
     * @brief registerGrabber Sets stream grabber to receive data from device
     * @param grabber User implementation of ArdeoNova::StreamGrabber interface
     */
    virtual void registerGrabber(StreamGrabber *grabber);

    /**
     * @brief removeGrabber removes grabber from device
     * @param grabber pointer
     */
    virtual void removeGrabber(StreamGrabber *grabber);

    /**
     * @brief getNodeMap gets INodeMap for current device, for more details see GenApi documentation
     * @return pointer to INodeMap
     */
    virtual GenApi::INodeMap *getNodeMap();

    /**
     * @brief error returns last error code
     * @return error code
     */
    virtual int error();

    /**
     * @brief errorString text description of last error
     * @return error string
     */
    virtual const char* errorString();

    /**
     * @brief getBasicInfo gets DeviceInfo object that contains basic device info
     * @return DeviceInfo pointer
     */
    DeviceInfo &getBasicInfo() const;

protected:

    Device(void *impl);
    void *m_impl;
    DeviceInfo *m_info;
};

}

#endif // DEVICEPUB_H
