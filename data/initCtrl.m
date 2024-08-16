% -------------------------------------------------------------------
%  Generated by MATLAB on 30-Oct-2018 13:33:00
%  MATLAB version: 9.5.0.944444 (R2018b)
% -------------------------------------------------------------------
% Copyright 2018 The MathWorks, Inc.                                        

CRANK_ANGLES = [720 180 360 540];

CRANK_ANGLE_MAX_IGN = 720;

DOWN_TABLE = ...
  [0 5 20 35;
   0 5 20 35;
   0 5 25 40;
   0 5 30 50;
   0 30 50 80;
   0 30 50 80];

DOWN_TH_BP = [0; 0.05; 0.4; 0.5; 0.9; 1];

RPM = Simulink.Signal;
RPM.CoderInfo.StorageClass = 'Auto';
RPM.Description = '';
RPM.DataType = 'double';
RPM.Min = [];
RPM.Max = [];
RPM.DocUnits = '';
RPM.Dimensions = 1;
RPM.DimensionsMode = 'Fixed';
RPM.Complexity = 'real';
RPM.SampleTime = -1;
RPM.InitialValue = '';

TWAIT = 2;

UP_TABLE = ...
  [10 30 50 1.0E+6;
   10 30 50 1.0E+6;
   15 30 50 1.0E+6;
   23 41 60 1.0E+6;
   30 50 100 1.0E+6;
   40 70 100 1.0E+6];

UP_TH_BP = [0; 0.25; 0.35; 0.5; 0.9; 1];

crankAngle = Simulink.Signal;
crankAngle.CoderInfo.StorageClass = 'Auto';
crankAngle.Description = '';
crankAngle.DataType = 'double';
crankAngle.Min = [];
crankAngle.Max = [];
crankAngle.DocUnits = '';
crankAngle.Dimensions = 1;
crankAngle.DimensionsMode = 'Fixed';
crankAngle.Complexity = 'real';
crankAngle.SampleTime = -1;
crankAngle.InitialValue = '';

cruiseRPM = Simulink.Parameter;
cruiseRPM.Value = 1000;
cruiseRPM.CoderInfo.StorageClass = 'Auto';
cruiseRPM.Description = '';
cruiseRPM.DataType = 'auto';
cruiseRPM.Min = [];
cruiseRPM.Max = [];
cruiseRPM.DocUnits = '';

dwellAngle = 5;

eff_tor_rad = 0.4;

enableCruiseControl = Simulink.Parameter;
enableCruiseControl.Value = 0;
enableCruiseControl.CoderInfo.StorageClass = 'Auto';
enableCruiseControl.Description = '';
enableCruiseControl.DataType = 'auto';
enableCruiseControl.Min = [];
enableCruiseControl.Max = [];
enableCruiseControl.DocUnits = '';

engagement_area = 0.0025;

fric_coeff = 0.5;

fullCrankAngle = Simulink.Signal;
fullCrankAngle.CoderInfo.StorageClass = 'Auto';
fullCrankAngle.Description = '';
fullCrankAngle.DataType = 'double';
fullCrankAngle.Min = [];
fullCrankAngle.Max = [];
fullCrankAngle.DocUnits = '';
fullCrankAngle.Dimensions = 1;
fullCrankAngle.DimensionsMode = 'Fixed';
fullCrankAngle.Complexity = 'real';
fullCrankAngle.SampleTime = -1;
fullCrankAngle.InitialValue = '';

idleRPM = 1250;

isECUPowered = Simulink.Signal;
isECUPowered.CoderInfo.StorageClass = 'Auto';
isECUPowered.Description = '';
isECUPowered.DataType = 'boolean';
isECUPowered.Min = [];
isECUPowered.Max = [];
isECUPowered.DocUnits = '';
isECUPowered.Dimensions = 1;
isECUPowered.DimensionsMode = 'Fixed';
isECUPowered.Complexity = 'real';
isECUPowered.SampleTime = -1;
isECUPowered.InitialValue = '';

num_fric_surf = 6;

