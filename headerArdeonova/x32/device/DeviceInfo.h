#ifndef DEVICEINFO_H
#define DEVICEINFO_H

#include <anovacore_global.h>
#include <device/InfoTypes.h>

namespace ANOVA_NAMESPACE {

class ANOVACORESHARED_EXPORT DeviceInfo
{
    friend class DeviceFactory;
    friend class StandaloneGrabbersManager;
public:
    virtual ~DeviceInfo();

    bool operator ==(DeviceInfo  const &other);

    /**
     * @brief productId device type
     * @return product id that allows to determine device type
     */
    unsigned int productId() const;

    /**
     * @brief serial number
     * @return device serial number
     */
    unsigned int serial() const;

    /**
     * @brief isValid
     * @return true if device info is valid and can be used in DeviceFactory, false otherwise
     */
    virtual bool isValid() const;

    /**
     * @brief deviceId same as operationalId()
     * @return unique deice type id
     */
    unsigned int deviceId() const;

    /**
     * @brief operationalId
     * @return unique device type id
     */
    virtual unsigned int operationalId() const;
    /**
     * @brief clone
     * @return copy of underlying DeviceInfo object
     */
    virtual DeviceInfo *clone();

    /**
     * @brief getTransportType
     * @return returns type of transport used to communicate to device
     */
    virtual TransportType getTransportType();

protected:
    explicit DeviceInfo(void *impl);

    void *m_impl;
};

}

#endif // DEVICEINFO_H
