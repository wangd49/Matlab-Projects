%%DAVID WANG 400073796


%%initial values
z0 = 50; 
l = 0.0906;
Rs = z0;
Ls = 1e-9;
Cs = 1.8e-12;

%%frequency range
frange = 1e9:5e6:5e9;

%%matrices storing graph values
Rin = zeros(size(frange));
Xin = zeros(size(frange));
SWR = zeros(size(frange));
index = 1;

%%calculating requested values
for f = frange
    zL = 1i*(2*pi*f*Ls); %%inductor impedance
    zC = (1/(2*pi*f*Cs*1i)); %%capacitor impedance
    zload = Rs + zL + zC;  %%a) ZLoad
    B = (2*pi*f)/299792458; %%beta
    zin = z0 * ((zload + 1i*z0*tan(B*l))/(z0 + 1i*zload*tan(B*l)));%%b) Zin
    refcoef = (zload - z0) / (zload + z0); %%c)reflection coefficient 
    swr = (1+abs(refcoef))/(1-abs(refcoef));%%d) SWR
    Rin(index) = real(zin);
    Xin(index) = imag(zin);
    SWR(index) = swr;
    index = index + 1;
end

%%graphs in respect of frequency range
figure(1);
set(gcf, 'Position',  [100, 100, 1000, 280])
subplot(1,3,1)
plot(frange, Rin)
title('R{in} vs Frequency');
xlabel('Frequency (Hz)');
ylabel('Resistance (ohms)');
subplot(1,3,2)
plot(frange, Xin)
title('X{in} vs Frequency');
xlabel('Frequency (Hz)');
ylabel('Resistance (ohms)');
subplot(1,3,3)
plot(frange, SWR)
title('SWR vs Frequency');
xlabel('Frequency (Hz)');
ylabel('SWR');