opCmdBus = Simulink.Bus;
opCmdBus.Description = '';
opCmdBus.DataScope = 'Auto';
opCmdBus.HeaderFile = '';
opCmdBus.Alignment = -1;
saveVarsTmp{1} = Simulink.BusElement;
saveVarsTmp{1}.Name = 'IgnitionKey';
saveVarsTmp{1}.Complexity = 'real';
saveVarsTmp{1}.Dimensions = 1;
saveVarsTmp{1}.DataType = 'boolean';
saveVarsTmp{1}.Min = [];
saveVarsTmp{1}.Max = [];
saveVarsTmp{1}.DimensionsMode = 'Fixed';
saveVarsTmp{1}.SamplingMode = 'Sample based';
saveVarsTmp{1}.SampleTime = -1;
saveVarsTmp{1}.DocUnits = '';
saveVarsTmp{1}.Description = '';
saveVarsTmp{1}(2, 1) = Simulink.BusElement;
saveVarsTmp{1}(2, 1).Name = 'EngageTransmission';
saveVarsTmp{1}(2, 1).Complexity = 'real';
saveVarsTmp{1}(2, 1).Dimensions = 1;
saveVarsTmp{1}(2, 1).DataType = 'boolean';
saveVarsTmp{1}(2, 1).Min = [];
saveVarsTmp{1}(2, 1).Max = [];
saveVarsTmp{1}(2, 1).DimensionsMode = 'Fixed';
saveVarsTmp{1}(2, 1).SamplingMode = 'Sample based';
saveVarsTmp{1}(2, 1).SampleTime = -1;
saveVarsTmp{1}(2, 1).DocUnits = '';
saveVarsTmp{1}(2, 1).Description = '';
saveVarsTmp{1}(3, 1) = Simulink.BusElement;
saveVarsTmp{1}(3, 1).Name = 'Throttle';
saveVarsTmp{1}(3, 1).Complexity = 'real';
saveVarsTmp{1}(3, 1).Dimensions = 1;
saveVarsTmp{1}(3, 1).DataType = 'double';
saveVarsTmp{1}(3, 1).Min = [];
saveVarsTmp{1}(3, 1).Max = [];
saveVarsTmp{1}(3, 1).DimensionsMode = 'Fixed';
saveVarsTmp{1}(3, 1).SamplingMode = 'Sample based';
saveVarsTmp{1}(3, 1).SampleTime = -1;
saveVarsTmp{1}(3, 1).DocUnits = '';
saveVarsTmp{1}(3, 1).Description = '';
opCmdBus.Elements = saveVarsTmp{1};
clear saveVarsTmp;

p0 = 2.0E+6;

peak_normal = 0.55;

pressThresh = 0.05;

rev = Simulink.Signal;
rev.CoderInfo.StorageClass = 'Auto';
rev.Description = '';
rev.DataType = 'boolean';
rev.Min = [];
rev.Max = [];
rev.DocUnits = '';
rev.Dimensions = 1;
rev.DimensionsMode = 'Fixed';
rev.Complexity = 'real';
rev.SampleTime = -1;
rev.InitialValue = '';

timerBus = Simulink.Bus;
timerBus.Description = '';
timerBus.DataScope = 'Auto';
timerBus.HeaderFile = '';
timerBus.Alignment = -1;
saveVarsTmp{1} = Simulink.BusElement;
saveVarsTmp{1}.Name = 'cyl';
saveVarsTmp{1}.Complexity = 'real';
saveVarsTmp{1}.Dimensions = 1;
saveVarsTmp{1}.DataType = 'double';
saveVarsTmp{1}.Min = [];
saveVarsTmp{1}.Max = [];
saveVarsTmp{1}.DimensionsMode = 'Fixed';
saveVarsTmp{1}.SamplingMode = 'Sample based';
saveVarsTmp{1}.SampleTime = -1;
saveVarsTmp{1}.DocUnits = '';
saveVarsTmp{1}.Description = '';
saveVarsTmp{1}(2, 1) = Simulink.BusElement;
saveVarsTmp{1}(2, 1).Name = 'timeout';
saveVarsTmp{1}(2, 1).Complexity = 'real';
saveVarsTmp{1}(2, 1).Dimensions = 1;
saveVarsTmp{1}(2, 1).DataType = 'double';
saveVarsTmp{1}(2, 1).Min = [];
saveVarsTmp{1}(2, 1).Max = [];
saveVarsTmp{1}(2, 1).DimensionsMode = 'Fixed';
saveVarsTmp{1}(2, 1).SamplingMode = 'Sample based';
saveVarsTmp{1}(2, 1).SampleTime = -1;
saveVarsTmp{1}(2, 1).DocUnits = '';
saveVarsTmp{1}(2, 1).Description = '';
saveVarsTmp{1}(3, 1) = Simulink.BusElement;
saveVarsTmp{1}(3, 1).Name = 'duration';
saveVarsTmp{1}(3, 1).Complexity = 'real';
saveVarsTmp{1}(3, 1).Dimensions = 1;
saveVarsTmp{1}(3, 1).DataType = 'double';
saveVarsTmp{1}(3, 1).Min = [];
saveVarsTmp{1}(3, 1).Max = [];
saveVarsTmp{1}(3, 1).DimensionsMode = 'Fixed';
saveVarsTmp{1}(3, 1).SamplingMode = 'Sample based';
saveVarsTmp{1}(3, 1).SampleTime = -1;
saveVarsTmp{1}(3, 1).DocUnits = '';
saveVarsTmp{1}(3, 1).Description = '';
timerBus.Elements = saveVarsTmp{1};
clear saveVarsTmp;

totalRevs = Simulink.Signal;
totalRevs.CoderInfo.StorageClass = 'Auto';
totalRevs.Description = '';
totalRevs.DataType = 'double';
totalRevs.Min = [];
totalRevs.Max = [];
totalRevs.DocUnits = '';
totalRevs.Dimensions = 1;
totalRevs.DimensionsMode = 'Fixed';
totalRevs.Complexity = 'real';
totalRevs.SampleTime = -1;
totalRevs.InitialValue = '';

velTol = 0.001;

