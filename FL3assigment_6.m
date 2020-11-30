clc; %clear variables
clear;

%establishing known constants
epsilon = 8.854e-12;
ps = 2e-6;
E = 0; %initializing Field to 0. This is 1D as we know electric field will 
%be completely in the z direction vector
h = 1; %distance from origin to observation point from z axis

r_steps = 100;
o_steps = 100; %o = phi

%setting bounds for integration
r_upper = 0.3; 
r_lower = 0.2;
o_upper = pi;
o_lower = 0;
dr = (r_upper-r_lower)/r_steps;
do = (o_upper - o_lower)/o_steps;

for i=1:r_steps  %calculating double integration by doing summation of surface based on r and phi values
    for j=1:o_steps
        r = r_lower + (i*dr);
        o = o_lower + (j*do);
        
        ds = r*dr*do;
        dQ = ps*ds;

        E = E + ((ps*h)/(2*pi*epsilon))*(ds/(r^2+h^2)^(3/2));
    end
end

%display E field in purely Z direction in V/m units
disp(E)