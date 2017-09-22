#ifndef STANDALONEGRABBERSMANAGER_H
#define STANDALONEGRABBERSMANAGER_H

#include <device\StreamGrabber.h>
#include <device\DeviceInfo.h>

namespace ANOVA_NAMESPACE {

/*!
 * \brief The StreamManager class is used for data acquisition without connection to device.
 */
class ANOVACORESHARED_EXPORT StandaloneGrabbersManager
{
public:
    ~StandaloneGrabbersManager();

    /*!
     * \brief registerEthernetGrabber register grabber for ethernet device on specific port.
     * \param grabber User implementation of StreamGrabber interface.
     * \param port UDP port number to recieve stream.
     * \return true on success, false otherwise.
     *
     * Grabbers registered with this function only capable to grab Measurement frames.
     */
    static bool registerEthernetGrabber(StreamGrabber *grabber, unsigned short port);

    /*!
     * \brief isGrabberRegistered
     * \param[in] grabber Grabber implementation pointer.
     * \return true if grabber is registered, false otherwise.
     */
    static bool isGrabberRegistered(StreamGrabber *grabber);

    /*!
     * \brief Removes grabber form StreamManager.
     * \param[in] grabber Grabber implementation pointer.
     * \return true if grabber is successfully removed, false otherwise.
     */
    static bool removeGrabber(StreamGrabber *grabber);

private:
    explicit StandaloneGrabbersManager();
};

}

#endif // STANDALONEGRABBERSMANAGER_H
