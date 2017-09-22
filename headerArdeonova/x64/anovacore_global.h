#ifndef ANOVACORE_GLOBAL_H
#define ANOVACORE_GLOBAL_H

#ifdef __linux__

#define AN_DECL_EXPORT     __attribute__((visibility("default")))
#define AN_DECL_IMPORT     __attribute__((visibility("default")))
#define AN_DECL_HIDDEN     __attribute__((visibility("hidden")))

#else

#define AN_DECL_EXPORT     __declspec(dllexport)
#define AN_DECL_IMPORT     __declspec(dllimport)

#endif

#define ANOVA_NAMESPACE ArdeoNova_1_2_0


namespace ANOVA_NAMESPACE {

const char *getSdkVersion();

}

namespace ArdeoNova = ANOVA_NAMESPACE;

#if defined(ANOVACORE_LIBRARY)
#  define ANOVACORESHARED_EXPORT AN_DECL_EXPORT
#else
#  define ANOVACORESHARED_EXPORT AN_DECL_IMPORT
#endif

#define AN_DECL_OVERRIDE override

#endif // ANOVACORE_GLOBAL_H
