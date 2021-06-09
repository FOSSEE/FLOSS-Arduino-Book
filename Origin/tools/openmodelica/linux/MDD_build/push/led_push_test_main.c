#define fmi2TypesPlatform_h

#define fmi2TypesPlatform "default" /* Compatible */

typedef struct led_push_test_fmi2Component_s* fmi2Component;
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

typedef struct led_push_test_fmi2Component_s {
  fmi2Real currentTime;
  fmi2Boolean fmi2BooleanVars[3];
  void* extObjs[2];
} led_push_test_fmi2Component;

led_push_test_fmi2Component led_push_test_component = {
  .fmi2BooleanVars = {
    fmi2False /*booleanExpression1._y*/,
    fmi2False /*booleanExpression2._y*/,
    fmi2False /*digitalReadBoolean1._y*/,
  },
};

#include <math.h>
/* TODO: Generate used builtin functions before SimCode */
static inline double om_mod(double x, double y)
{
  return x-floor(x/y)*y;
}

#include "MDDAVRDigital.h"

static inline fmi2Boolean Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_Digital_read(fmi2Component comp, void* om_port, fmi2Integer om_pin);
static inline void Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_Digital_write(fmi2Component comp, void* om_port, fmi2Integer om_pin, fmi2Boolean om_value);
static inline void* Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_Digital_InitRead_constructor(fmi2Component comp, fmi2Integer om_port, fmi2Integer om_pin);
static inline void Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_Digital_InitRead_destructor(fmi2Component comp, void* om_digital);
static inline void* Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_Digital_InitWrite_constructor(fmi2Component comp, fmi2Integer om_port, fmi2Integer om_pin);
static inline void Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_Digital_InitWrite_destructor(fmi2Component comp, void* om_digital);

static inline fmi2Boolean Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_Digital_read(fmi2Component comp, void* om_port, fmi2Integer om_pin)
{
  fmi2Boolean om_b;
  om_b = MDD_avr_digital_pin_read(om_port, om_pin);
  return om_b;
}
static inline void Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_Digital_write(fmi2Component comp, void* om_port, fmi2Integer om_pin, fmi2Boolean om_value)
{
  MDD_avr_digital_pin_write(om_port, om_pin, om_value);
}
static inline void* Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_Digital_InitRead_constructor(fmi2Component comp, fmi2Integer om_port, fmi2Integer om_pin)
{
  void* om_dig;
  om_dig = MDD_avr_digital_pin_init(om_port, om_pin, fmi2False);
  return om_dig;
}
static inline void Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_Digital_InitRead_destructor(fmi2Component comp, void* om_digital)
{
  MDD_avr_digital_pin_close(om_digital);
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

fmi2Component led_push_test_fmi2Instantiate(fmi2String name, fmi2Type ty, fmi2String GUID, fmi2String resources, const fmi2CallbackFunctions* functions, fmi2Boolean visible, fmi2Boolean loggingOn)
{
  static int initDone=0;
  if (initDone) {
    return NULL;
  }
  return &led_push_test_component;
}

fmi2Status led_push_test_fmi2SetupExperiment(fmi2Component comp, fmi2Boolean toleranceDefined, fmi2Real tolerance, fmi2Real startTime, fmi2Boolean stopTimeDefined, fmi2Real stopTime)
{
  return fmi2OK;
}

fmi2Status led_push_test_fmi2EnterInitializationMode(fmi2Component comp)
{
  comp->extObjs[1] /* digitalWriteBoolean1._digital EXTOBJ: Modelica_DeviceDrivers.EmbeddedTargets.AVR.Functions.Digital.InitWrite */ = Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_Digital_InitWrite_constructor(comp, 2, 3);
  comp->extObjs[0] /* digitalReadBoolean1._digital EXTOBJ: Modelica_DeviceDrivers.EmbeddedTargets.AVR.Functions.Digital.InitRead */ = Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_Digital_InitRead_constructor(comp, 2, 5);
  return fmi2OK;
}

fmi2Status led_push_test_fmi2ExitInitializationMode(fmi2Component comp)
{
  return fmi2OK;
}

static fmi2Status led_push_test_functionODE(fmi2Component comp)
{
}

static fmi2Status led_push_test_functionOutputs(fmi2Component comp)
{
  comp->fmi2BooleanVars[2] /* digitalReadBoolean1._y DISCRETE */ = comp->fmi2BooleanVars[2] /* digitalReadBoolean1._y DISCRETE */;
  comp->fmi2BooleanVars[2] /* digitalReadBoolean1._y DISCRETE */ = Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_Digital_read(comp, comp->extObjs[0] /* digitalReadBoolean1._digital EXTOBJ: Modelica_DeviceDrivers.EmbeddedTargets.AVR.Functions.Digital.InitRead */, 5);Modelica__DeviceDrivers_EmbeddedTargets_AVR_Functions_Digital_write(comp, comp->extObjs[1] /* digitalWriteBoolean1._digital EXTOBJ: Modelica_DeviceDrivers.EmbeddedTargets.AVR.Functions.Digital.InitWrite */, 3, comp->fmi2BooleanVars[2] /* digitalReadBoolean1._y DISCRETE */);
}

fmi2Status led_push_test_fmi2DoStep(fmi2Component comp, fmi2Real currentCommunicationPoint, fmi2Real communicationStepSize, fmi2Boolean noSetFMUStatePriorToCurrentPoint)
{
  comp->currentTime = currentCommunicationPoint;
  /* TODO: Calculate time/state-dependent variables here... */
  led_push_test_functionOutputs(comp);
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

  fmi2Component comp = led_push_test_fmi2Instantiate("", fmi2CoSimulation, "", "", &cbf, fmi2False, fmi2False);
  if (comp==NULL) {
    return 1;
  }
  led_push_test_fmi2SetupExperiment(comp, fmi2False, 0.0, 0.0, fmi2False, 1.0);
  led_push_test_fmi2EnterInitializationMode(comp);
  // Set start-values? Nah...
  led_push_test_fmi2ExitInitializationMode(comp);
  
  double currentTime = 0.0;
  double h = 0.002;
  uint32_t i = 0;
  
  while (status == fmi2OK) {
    //retrieve outputs
      // fmi2GetReal(m, ..., 1, &y1);
    //set inputs
      // fmi2SetReal(m, ..., 1, &y2);
  
    //call slave and check status
    status = led_push_test_fmi2DoStep(comp, currentTime, h, fmi2True);
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

