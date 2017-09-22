#ifndef SCANNER020PARAMS_H
#define SCANNER020PARAMS_H

#include <anovacore_global.h>
#include <GenApi/IEnumerationT.h>
#include <GenApi/DLLLoad.h>

#include <GenApi/IBoolean.h>
#include <GenApi/ICategory.h>
#include <GenApi/ICommand.h>
#include <GenApi/IEnumeration.h>
#include <GenApi/IEnumEntry.h>
#include <GenApi/IFloat.h>
#include <GenApi/IInteger.h>
#include <GenApi/IString.h>
#include <GenApi/IRegister.h>

namespace ANOVA_NAMESPACE
{

	//*************
	// Enumerations
	//*************

	enum StreamHostModeEnums
	{
		StreamHostMode_Fixed,
		StreamHostMode_Auto
	};

	enum ActiveDataTypeEnums
	{
		ActiveDataType_Video,
		ActiveDataType_Measurements
	};

	enum TriggerTypeEnums
	{
		TriggerType_No,
		TriggerType_Trig,
		TriggerType_Enc,
		TriggerType_StepDir
	};

	enum SubsamplingEnums
	{
		Subsampling_Off,
		Subsampling_On
	};

	enum SyncTypeEnums
	{
		SyncType_Off,
		SyncType_Trigger,
		SyncType_Cycle,
		SyncType_TriggerAndCycle
	};

	enum SyncSourceEnums
	{
		SyncSource_ExtPort1,
		SyncSource_ExtPort2,
		SyncSource_ExtPort3,
		SyncSource_Internal
	};


	//****************
	// Parameter class
	//****************


	class ANOVACORESHARED_EXPORT Scanner020Params
	{

		friend class DeviceFactory;
		friend class Scanner020;

	protected:

		Scanner020Params();
		void _Initialize(GenApi::INodeMap*);

	public:

		~Scanner020Params();

		GenApi::IInteger &IpAddressInt;

		GenApi::IInteger &SubnetMaskInt;

		GenApi::IInteger &GatewayInt;

		GenApi::IString &MacAddress;

		GenApi::IEnumerationT<StreamHostModeEnums> &StreamHostMode;

		GenApi::IInteger &StreamerAddressInt;

		GenApi::IInteger &StreamerPort;

		GenApi::IInteger &LaserLevel;

		GenApi::IFloat &Exposure;

		GenApi::IFloat &Gain;

		GenApi::IFloat &BlackLevel;

		GenApi::IEnumerationT<ActiveDataTypeEnums> &ActiveDataType;

		GenApi::IInteger &OutputFrequency;

		GenApi::IEnumerationT<SubsamplingEnums> &Subsampling;

		GenApi::IEnumerationT<SyncTypeEnums> &SyncType;

		GenApi::IEnumerationT<TriggerTypeEnums> &TriggerType;

		GenApi::IEnumerationT<SyncSourceEnums> &SyncSource;

		GenApi::IString &DeviceType;

		GenApi::IString &FirmwareVersion;

		GenApi::IInteger &RangeBase;

		GenApi::IInteger &RangeSize;

		GenApi::IInteger &RangeSMRX;

		GenApi::IInteger &RangeEMRX;

		GenApi::IInteger &SensorWidth;

		GenApi::IInteger &SensorHeight;

	};

}

#endif //SCANNER020PARAMS_H
