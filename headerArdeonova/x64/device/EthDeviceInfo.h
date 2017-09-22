#ifndef ETHDEVICEINFO_H
#define ETHDEVICEINFO_H

#include <device/DeviceInfo.h>

namespace ANOVA_NAMESPACE {


class ANOVACORESHARED_EXPORT EthDeviceInfo : public DeviceInfo
{
    friend class Discovery;
    friend class EthDevice;

public:
    virtual ~EthDeviceInfo();

    unsigned int operationalId() const AN_DECL_OVERRIDE;

    /**
     * @brief clone
     * @return copy of device info
     */
    virtual DeviceInfo *clone() AN_DECL_OVERRIDE;

    /**
     * @brief getTransportType
     * @return returns type of transport used to communicate to device
     */
    virtual TransportType getTransportType() AN_DECL_OVERRIDE;

    /**
     * @brief address
     * @return string containing device IP address
     */
    const char *address() const;

    /**
     * @brief udpPort
     * @return UDP port used to transfer profile data
     */
    unsigned short udpPort() const;

    /**
     * @brief tcpPort
     * @return TCP port used to configure with device
     */
    unsigned short tcpPort() const;

    /**
     * @brief streamPort
     * @return UDP port used to video streaming
     */
    unsigned short streamPort() const;

private:
    EthDeviceInfo(void *impl);
};

}

#endif // ETHDEVICEINFO_H
