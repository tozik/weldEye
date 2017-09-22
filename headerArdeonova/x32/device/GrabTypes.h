#ifndef GRABTYPES_H
#define GRABTYPES_H

#include <anovacore_global.h>

namespace ANOVA_NAMESPACE {

enum GrabFormat {
    GF_CUSTOM = -1,
    GF_RGB888 = 1,
    GF_BGR888 = 2,
    GF_MONO8 = 3,
    GF_BAYERRG8 = 4,
    GF_INT16 = 5,
    GF_INT32 = 6,
    GF_DOUBLE = 7,
    GF_FLOAT = 8
};

enum ContentType {
    CT_VideoFrame = 0x1,
    CT_Measurement = 0x2
};


inline ANOVA_NAMESPACE::ContentType operator |(ANOVA_NAMESPACE::ContentType a, ANOVA_NAMESPACE::ContentType b){
    return static_cast<ANOVA_NAMESPACE::ContentType>(static_cast<int>(a) | static_cast<int>(b));
}

inline ANOVA_NAMESPACE::ContentType operator &(ANOVA_NAMESPACE::ContentType a, ANOVA_NAMESPACE::ContentType b){
    return static_cast<ANOVA_NAMESPACE::ContentType>(static_cast<int>(a) & static_cast<int>(b));
}

}

#endif // GRABTYPES_H
