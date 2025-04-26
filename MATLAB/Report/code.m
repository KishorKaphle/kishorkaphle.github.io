
close all; clear; clc;

% ==============================================
% Physical Constants from Paper
% ==============================================
v_saw = 3480;               % SAW velocity [m/s] (ZnO/SiO2/Si)
k2 = 0.045;                 % Electromechanical coupling coefficient
epsilon_r = 8.5;            % Relative permittivity
eta = 0.5;                  % Metallization ratio
W = 50e-6;                  % Electrode overlap [m]

% Capacitance calculation (Eq6)
C0 = 2*(6.5*eta^2 + 1.08*eta + 2.37)*(epsilon_r + 1); % [pF/m]

% ==============================================
% Design Parameters (Mobile Transceiver Case)
% ==============================================
f0 = 902e6;                 % Center frequency [Hz]
lambda = v_saw/f0;          % Wavelength [m]
d_c = 100e-6;               % IDT separation [m]
N_in = 30;                  % Input IDT pairs
N_out = 6;                  % Output IDT pairs

% ==============================================
% Frequency Domain Setup
% ==============================================
f = linspace(f0-50e6, f0+50e6, 10000); % Frequency range [Hz]

% ==============================================
% SAW Device Model Implementation
% ==============================================
% Radiation conductance (Eq5)
Ga0 = @(N) 8*k2*f0*(C0*1e-12)*W*N; % Convert C0 to F/m

% Frequency responses (Eq12)
H_in = sinc((f - f0)/f0 * N_in);
H_out = sinc((f - f0)/f0 * N_out);
H_prop = exp(1j*(2*pi/lambda)*d_c); % Propagation term

% Combined response (Eq11)
H_total = H_in .* H_out .* H_prop;

% ==============================================
% Performance Metrics Calculation
% ==============================================
[metrics, bw_points] = computeSAWMetrics(f, abs(H_total).^2);

% ==============================================
% Enhanced Visualization
% ==============================================
figure('Position', [100 100 1200 800], 'Color', 'w');
ax = gca;

% Main response plot
semilogy(f/1e6, abs(H_in).^2, '--', 'Color', [0 0.447 0.741],...
    'LineWidth', 2, 'DisplayName', 'Input IDT');
hold on;
semilogy(f/1e6, abs(H_out).^2, '--', 'Color', [0.85 0.325 0.098],...
    'LineWidth', 2, 'DisplayName', 'Output IDT');
semilogy(f/1e6, abs(H_total).^2, '-', 'Color', [0.466 0.674 0.188],...
    'LineWidth', 3, 'DisplayName', 'Combined Response');

% Bandwidth annotation
fill([bw_points(1)/1e6, bw_points(1)/1e6, bw_points(2)/1e6, bw_points(2)/1e6],...
    [1e-6 1 1 1e-6], [0.9 0.9 0.9], 'EdgeColor', 'none',...
    'DisplayName', '-3 dB Bandwidth');
plot([f0 f0]/1e6, [1e-6 1], 'k:', 'LineWidth', 1.5,...
    'DisplayName', 'Center Frequency');

% Formatting
set(ax, 'YScale', 'log', 'FontSize', 12, 'LineWidth', 1.5,...
    'TickLabelInterpreter', 'latex');
xlabel('Frequency (MHz)', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('Normalized Power', 'Interpreter', 'latex', 'FontSize', 14);
title(sprintf(['SAW Filter Response f_0 = %.1f MHz, '...
    'BW = %.1f MHz, Nidt_Input = %d, Nidt_Output = %d'],...
    f0/1e6, metrics.BW/1e6, N_in, N_out),...
    'Interpreter', 'latex', 'FontSize', 16);
legend('Location', 'southwest', 'Interpreter', 'latex');
grid on;
ylim([1e-3 1.1])

% Metric table
annotation('textbox', [0.6 0.6 0.3 0.3], 'String',...
    sprintf(['Q Factor = %.1f\n'...
    'Insertion Loss = %.2f dB\n'...
    '3-dB BW = %.2f MHz\n'...
    'Shape Factor = %.2f'],...
    metrics.Q, metrics.IL, metrics.BW/1e6, metrics.SF),...
    'Interpreter', 'latex', 'FontSize', 12,...
    'EdgeColor', 'none');

% ==============================================
% Corrected Metrics Calculation Function
% ==============================================
function [metrics, bw_points] = computeSAWMetrics(f, response)
    [max_val, idx] = max(response);
    f0 = f(idx);
    
    % Find -3 dB points
    threshold = max_val/2;
    cross_idx = find(diff(response >= threshold) ~= 0);
    
    if numel(cross_idx) >= 2
        % Handle lower bandwidth point
        idx_low = max(1, cross_idx(1));
        f_segment = f(idx_low:idx_low+1);
        r_segment = response(idx_low:idx_low+1);
        bw_points(1) = interp1(r_segment, f_segment, threshold, 'linear');
        
        % Handle upper bandwidth point
        idx_high = min(length(f)-1, cross_idx(end));
        f_segment = f(idx_high:idx_high+1);
        r_segment = response(idx_high:idx_high+1);
        bw_points(2) = interp1(r_segment, f_segment, threshold, 'linear');
    else
        bw_points = [f(1) f(end)];
    end
    
    % Calculate metrics
    metrics.BW = bw_points(2) - bw_points(1);
    metrics.Q = f0/metrics.BW;
    metrics.IL = 10*log10(max_val);
    
    % Calculate shape factor
    lower_60 = find(response >= max_val/1e6, 1, 'first');
    upper_60 = find(response >= max_val/1e6, 1, 'last');
    metrics.SF = (f(upper_60) - f(lower_60))/metrics.BW;
end

