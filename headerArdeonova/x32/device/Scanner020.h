#ifndef SCANNER020_H
#define SCANNER020_H

#include <device/EthDevice.h>
#include <device/Scanner020Params.h>

namespace ANOVA_NAMESPACE
{

	class ANOVACORESHARED_EXPORT Scanner020 : public EthDevice, public Scanner020Params
	{

		friend class DeviceFactory;

	protected:

		Scanner020(void *impl);

	public:

		~Scanner020();
		bool open() AN_DECL_OVERRIDE;

	};

}

#endif //SCANNER020_H
