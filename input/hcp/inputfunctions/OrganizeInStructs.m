%===============================================================%
% Daniel Hortelano Roig (29/11/2020)
% daniel.hortelanoroig@materials.ox.ac.uk 

% Organizes input variables in structures. These structures are
% not essential to run EasyDD; they are just for organization.
%===============================================================%
%% Storage

% Stores simulation units and scales:
scales = struct(...
    'lengthSI',lengthSI, ...
    'pressureSI',pressureSI, ...
    'dragSI',dragSI, ...
    'timeSI',timeSI, ...
    'velocitySI',velocitySI, ...
    'forceSI',forceSI, ...
    'nodalforceSI',nodalforceSI, ...
    'temperatureSI',temperatureSI, ...
    'amag',amag, ...
    'mumag',mumag ...
    );