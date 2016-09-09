files = dir('trigger_*.mat');

for i = 1:length(files)
    f = files(i);
    load(f.name);
    y = zeros(18,length(trigger));
    y(1,:) = (0:length(trigger)-1)./512;
    y(18,:) = trigger;
    y(2:17,:) = randn(16, length(trigger));
    SR = 512;
    name = strcat('data_', f.name(9:end));
    save(strcat('data_', f.name(9:end)), 'y', 'SR'); 
end

clear