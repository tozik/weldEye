#ifndef GRABRESULT_H
#define GRABRESULT_H

#include <anovacore_global.h>
#include <device/GrabTypes.h>

namespace ANOVA_NAMESPACE {

class ANOVACORESHARED_EXPORT GrabResult
{
public:

    GrabResult(void *impl);
    ~GrabResult();

    GrabResult *clone();

    const char *getData();

    // caller must delete arrays
    /*!
     * \brief Not normalized points values. For normalized values should be divided into denominator value.
     * \param[out] points   Points array. For 2D scanner array size is equal to count * 2.
     * \param[out] count    Amount of points.
     * \return              True if operation successful.
     *
     * Caller must delete array
     */
    bool getResult(int **points, int *count);

    /*!
     * \brief Normalized points values. E.g. in millimeters.
     * \param[out] points   Points array. For 2D scanner array size is equal to count * 2.
     * \param[out] count    Amount of points.
     * \return              True if operation successful.
     *
     * Caller must delete returned array
     */
    bool getNormalizedResult(double **points, int *count);

    /*!
     * \brief getFormat
     * \return Grabbed data format
     */
    GrabFormat getFormat() const;

    /*!
     * \brief getContentType
     * \return grabbed data content type
     */
    ContentType getContentType();

    /*!
     * \brief getWidth only valid for video frame
     * \return frame width in pixels
     */
    int getWidth() const;

    /*!
     * \brief getHeight only valid for video frame
     * \return frame height in pixels
     */
    int getHeight() const;

    /*!
     * \brief getDenominator only valid for profile frame
     * \return denominator for integer profile values
     */
    float getDenominator() const;

    /*!
     * \brief getPacketCounter
     * \return amount of frames sent from device to client
     */
    int getPacketCounter() const;

    /*!
     * \brief getFrameCounter
     * \return amount of frames captured by device
     */
    int getFrameCounter() const;

    /*!
     * \brief getFps
     * \return framerate of a stream
     */
    float getFps() const;

private:
    void *m_impl;
};

}

#endif // GRABRESULT_H
