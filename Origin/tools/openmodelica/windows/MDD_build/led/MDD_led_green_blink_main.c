#define fmi2TypesPlatform_h

#define fmi2TypesPlatform "default" /* Compatible */

typedef struct MDD_led_green_blink_fmi2Component_s* fmi2Component;
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

typedef struct MDD_led_green_blink_fmi2Component_s {
  fmi2Real currentTime;
  fmi2Boolean fmi2BooleanVars[1];
  fmi2Real fmi2RealParameter[1];
  void* extObjs[3];
} MDD_led_green_blink_fmi2Component;

MDD_led_green_blink_fmi2Component MDD_led_green_blink_component = {
  .fmi2BooleanVars = {
    fmi2False /*booleanExpression1._y*/,
  },
  .fmi2RealParameter = {
    0.01 /*synchronizeRealtime1._actualInterval*/,
  },
};

#include <math.h>
/* TODO: Generate used builtin functions before SimCode */
static inline double om_mod(double x, double y)
{
  return x-floor(x/y)*y;
}

#include "MDDAVRTimer.h"
#include "MDDAVRRealTime.h"
#include "MDDAVRDigital.h"

static inline void Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_Digital_write(fmi2Component comp, void* om_port, fmi2Integer om_pin, fmi2Boolean om_value);
static inline void* Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_Digital_InitWrite_constructor(fmi2Component comp, fmi2Integer om_port, fmi2Integer om_pin);
static inline void Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_Digital_InitWrite_destructor(fmi2Component comp, void* om_digital);
static inline void Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_RealTimeSynchronization_wait(fmi2Component comp, void* om_rt);
static inline void* Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_RealTimeSynchronization_Init_constructor(fmi2Component comp, void* om_timer, fmi2Integer om_timerValue, fmi2Integer om_numTimerInterruptsPerCycle);
static inline void Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_RealTimeSynchronization_Init_destructor(fmi2Component comp, void* om_rt);
static inline void* Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_Timers_Timer_constructor(fmi2Component comp, fmi2Integer om_timerSelect, fmi2Integer om_clockSelect, fmi2Boolean om_clearTimerOnMatch);
static inline void Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_Timers_Timer_destructor(fmi2Component comp, void* om_timer);

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

fmi2Component MDD_led_green_blink_fmi2Instantiate(fmi2String name, fmi2Type ty, fmi2String GUID, fmi2String resources, const fmi2CallbackFunctions* functions, fmi2Boolean visible, fmi2Boolean loggingOn)
{
  static int initDone=0;
  if (initDone) {
    return NULL;
  }
  return &MDD_led_green_blink_component;
}

fmi2Status MDD_led_green_blink_fmi2SetupExperiment(fmi2Component comp, fmi2Boolean toleranceDefined, fmi2Real tolerance, fmi2Real startTime, fmi2Boolean stopTimeDefined, fmi2Real stopTime)
{
  return fmi2OK;
}

fmi2Status MDD_led_green_blink_fmi2EnterInitializationMode(fmi2Component comp)
{
  comp->extObjs[1] /* synchronizeRealtime1._clock EXTOBJ: Modelica_DeviceDrivers.EmbeddedTargets.AVR.Functions.Timers.Timer */ = Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_Timers_Timer_constructor(comp, 1, 4, fmi2False);
  comp->extObjs[2] /* synchronizeRealtime1._sync EXTOBJ: Modelica_DeviceDrivers.EmbeddedTargets.AVR.Functions.RealTimeSynchronization.Init */ = Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_RealTimeSynchronization_Init_constructor(comp, comp->extObjs[1] /* synchronizeRealtime1._clock EXTOBJ: Modelica_DeviceDrivers.EmbeddedTargets.AVR.Functions.Timers.Timer */, 249, 10);
  comp->extObjs[0] /* digitalWriteBoolean1._digital EXTOBJ: Modelica_DeviceDrivers.EmbeddedTargets.AVR.Functions.Digital.InitWrite */ = Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_Digital_InitWrite_constructor(comp, 2, 3);
  return fmi2OK;
}

fmi2Status MDD_led_green_blink_fmi2ExitInitializationMode(fmi2Component comp)
{
  return fmi2OK;
}

static fmi2Status MDD_led_green_blink_functionODE(fmi2Component comp)
{
}

static fmi2Status MDD_led_green_blink_functionOutputs(fmi2Component comp)
{
  comp->fmi2BooleanVars[0] /* booleanExpression1._y DISCRETE */ = (om_mod(comp->currentTime,0.4))>=(0.2); /* equation 3 */Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_RealTimeSynchronization_wait(comp, comp->extObjs[2] /* synchronizeRealtime1._sync EXTOBJ: Modelica_DeviceDrivers.EmbeddedTargets.AVR.Functions.RealTimeSynchronization.Init */);Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_Digital_write(comp, comp->extObjs[0] /* digitalWriteBoolean1._digital EXTOBJ: Modelica_DeviceDrivers.EmbeddedTargets.AVR.Functions.Digital.InitWrite */, 3, comp->fmi2BooleanVars[0] /* booleanExpression1._y DISCRETE */);
}

fmi2Status MDD_led_green_blink_fmi2DoStep(fmi2Component comp, fmi2Real currentCommunicationPoint, fmi2Real communicationStepSize, fmi2Boolean noSetFMUStatePriorToCurrentPoint)
{
  comp->currentTime = currentCommunicationPoint;
  /* TODO: Calculate time/state-dependent variables here... */
  MDD_led_green_blink_functionOutputs(comp);
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

  fmi2Component comp = MDD_led_green_blink_fmi2Instantiate("", fmi2CoSimulation, "", "", &cbf, fmi2False, fmi2False);
  if (comp==NULL) {
    return 1;
  }
  MDD_led_green_blink_fmi2SetupExperiment(comp, fmi2False, 0.0, 0.0, fmi2False, 1.0);
  MDD_led_green_blink_fmi2EnterInitializationMode(comp);
  // Set start-values? Nah...
  MDD_led_green_blink_fmi2ExitInitializationMode(comp);
  
  double currentTime = 0.0;
  double h = 0.002;
  uint32_t i = 0;
  
  while (status == fmi2OK) {
    //retrieve outputs
      // fmi2GetReal(m, ..., 1, &y1);
    //set inputs
      // fmi2SetReal(m, ..., 1, &y2);
  
    //call slave and check status
    status = MDD_led_green_blink_fmi2DoStep(comp, currentTime, h, fmi2True);
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

