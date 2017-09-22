#ifndef DEVICEFACTORY_H
#define DEVICEFACTORY_H

#include <device/DeviceInfo.h>
#include <device/EthDevice.h>
#include <device/Scanner020.h>

namespace ANOVA_NAMESPACE {

class ANOVACORESHARED_EXPORT DeviceFactory
{
public:
    /**
     * @brief Creates Device with specified ArdeoNova::DeviceInfo
     * @param deviceInfo Device description
     * @return Returns ArdeoNova::Device implementation, or null if function fails
     *
     * Internally this class uses ArdeoNova::DeviceInfo to determine device connectivity
     * capabilities and creates specific specific implementation of Device interface
     */
    static EthDevice *create(DeviceInfo *deviceInfo);


    /**
     * @brief Creates Scanner020 class
     * @param deviceInfo Device description
     * @return ArdeoNova::Scanner020 instance
     *
     * ArdeoNova::Scanner020 class contains fields with device parameters nodes
     */
    static Scanner020 *createScanner020(DeviceInfo *deviceInfo);

protected:
    DeviceFactory();
};

}

#endif // DEVICEFACTORY_H
