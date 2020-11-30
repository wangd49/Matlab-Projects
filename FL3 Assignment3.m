% speed of light in free space 
c = 299792458; %m/s
%relative permittivity of the medium epsilon_r
epsilon_r = 2; %CHANGE
%phse velocity vp
vp = c/(sqrt(epsilon_r));
%Gaussian Pulse parameters
alpha       = 2*10e8; %CHANGE
A_pulse     = 5;
t_0         = 1;
max_amplitude  = A_pulse*2;
z_step_pulse   = (vp*1e-1)/sqrt(2*alpha);
z_start_pulse  = -(3*vp)/sqrt(2*alpha);
z_end_pulse    =  (3*vp)/sqrt(2*alpha);
z_window_pulse = z_start_pulse:z_step_pulse:z_end_pulse;
z_window_pulse_neg = z_end_pulse:-z_step_pulse:z_start_pulse;
t_step_pulse   = 1e-1*(1/sqrt(2*alpha));
t_window_pulse = t_0- 6/sqrt(2*alpha):t_step_pulse:t_0+6/sqrt(2*alpha);



% harmonic Wave parameters
f = 5*10e7;
lambda = c/f;
omega = 2*pi*f;
beta = omega/vp;
harmonic_step       = 1e-2*lambda;
harmonic_start      = -3*lambda;
harmonic_end        = 3*lambda;
harmonic_window     = harmonic_start:harmonic_step:harmonic_end;
harmonic_window_neg = harmonic_end:-harmonic_step:harmonic_start;
harmonic_window_add = min(harmonic_window,0)+max(harmonic_window_neg,0);
harmonic_t_step     = 1e-2*3/f;
harmonic_t_window   = -3/f:harmonic_t_step:3/f;

%%un comment to view gaussian pulses.
% for T = t_window_pulse
%     figure(1);
%     amplitude1 = gaussian_pulse(A_pulse,alpha,t_0,z_window_pulse,T,vp);
%     amplitude2 = gaussian_pulse(A_pulse,alpha,t_0,z_window_pulse_neg,T,vp);
%     
%     %plot using axes set to fixed ranges
%     subplot(3,1,1)
%     plot(z_window_pulse,amplitude1)
%     axis([z_start_pulse,z_end_pulse,0,max_amplitude])
%     title('Gaussian pulse traveling in +z direction');
%     xlabel('z(m)');
%     ylabel('Amplitude')
%     
%     %plot without setting the axes ranges
%     subplot(3,1,2)
%     plot(z_window_pulse_neg,amplitude1)
%     axis([z_start_pulse,z_end_pulse,0,max_amplitude])
%     title('Gaussian pulse traveling in -z direction');
%     xlabel('z(m)');
%     ylabel('Amplitude')
%     
%     %plot without setting the axes ranges
%     subplot(3,1,3)
%     plot(z_window_pulse_neg,amplitude1+amplitude2)
%     axis([z_start_pulse,z_end_pulse,0,max_amplitude])
%     title('Gaussian pulse Superposition');
%     xlabel('z(m)');
%     ylabel('Amplitude')
%	  pause(1)
% end

%%comment 68-106 to view gaussian pulse
for T = harmonic_t_window
    figure(2);
    harmonic_amplitude_pos = harmonic_wave(A_pulse,omega,T,beta,harmonic_window);
    harmonic_amplitude_neg = harmonic_wave(A_pulse,omega,T,beta,harmonic_window_neg);
    
	% Plot positive direction
    subplot(3,1,1)
    plot(harmonic_window, harmonic_amplitude_pos)
    axis([harmonic_start,harmonic_end,-max_amplitude,max_amplitude])
    title('harmonic wave traveling in +z direction');
    xlabel('z(m)');
    ylabel('Amplitude')
    
	% Plot negative direction
	subplot(3,1,2)
    plot(harmonic_window, harmonic_amplitude_neg)
    axis([harmonic_start,harmonic_end,-max_amplitude,max_amplitude])
    title('harmonic wave traveling in -z direction');
    xlabel('z(m)');
    ylabel('Amplitude')
    
	% Plot superposition 
    subplot(3,1,3)
    plot(harmonic_window_neg, harmonic_amplitude_pos+harmonic_amplitude_neg)
    axis([harmonic_start,harmonic_end,-max_amplitude,max_amplitude])
    title('Superposition of harmonic waves');
    xlabel('z(m)');
    ylabel('Amplitude')
    pause(1)
end
function amplitude = gaussian_pulse(A,alpha,t_0,z,t,vp)
    argument           = -alpha*(t-(z/vp)-t_0).^2;
    amplitude          = A*exp(argument);
end
function harmonic_amplitude = harmonic_wave(A,omega,t,beta,z)
    argument = omega*t + beta*z;    
    harmonic_amplitude = A*sin(argument);
end