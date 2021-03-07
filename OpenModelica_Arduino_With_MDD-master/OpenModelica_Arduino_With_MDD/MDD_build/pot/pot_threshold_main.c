#define fmi2TypesPlatform_h

#define fmi2TypesPlatform "default" /* Compatible */

typedef struct pot_threshold_fmi2Component_s* fmi2Component;
typedef void* fmi2ComponentEnvironment;    /* Pointer to FMU environment    */
typedef void* fmi2FMUstate;                /* Pointer to internal FMU state */
typedef unsigned int fmi2ValueReference;
typedef double fmi2Real;
typedef int fmi2Integer;
typedef int fmi2Boolean;
typedef char fmi2Char;
typedef const fmi2Char* fmi2String;
typedef char fmi2Byte;

#define fmi2True 1
#define fmi2False 0

#include "fmi2/fmi2Functions.h"

#include <stdint.h>
#include <stdio.h>

void ModelicaFormatMessage(const char *fmt, ...)
{
  va_list args;
  va_start(args, fmt);
  vprintf(fmt, args);
  va_end(args);
}

typedef struct pot_threshold_fmi2Component_s {
  fmi2Real currentTime;
  fmi2Real fmi2RealVars[7];
  fmi2Boolean fmi2BooleanVars[6];
  fmi2Real fmi2RealParameter[5];
  fmi2Integer fmi2IntegerParameter[1];
  fmi2Boolean fmi2BooleanParameter[1];
  fmi2String fmi2StringParameter[1];
  void* extObjs[6];
} pot_threshold_fmi2Component;

pot_threshold_fmi2Component pot_threshold_component = {
  .fmi2RealVars = {
    0.0 /*adc._y*/,
    0.0 /*greater1._u1*/,
    0.0 /*greater1._u2*/,
    0.0 /*greater2._u1*/,
    0.0 /*realExpression1._y*/,
    0.0 /*realExpression2._y*/,
    0.0 /*realValue1._number*/,
  },
  .fmi2BooleanVars = {
    fmi2False /*digitalWriteBoolean1._u*/,
    fmi2False /*digitalWriteBoolean2._u*/,
    fmi2False /*digitalWriteBoolean3._u*/,
    fmi2False /*greaterEqualThreshold1._y*/,
    fmi2False /*greaterEqualThreshold2._y*/,
    fmi2False /*greaterEqualThreshold3._y*/,
  },
  .fmi2RealParameter = {
    0.0 /*greaterEqualThreshold1._threshold*/,
    320.0 /*greaterEqualThreshold2._threshold*/,
    900.0 /*greaterEqualThreshold3._threshold*/,
    0.5 /*realToBoolean1._threshold*/,
    0.002 /*synchronizeRealtime1._actualInterval*/,
  },
  .fmi2IntegerParameter = {
    5 /*realValue1._significantDigits*/,
  },
  .fmi2BooleanParameter = {
    fmi2True /*realValue1._use_numberPort*/,
  },
};

#include <math.h>
/* TODO: Generate used builtin functions before SimCode */
static inline double om_mod(double x, double y)
{
  return x-floor(x/y)*y;
}

static const char * const OMCLIT0 = "ElectricPotential";
static const char * const OMCLIT1 = "V";
#include "MDDAVRTimer.h"
#include "MDDAVRRealTime.h"
#include "MDDAVRDigital.h"
#include "MDDAVRAnalog.h"

