#ifndef STREAMGRABBER_H
#define STREAMGRABBER_H

#include <anovacore_global.h>
#include <device/GrabResult.h>

namespace ANOVA_NAMESPACE {

/*!
 * \brief The StreamGrabber interface is used to grab data from device
 * Whenever new data frame is recieved from device onGrab() function is called,
 * function argument contais grabbed data incapsulated in GrabResult class
 *
 * Basic implementation of this interface:
 * @code
 * class Grabber :
 *  public ArdeoNova::StreamGrabber
 *  {
 *  public:
 *      Grabber();
 *      virtual ~Grabber();
 *
 *      void onGrab(ArdeoNova::GrabResult *rs){
 *           dobule *data = nullptr;
 *           int nPoints 0;
 *           rs->getNormalizedResult(&data, &nPoints);
 *           // Process data here
 *           delete[] data;
 *      };
 *      ArdeoNova::ContentType requiredContentType(){
 *          return ArdeoNova::ContentType::CT_Measurement;
 *      };
 *  };
 * @endcode
 */
class ANOVACORESHARED_EXPORT StreamGrabber
{
public:
    /*!
     * \brief onGrab called when frame received
     * \param rs contains frame data
     */
    virtual void onGrab(GrabResult *rs) = 0;

    /*!
     * \brief onError called when error occurred
     */
    virtual void onError(){}

    /*!
     * \brief requiredContentType determines data type required by grabber implementation
     * \return must return ContentType value, or a combination of such
     */
    virtual ContentType requiredContentType() = 0;
};

}

#endif // STREAMGRABBER_H
