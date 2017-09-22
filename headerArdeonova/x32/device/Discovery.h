#ifndef DISCOVERY_H
#define DISCOVERY_H

#include <device/EthDeviceInfo.h>

namespace ANOVA_NAMESPACE {

class ANOVACORESHARED_EXPORT Discovery
{
public:
    /**
     * @brief findFirstDevice finds first available device to quickly connect to it
     * @return Device description or null if function fails
     *
     * Caller must delete pointer returned byt this function
     */
    static DeviceInfo *findFirstDevice(int timeout = 3000);

    /**
     * @brief findDeviceByProductId finds device with matching product id
     * @param id Device id to match
     * @param timeout Timeout in milliseconds
     * @return device description on success or null if failed
     *
     * Caller must delete pointer returned byt this function
     */
    static DeviceInfo *findDeviceByProductId(unsigned int id, int timeout = 3000);

    /**
     * @brief findDeviceByIp finds device with matching IP address
     * @param IP address to match
     * @param timeout Timeout in milliseconds
     * @return device description on success or null if failed
     *
     * Caller must delete pointer returned byt this function
     */
    static EthDeviceInfo *findDeviceByIp(char *ip, int timeout = 3000);

private:
    explicit Discovery();
};

}

#endif // DISCOVERY_H