static inline fmi2Real Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_Analog_read__voltage(fmi2Component comp, fmi2Integer om_analogPort, fmi2Real om_vref, fmi2Integer om_voltageResolution);
static inline void* Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_Analog_Init_constructor(fmi2Component comp, fmi2Integer om_divisionFactor, fmi2Integer om_referenceVoltage);
static inline void Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_Analog_Init_destructor(fmi2Component comp, void* om_avr);
static inline void Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_Digital_write(fmi2Component comp, void* om_port, fmi2Integer om_pin, fmi2Boolean om_value);
static inline void* Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_Digital_InitWrite_constructor(fmi2Component comp, fmi2Integer om_port, fmi2Integer om_pin);
static inline void Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_Digital_InitWrite_destructor(fmi2Component comp, void* om_digital);
static inline void Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_RealTimeSynchronization_wait(fmi2Component comp, void* om_rt);
static inline void* Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_RealTimeSynchronization_Init_constructor(fmi2Component comp, void* om_timer, fmi2Integer om_timerValue, fmi2Integer om_numTimerInterruptsPerCycle);
static inline void Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_RealTimeSynchronization_Init_destructor(fmi2Component comp, void* om_rt);
static inline void* Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_Timers_Timer_constructor(fmi2Component comp, fmi2Integer om_timerSelect, fmi2Integer om_clockSelect, fmi2Boolean om_clearTimerOnMatch);
static inline void Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_Timers_Timer_destructor(fmi2Component comp, void* om_timer);

static inline fmi2Real Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_Analog_read__voltage(fmi2Component comp, fmi2Integer om_analogPort, fmi2Real om_vref, fmi2Integer om_voltageResolution)
{
  fmi2Real om_value;
  om_value = MDD_avr_analog_read(om_analogPort, om_vref, om_voltageResolution);
  return om_value;
}
static inline void* Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_Analog_Init_constructor(fmi2Component comp, fmi2Integer om_divisionFactor, fmi2Integer om_referenceVoltage)
{
  void* om_avr;
  om_avr = MDD_avr_analog_init(om_divisionFactor, om_referenceVoltage);
  return om_avr;
}
static inline void Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_Analog_Init_destructor(fmi2Component comp, void* om_avr)
{
  MDD_avr_analog_close(om_avr);
}
static inline void Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_Digital_write(fmi2Component comp, void* om_port, fmi2Integer om_pin, fmi2Boolean om_value)
{
  MDD_avr_digital_pin_write(om_port, om_pin, om_value);
}
static inline void* Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_Digital_InitWrite_constructor(fmi2Component comp, fmi2Integer om_port, fmi2Integer om_pin)
{
  void* om_dig;
  om_dig = MDD_avr_digital_pin_init(om_port, om_pin, fmi2True);
  return om_dig;
}
static inline void Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_Digital_InitWrite_destructor(fmi2Component comp, void* om_digital)
{
  MDD_avr_digital_pin_close(om_digital);
}
static inline void Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_RealTimeSynchronization_wait(fmi2Component comp, void* om_rt)
{
  MDD_avr_rt_wait(om_rt);
}
static inline void* Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_RealTimeSynchronization_Init_constructor(fmi2Component comp, void* om_timer, fmi2Integer om_timerValue, fmi2Integer om_numTimerInterruptsPerCycle)
{
  void* om_rt;
  om_rt = MDD_avr_rt_init(om_timer, om_timerValue, om_numTimerInterruptsPerCycle);
  return om_rt;
}
static inline void Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_RealTimeSynchronization_Init_destructor(fmi2Component comp, void* om_rt)
{
  MDD_avr_rt_close(om_rt);
}
static inline void* Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_Timers_Timer_constructor(fmi2Component comp, fmi2Integer om_timerSelect, fmi2Integer om_clockSelect, fmi2Boolean om_clearTimerOnMatch)
{
  void* om_timer;
  om_timer = MDD_avr_timer_init(om_timerSelect, om_clockSelect, om_clearTimerOnMatch);
  return om_timer;
}
static inline void Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_Timers_Timer_destructor(fmi2Component comp, void* om_timer)
{
  MDD_avr_timer_close(om_timer);
}

fmi2Component pot_threshold_fmi2Instantiate(fmi2String name, fmi2Type ty, fmi2String GUID, fmi2String resources, const fmi2CallbackFunctions* functions, fmi2Boolean visible, fmi2Boolean loggingOn)
{
  static int initDone=0;
  if (initDone) {
    return NULL;
  }
  return &pot_threshold_component;
}

fmi2Status pot_threshold_fmi2SetupExperiment(fmi2Component comp, fmi2Boolean toleranceDefined, fmi2Real tolerance, fmi2Real startTime, fmi2Boolean stopTimeDefined, fmi2Real stopTime)
{
  return fmi2OK;
}

