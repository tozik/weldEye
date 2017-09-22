#ifndef DEVICEDEFS_H
#define DEVICEDEFS_H

#include <anovacore_global.h>

/*! \file */

namespace ANOVA_NAMESPACE {

enum ConnectionState {
    DisconnectedState = 0x1,    ///< Device is not opened
    ConnectedState = 0x2,       ///< Device opened and alive.
    ReconnectingState = 0x3     ///< Device opened, connection lost, attempting to reconnect.
};

}

#endif // DEVICEDEFS_H
