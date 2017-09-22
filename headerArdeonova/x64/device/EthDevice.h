#ifndef ETHDEVICE_H
#define ETHDEVICE_H

#include <device/Device.h>
#include <device/EthDeviceInfo.h>

namespace ANOVA_NAMESPACE {

class ANOVACORESHARED_EXPORT EthDevice : public Device
{
    friend class DeviceFactory;
public:
    virtual ~EthDevice();

    /**
     * @brief isConnected
     * @return true if connection is established and working, false other vice
     */
    virtual bool isConnected();

    /**
     * @brief ping
     * @return ping to device
     */
    virtual int ping();

    /**
     * @brief getEthInfo returns detailed device info
     * @return EthDeviceInfo pointer
     */
    EthDeviceInfo &getEthInfo() const;

    /**
     * @brief configureNetworking configures NIC of target device
     * @param info target device description
     * @param ip new IP address
     * @param subnet new subnet mask
     * @param gateway new gateway
     * @return true on success, false on failure
     */
    static bool configureNetworking(const EthDeviceInfo *info, int ip, int subnet, int gateway);

    /**
     * @brief configureNetworking configures NIC of target device, uses serial number to specify device
     * @param serial serial number of target device
     * @param ip new IP address
     * @param subnet new subnet mask
     * @param gateway new gateway
     * @return true on success, false on failure
     */
    static bool configureNetworking(int serial, int ip, int subnet, int gateway);

protected:
    EthDevice(void *impl);
};

}

#endif // ETHDEVICE_H
