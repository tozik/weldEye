#ifndef ERRORCODES_H
#define ERRORCODES_H

#include <anovacore_global.h>

namespace ANOVA_NAMESPACE {

enum ErrorCodes : int {
    NoError                 = 0,
    NoResponseFromDevice    = 1,
    IvalidNetworkResponse   = 2,
    IvalidArgumentType      = 3,
    UnknownParameter        = 4,
    ValueOutOfRange         = 5,
    UnsupportedFeature      = 6,
    DeviceNotConnected      = 7,
    FailedToGetGenApiData   = 8,
    CantConstructNodeMap    = 9
};

}



#endif // ERRORCODES_H