fmi2Status pot_threshold_fmi2EnterInitializationMode(fmi2Component comp)
{
  comp->extObjs[0] /* adc._analog EXTOBJ: Modelica_DeviceDrivers.EmbeddedTargets.AVR.Functions.Analog.Init */ = Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_Analog_Init_constructor(comp, 7, 4);
  comp->extObjs[3] /* digitalWriteBoolean3._digital EXTOBJ: Modelica_DeviceDrivers.EmbeddedTargets.AVR.Functions.Digital.InitWrite */ = Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_Digital_InitWrite_constructor(comp, 2, 4);
  comp->extObjs[2] /* digitalWriteBoolean2._digital EXTOBJ: Modelica_DeviceDrivers.EmbeddedTargets.AVR.Functions.Digital.InitWrite */ = Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_Digital_InitWrite_constructor(comp, 2, 3);
  comp->extObjs[1] /* digitalWriteBoolean1._digital EXTOBJ: Modelica_DeviceDrivers.EmbeddedTargets.AVR.Functions.Digital.InitWrite */ = Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_Digital_InitWrite_constructor(comp, 2, 2);
  comp->extObjs[4] /* synchronizeRealtime1._clock EXTOBJ: Modelica_DeviceDrivers.EmbeddedTargets.AVR.Functions.Timers.Timer */ = Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_Timers_Timer_constructor(comp, 1, 4, fmi2False);
  comp->extObjs[5] /* synchronizeRealtime1._sync EXTOBJ: Modelica_DeviceDrivers.EmbeddedTargets.AVR.Functions.RealTimeSynchronization.Init */ = Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_RealTimeSynchronization_Init_constructor(comp, comp->extObjs[4] /* synchronizeRealtime1._clock EXTOBJ: Modelica_DeviceDrivers.EmbeddedTargets.AVR.Functions.Timers.Timer */, 249, 2);
  return fmi2OK;
}

fmi2Status pot_threshold_fmi2ExitInitializationMode(fmi2Component comp)
{
  return fmi2OK;
}

static fmi2Status pot_threshold_functionODE(fmi2Component comp)
{
}

static fmi2Status pot_threshold_functionOutputs(fmi2Component comp)
{
  comp->fmi2RealVars[0] /* adc._y variable */ = Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_Analog_read__voltage(comp, 3, 1024.0, 10); /* equation 15 */
  comp->fmi2BooleanVars[5] /* greaterEqualThreshold3._y DISCRETE */ = (comp->fmi2RealVars[0] /* adc._y variable */)>=(comp->fmi2RealParameter[2] /* greaterEqualThreshold3._threshold PARAM */); /* equation 16 */
  comp->fmi2RealVars[2] /* greater1._u2 variable */ = (comp->fmi2BooleanVars[5] /* greaterEqualThreshold3._y DISCRETE */) ? (1.0) : (0.0); /* equation 17 */
  comp->fmi2BooleanVars[2] /* digitalWriteBoolean3._u DISCRETE */ = (comp->fmi2RealVars[2] /* greater1._u2 variable */)>=(comp->fmi2RealParameter[3] /* realToBoolean1._threshold PARAM */); /* equation 18 */
  comp->fmi2BooleanVars[4] /* greaterEqualThreshold2._y DISCRETE */ = (comp->fmi2RealVars[0] /* adc._y variable */)>=(comp->fmi2RealParameter[1] /* greaterEqualThreshold2._threshold PARAM */); /* equation 19 */
  comp->fmi2RealVars[1] /* greater1._u1 variable */ = (comp->fmi2BooleanVars[4] /* greaterEqualThreshold2._y DISCRETE */) ? (1.0) : (0.0); /* equation 20 */
  comp->fmi2BooleanVars[1] /* digitalWriteBoolean2._u DISCRETE */ = (comp->fmi2RealVars[1] /* greater1._u1 variable */)>(comp->fmi2RealVars[2] /* greater1._u2 variable */); /* equation 21 */
  comp->fmi2BooleanVars[3] /* greaterEqualThreshold1._y DISCRETE */ = (comp->fmi2RealVars[0] /* adc._y variable */)>=(comp->fmi2RealParameter[0] /* greaterEqualThreshold1._threshold PARAM */); /* equation 22 */
  comp->fmi2RealVars[3] /* greater2._u1 variable */ = (comp->fmi2BooleanVars[3] /* greaterEqualThreshold1._y DISCRETE */) ? (1.0) : (0.0); /* equation 23 */
  comp->fmi2BooleanVars[0] /* digitalWriteBoolean1._u DISCRETE */ = (comp->fmi2RealVars[3] /* greater2._u1 variable */)>(comp->fmi2RealVars[1] /* greater1._u1 variable */); /* equation 24 */Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_RealTimeSynchronization_wait(comp, comp->extObjs[5] /* synchronizeRealtime1._sync EXTOBJ: Modelica_DeviceDrivers.EmbeddedTargets.AVR.Functions.RealTimeSynchronization.Init */);Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_Digital_write(comp, comp->extObjs[1] /* digitalWriteBoolean1._digital EXTOBJ: Modelica_DeviceDrivers.EmbeddedTargets.AVR.Functions.Digital.InitWrite */, 2, comp->fmi2BooleanVars[0] /* digitalWriteBoolean1._u DISCRETE */);Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_Digital_write(comp, comp->extObjs[2] /* digitalWriteBoolean2._digital EXTOBJ: Modelica_DeviceDrivers.EmbeddedTargets.AVR.Functions.Digital.InitWrite */, 3, comp->fmi2BooleanVars[1] /* digitalWriteBoolean2._u DISCRETE */);Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_Digital_write(comp, comp->extObjs[3] /* digitalWriteBoolean3._digital EXTOBJ: Modelica_DeviceDrivers.EmbeddedTargets.AVR.Functions.Digital.InitWrite */, 4, comp->fmi2BooleanVars[2] /* digitalWriteBoolean3._u DISCRETE */);
}

