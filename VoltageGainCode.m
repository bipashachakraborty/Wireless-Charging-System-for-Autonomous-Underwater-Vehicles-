clear; clc;

%Paramesters Assumed
Lr = 72e-6;         
Lm = 360e-6;        
Cr = 32e-9;         

%Calculating K
K = Lm / Lr;
x = linspace(0, 10, 1000);

%Define Q values
Q_values = [0.2, 0.3, 0.4, 0.5, 0.6];

%Initialize figure
figure;
hold on;

colors = lines(length(Q_values));

for i = 1:length(Q_values)
    Q = Q_values(i);
    
    %Compute gain
    M = 1 ./ sqrt(((1/K) .* (1 + K - (1 ./ x).^2)).^2 + (Q .* (x - 1 ./ x)).^2);
    
    plot(x, M, 'LineWidth', 1.8, 'DisplayName', ['Q = ' num2str(Q)], 'Color', colors(i,:));
end

%Reference 
yline(0.911, 'k--', '0.911', 'LabelHorizontalAlignment', 'left');
yline(1.09, 'k--', '1.09', 'LabelHorizontalAlignment', 'left');

%Labels
xlabel('\omega_n = \omega_s / \omega_r (Normalized Frequency)');
ylabel('Voltage Gain, M(\omega_n)');
title('Voltage Gain Curves of Full-Bridge LLC Resonant Converter');
legend show;
grid on;
xlim([0 2]);
ylim([0 2]);