fmi2Status pot_threshold_fmi2DoStep(fmi2Component comp, fmi2Real currentCommunicationPoint, fmi2Real communicationStepSize, fmi2Boolean noSetFMUStatePriorToCurrentPoint)
{
  comp->currentTime = currentCommunicationPoint;
  /* TODO: Calculate time/state-dependent variables here... */
  pot_threshold_functionOutputs(comp);
  return fmi2OK;
}

int main(int argc, char **argv)
{
  int terminateSimulation = 0;
  fmi2Status status = fmi2OK;
  fmi2CallbackFunctions cbf = {
  .logger = NULL,
  .allocateMemory = NULL /*calloc*/,
  .freeMemory = NULL /*free*/,
  .stepFinished = NULL, //synchronous execution
  .componentEnvironment = NULL
  };

  fmi2Component comp = pot_threshold_fmi2Instantiate("", fmi2CoSimulation, "", "", &cbf, fmi2False, fmi2False);
  if (comp==NULL) {
    return 1;
  }
  pot_threshold_fmi2SetupExperiment(comp, fmi2False, 0.0, 0.0, fmi2False, 1.0);
  pot_threshold_fmi2EnterInitializationMode(comp);
  // Set start-values? Nah...
  pot_threshold_fmi2ExitInitializationMode(comp);
  
  double currentTime = 0.0;
  double h = 0.002;
  uint32_t i = 0;
  
  while (status == fmi2OK) {
    //retrieve outputs
      // fmi2GetReal(m, ..., 1, &y1);
    //set inputs
      // fmi2SetReal(m, ..., 1, &y2);
  
    //call slave and check status
    status = pot_threshold_fmi2DoStep(comp, currentTime, h, fmi2True);
    switch (status) {
      case fmi2Discard:
      case fmi2Error:
      case fmi2Fatal:
      case fmi2Pending /* Cannot happen */:
        terminateSimulation = 1;
        break;
      case fmi2OK:
      case fmi2Warning:
        break;
    }
    if (terminateSimulation) {
      break;
    }
    i++;
    /* increment master time */
    currentTime = 0.0 + h*i;
  }
  
#if 0
  if ((status != fmi2Error) && (status != fmi2Fatal)) {
    fmi2Terminate(m);
  }
  if (status != fmi2Fatal) {
    fmi2FreeInstance(m);
  }
#endif
}

