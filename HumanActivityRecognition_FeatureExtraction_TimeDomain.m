clear
clc
close all
%% Loading Data
Path = 'C:\Users\dhars\Documents\Product Development\SP2\DataScience\Exploratory data analysis in product development lecture materials HT24\DataSet.mat';
DataSet = load(Path);
DataSet = DataSet.DataSet;
%% Rearranging the Data according to the classes
% Initialize variables for each activity
AX_Jogging = []; AX_Sitting = []; AX_Walking = []; AX_Downstairs = []; AX_Upstairs = []; AX_Standing = [];
AY_Jogging = []; AY_Sitting = []; AY_Walking = []; AY_Downstairs = []; AY_Upstairs = []; AY_Standing = [];
AZ_Jogging = []; AZ_Sitting = []; AZ_Walking = []; AZ_Downstairs = []; AZ_Upstairs = []; AZ_Standing = [];
for ii = 1:36
time_Jogging = DataSet(ii).Jogging.time;
if ~isempty(time_Jogging)
% Spliting
[time, order] = sort(time_Jogging,'ascend');
ZerosIdx = find(time == 0);
order = setdiff(order, ZerosIdx);
time = time(order);
%%%%
AX = DataSet(ii).Jogging.AX;
AX = AX(order);
AX_Jogging = [AX_Jogging;AX];
%%%%
AY = DataSet(ii).Jogging.AY;
AY = AY(order);
AY_Jogging = [AY_Jogging;AY];
%%%%
AZ = DataSet(ii).Jogging.AZ;
AZ = AZ(order);
AZ_Jogging = [AZ_Jogging;AZ];
end
AMag_Jogging = (AX_Jogging.^2+ AY_Jogging.^2+ AZ_Jogging.^2).^.5;
time_Walking = DataSet(ii).Walking.time;
if ~isempty(time_Walking)
% Spliting
[time, order] = sort(time_Walking,'ascend');
ZerosIdx = find(time == 0);
order = setdiff(order, ZerosIdx);
time = time(order);
%%%%
AX = DataSet(ii).Walking.AX;
AX = AX(order);
AX_Walking = [AX_Walking;AX];
%%%%
AY = DataSet(ii).Walking.AY;
AY = AY(order);
AY_Walking = [AY_Walking;AY];
%%%%
AZ = DataSet(ii).Walking.AZ;
AZ = AZ(order);
AZ_Walking = [AZ_Walking;AZ];
end
AMag_Walking = (AX_Walking.^2+ AY_Walking.^2+ AZ_Walking.^2).^.5;
time_Downstairs = DataSet(ii).Downstairs.time;
if ~isempty(time_Downstairs)
% Spliting
[time, order] = sort(time_Downstairs,'ascend');
ZerosIdx = find(time == 0);
order = setdiff(order, ZerosIdx);
time = time(order);
%%%%
AX = DataSet(ii).Downstairs.AX;
AX = AX(order);
AX_Downstairs = [AX_Downstairs;AX];
%%%%
AY = DataSet(ii).Downstairs.AY;
AY = AY(order);
AY_Downstairs = [AY_Downstairs;AY];
%%%%
AZ = DataSet(ii).Downstairs.AZ;
AZ = AZ(order);
AZ_Downstairs = [AZ_Downstairs;AZ];
end
AMag_Downstairs = (AX_Downstairs.^2+ AY_Downstairs.^2+ AZ_Downstairs.^2).^.5;
time_Upstairs = DataSet(ii).Upstairs.time;
if ~isempty(time_Upstairs)
% Spliting
[time, order] = sort(time_Upstairs,'ascend');
ZerosIdx = find(time == 0);
order = setdiff(order, ZerosIdx);
time = time(order);
%%%%
AX = DataSet(ii).Upstairs.AX;
AX = AX(order);
AX_Upstairs = [AX_Upstairs;AX];
%%%%
AY = DataSet(ii).Upstairs.AY;
AY = AY(order);
AY_Upstairs = [AY_Upstairs;AY];
%%%%
AZ = DataSet(ii).Upstairs.AZ;
AZ = AZ(order);
AZ_Upstairs = [AZ_Upstairs;AZ];
end
AMag_Upstairs = (AX_Upstairs.^2+ AY_Upstairs.^2+ AZ_Upstairs.^2).^.5;
time_Standing = DataSet(ii).Standing.time;
if ~isempty(time_Standing)
% Spliting
[time, order] = sort(time_Standing,'ascend');
ZerosIdx = find(time == 0);
order = setdiff(order, ZerosIdx);
time = time(order);
%%%%
AX = DataSet(ii).Standing.AX;
AX = AX(order);
AX_Standing = [AX_Standing;AX];
%%%%
AY = DataSet(ii).Standing.AY;
AY = AY(order);
AY_Standing = [AY_Standing;AY];
%%%%
AZ = DataSet(ii).Standing.AZ;
AZ = AZ(order);
AZ_Standing = [AZ_Standing;AZ];
end
AMag_Standing = (AX_Standing.^2+ AY_Standing.^2+ AZ_Standing.^2).^.5;
time_Sitting = DataSet(ii).Sitting.time;
if ~isempty(time_Sitting)
% Spliting
[time, order] = sort(time_Sitting,'ascend');
ZerosIdx = find(time == 0);
order = setdiff(order, ZerosIdx);
time = time(order);
%%%%
AX = DataSet(ii).Sitting.AX;
AX = AX(order);
AX_Sitting = [AX_Sitting;AX];
%%%%
AY = DataSet(ii).Sitting.AY;
AY = AY(order);
AY_Sitting = [AY_Sitting;AY];
%%%%
AZ = DataSet(ii).Sitting.AZ;
AZ = AZ(order);
AZ_Sitting = [AZ_Sitting;AZ];
end
AMag_Sitting = (AX_Sitting.^2+ AY_Sitting.^2+ AZ_Sitting.^2).^.5;
end
%% Transfering Data into Frequency Domain
% Windowing
N_Jogging = length(AX_Jogging);
N_Standing = length(AX_Standing);
N_Sitting = length(AX_Sitting);
N_Downstairs = length(AX_Downstairs);
N_Upstairs = length(AX_Upstairs);
N_Walking = length(AX_Walking);
Window_Size = 1000;
Step_Size = 500;
FAX_Jogging_Windowing = []; FAX_Sitting_Windowing = []; FAX_Standing_Windowing = [];
FAX_Walking_Windowing = []; FAX_Downstairs_Windowing = []; FAX_Upstairs_Windowing = [];
FAY_Jogging_Windowing = []; FAY_Sitting_Windowing = []; FAY_Standing_Windowing = [];
FAY_Walking_Windowing = []; FAY_Downstairs_Windowing = []; FAY_Upstairs_Windowing = [];
FAZ_Jogging_Windowing = []; FAZ_Sitting_Windowing = []; FAZ_Standing_Windowing = [];
FAZ_Walking_Windowing = []; FAZ_Downstairs_Windowing = []; FAZ_Upstairs_Windowing = [];
FAMag_Jogging_Windowing = []; FAMag_Sitting_Windowing = [];
FAMag_Standing_Windowing = [];
FAMag_Walking_Windowing = []; FAMag_Downstairs_Windowing = [];
FAMag_Upstairs_Windowing = [];
Label_Jogging_Windowing = []; Label_Sitting_Windowing = [];
Label_Standing_Windowing = [];
Label_Walking_Windowing = []; Label_Downstairs_Windowing = [];
Label_Upstairs_Windowing = [];
T = 20;
Freq_Treshold =1;
for i = 1:Step_Size:N_Jogging-Window_Size
AX = AX_Jogging(i: i + Window_Size);
FAX = fft(AX'); FAX = abs(FAX);
L = length(FAX);
FAX = FAX(1:L/2+1);
Freq_AX_Jogging = L/T*[0:L/2]/L;
% Low Pass Filter
idx = find(Freq_AX_Jogging>=Freq_Treshold);
Freq_AX_Jogging = Freq_AX_Jogging(idx);
FAX = FAX(idx);
FAX_Jogging_Windowing = [FAX_Jogging_Windowing; FAX];
AY = AY_Jogging(i: i + Window_Size);
FAY = fft(AY'); FAY = abs(FAY);
FAY = FAY(1:L/2+1);
Freq_AY_Jogging = Freq_AX_Jogging;
% Low Pass Filter
FAY = FAY(idx);
FAY_Jogging_Windowing = [FAY_Jogging_Windowing; FAY];
AZ = AZ_Jogging(i: i + Window_Size);
FAZ = fft(AZ'); FAZ = abs(FAZ);
FAZ = FAZ(1:L/2+1);
Freq_AZ_Jogging = Freq_AX_Jogging;
% Low Pass Filter
FAZ = FAZ(idx);
FAZ_Jogging_Windowing = [FAZ_Jogging_Windowing; FAZ];
AMag = AMag_Jogging(i: i + Window_Size);
FAMag = fft(AMag'); FAMag = abs(FAMag);
FAMag = FAMag(1:L/2+1);
Freq_AMag_Jogging = Freq_AX_Jogging;
% Low Pass Filter
FAMag = FAMag(idx);
FAMag_Jogging_Windowing = [FAMag_Jogging_Windowing; FAMag];
%Label_Jogging_Windowing = [Label_Jogging_Windowing 'Jogging'];
Label_Jogging_Windowing = [Label_Jogging_Windowing 1];
end
Label_Jogging_Windowing = Label_Jogging_Windowing(1:size(FAX_Jogging_Windowing,1));
for i = 1:Step_Size:N_Walking-Window_Size
AX = AX_Walking(i: i + Window_Size);
FAX = fft(AX'); FAX = abs(FAX);
L = length(FAX);
FAX = FAX(1:L/2+1);
Freq_AX_Walking = L/T*[0:L/2]/L;
% Low Pass Filter
idx = find(Freq_AX_Walking>=Freq_Treshold);
Freq_AX_Walking = Freq_AX_Walking(idx);
FAX = FAX(idx);
FAX_Walking_Windowing = [FAX_Walking_Windowing; FAX];
AY = AY_Walking(i: i + Window_Size);
FAY = fft(AY'); FAY = abs(FAY);
FAY = FAY(1:L/2+1);
Freq_AY_Walking = Freq_AX_Walking;
% Low Pass Filter
FAY = FAY(idx);
FAY_Walking_Windowing = [FAY_Walking_Windowing; FAY];
AZ = AZ_Walking(i: i + Window_Size);
FAZ = fft(AZ'); FAZ = abs(FAZ);
FAZ = FAZ(1:L/2+1);
Freq_AZ_Walking = Freq_AX_Walking;
% Low Pass Filter
FAZ = FAZ(idx);
FAZ_Walking_Windowing = [FAZ_Walking_Windowing; FAZ];
AMag = AMag_Walking(i: i + Window_Size);
FAMag = fft(AMag'); FAMag = abs(FAMag);
FAMag = FAMag(1:L/2+1);
Freq_AMag_Walking = Freq_AX_Walking;
% Low Pass Filter
FAMag = FAMag(idx);
FAMag_Walking_Windowing = [FAMag_Walking_Windowing; FAMag];
% Label_Walking_Windowing = [Label_Walking_Windowing 'Walking'];
Label_Walking_Windowing = [Label_Walking_Windowing 2];
end
Label_Walking_Windowing = Label_Walking_Windowing(1:size(FAX_Walking_Windowing,1));
for i = 1:Step_Size:N_Standing-Window_Size
AX = AX_Standing(i: i + Window_Size);
FAX = fft(AX'); FAX = abs(FAX);
L = length(FAX);
FAX = FAX(1:L/2+1);
Freq_AX_Standing = L/T*[0:L/2]/L;
% Low Pass Filter
idx = find(Freq_AX_Standing>=Freq_Treshold);
Freq_AX_Standing = Freq_AX_Standing(idx);
FAX = FAX(idx);
FAX_Standing_Windowing = [FAX_Standing_Windowing; FAX];
AY = AY_Standing(i: i + Window_Size);
FAY = fft(AY'); FAY = abs(FAY);
FAY = FAY(1:L/2+1);
Freq_AY_Standing = Freq_AX_Standing;
% Low Pass Filter
FAY = FAY(idx);
FAY_Standing_Windowing = [FAY_Standing_Windowing; FAY];
AZ = AZ_Standing(i: i + Window_Size);
FAZ = fft(AZ'); FAZ = abs(FAZ);
FAZ = FAZ(1:L/2+1);
Freq_AZ_Standing = Freq_AX_Standing;
% Low Pass Filter
FAZ = FAZ(idx);
FAZ_Standing_Windowing = [FAZ_Standing_Windowing; FAZ];
AMag = AMag_Standing(i: i + Window_Size);
FAMag = fft(AMag'); FAMag = abs(FAMag);
FAMag = FAMag(1:L/2+1);
Freq_AMag_Standing = Freq_AX_Standing;
% Low Pass Filter
FAMag = FAMag(idx);
FAMag_Standing_Windowing = [FAMag_Standing_Windowing; FAMag];
% Label_Standing_Windowing = [Label_Standing_Windowing 'Standing'];
Label_Standing_Windowing = [Label_Standing_Windowing 3];
end
Label_Standing_Windowing = Label_Standing_Windowing(1:size(FAX_Standing_Windowing,1));
for i = 1:Step_Size:N_Sitting-Window_Size
AX = AX_Sitting(i: i + Window_Size);
FAX = fft(AX'); FAX = abs(FAX);
L = length(FAX);
FAX = FAX(1:L/2+1);
Freq_AX_Sitting = L/T*[0:L/2]/L;
% Low Pass Filter
idx = find(Freq_AX_Sitting>=Freq_Treshold);
Freq_AX_Sitting = Freq_AX_Sitting(idx);
FAX = FAX(idx);
FAX_Sitting_Windowing = [FAX_Sitting_Windowing; FAX];
AY = AY_Sitting(i: i + Window_Size);
FAY = fft(AY'); FAY = abs(FAY);
FAY = FAY(1:L/2+1);
Freq_AY_Sitting = Freq_AX_Sitting;
% Low Pass Filter
FAY = FAY(idx);
FAY_Sitting_Windowing = [FAY_Sitting_Windowing; FAY];
AZ = AZ_Sitting(i: i + Window_Size);
FAZ = fft(AZ'); FAZ = abs(FAZ);
FAZ = FAZ(1:L/2+1);
Freq_AZ_Sitting = Freq_AX_Sitting;
% Low Pass Filter
FAZ = FAZ(idx);
FAZ_Sitting_Windowing = [FAZ_Sitting_Windowing; FAZ];
AMag = AMag_Sitting(i: i + Window_Size);
FAMag = fft(AMag'); FAMag = abs(FAMag);
FAMag = FAMag(1:L/2+1);
Freq_AMag_Sitting = Freq_AX_Sitting;
% Low Pass Filter
FAMag = FAMag(idx);
FAMag_Sitting_Windowing = [FAMag_Sitting_Windowing; FAMag];
% Label_Sitting_Windowing = [Label_Sitting_Windowing 'Sitting'];
Label_Sitting_Windowing = [Label_Sitting_Windowing 4];
end
Label_Sitting_Windowing = Label_Sitting_Windowing(1:size(FAX_Sitting_Windowing,1));
for i = 1:Step_Size:N_Downstairs-Window_Size
AX = AX_Downstairs(i: i + Window_Size);
FAX = fft(AX'); FAX = abs(FAX);
L = length(FAX);
FAX = FAX(1:L/2+1);
Freq_AX_Downstairs = L/T*[0:L/2]/L;
% Low Pass Filter
idx = find(Freq_AX_Downstairs>=Freq_Treshold);
Freq_AX_Downstairs = Freq_AX_Downstairs(idx);
FAX = FAX(idx);
FAX_Downstairs_Windowing = [FAX_Downstairs_Windowing; FAX];
AY = AY_Downstairs(i: i + Window_Size);
FAY = fft(AY'); FAY = abs(FAY);
FAY = FAY(1:L/2+1);
Freq_AY_Downstairs = Freq_AX_Downstairs;
% Low Pass Filter
FAY = FAY(idx);
FAY_Downstairs_Windowing = [FAY_Downstairs_Windowing; FAY];
AZ = AZ_Downstairs(i: i + Window_Size);
FAZ = fft(AZ'); FAZ = abs(FAZ);
FAZ = FAZ(1:L/2+1);
Freq_AZ_Downstairs = Freq_AX_Downstairs;
% Low Pass Filter
FAZ = FAZ(idx);
FAZ_Downstairs_Windowing = [FAZ_Downstairs_Windowing; FAZ];
AMag = AMag_Downstairs(i: i + Window_Size);
FAMag = fft(AMag'); FAMag = abs(FAMag);
FAMag = FAMag(1:L/2+1);
Freq_AMag_Downstairs = Freq_AX_Downstairs;
% Low Pass Filter
FAMag = FAMag(idx);
FAMag_Downstairs_Windowing = [FAMag_Downstairs_Windowing; FAMag];
% Label_Downstairs_Windowing = [Label_Downstairs_Windowing 'Downstairs'];
Label_Downstairs_Windowing = [Label_Downstairs_Windowing 5];
end
Label_Downstairs_Windowing = Label_Downstairs_Windowing(1:size(FAX_Downstairs_Windowing,1));
for i = 1:Step_Size:N_Upstairs-Window_Size
AX = AX_Upstairs(i: i + Window_Size);
FAX = fft(AX'); FAX = abs(FAX);
L = length(FAX);
FAX = FAX(1:L/2+1);
Freq_AX_Upstairs = L/T*[0:L/2]/L;
% Low Pass Filter
idx = find(Freq_AX_Upstairs>=Freq_Treshold);
Freq_AX_Upstairs = Freq_AX_Upstairs(idx);
FAX = FAX(idx);
FAX_Upstairs_Windowing = [FAX_Upstairs_Windowing; FAX];
AY = AY_Upstairs(i: i + Window_Size);
FAY = fft(AY'); FAY = abs(FAY);
FAY = FAY(1:L/2+1);
Freq_AY_Upstairs = Freq_AX_Upstairs;
% Low Pass Filter
FAY = FAY(idx);
FAY_Upstairs_Windowing = [FAY_Upstairs_Windowing; FAY];
AZ = AZ_Upstairs(i: i + Window_Size);
FAZ = fft(AZ'); FAZ = abs(FAZ);
FAZ = FAZ(1:L/2+1);
Freq_AZ_Upstairs = Freq_AX_Upstairs;
% Low Pass Filter
FAZ = FAZ(idx);
FAZ_Upstairs_Windowing = [FAZ_Upstairs_Windowing; FAZ];
AMag = AMag_Upstairs(i: i + Window_Size);
FAMag = fft(AMag'); FAMag = abs(FAMag);
FAMag = FAMag(1:L/2+1);
Freq_AMag_Upstairs = Freq_AX_Upstairs;
% Low Pass Filter
FAMag = FAMag(idx);
FAMag_Upstairs_Windowing = [FAMag_Upstairs_Windowing; FAMag];
% Label_Upstairs_Windowing = [Label_Upstairs_Windowing 'Upstairs'];
Label_Upstairs_Windowing = [Label_Upstairs_Windowing 6];
end
Label_Upstairs_Windowing = Label_Upstairs_Windowing(1:size(FAX_Upstairs_Windowing,1));
fftX = [FAX_Jogging_Windowing; FAX_Standing_Windowing; FAX_Sitting_Windowing;
FAX_Walking_Windowing;FAX_Downstairs_Windowing;FAX_Upstairs_Windowing];
fftY = [FAY_Jogging_Windowing; FAY_Standing_Windowing; FAY_Sitting_Windowing;
FAY_Walking_Windowing;FAY_Downstairs_Windowing;FAY_Upstairs_Windowing];
fftZ = [FAZ_Jogging_Windowing; FAZ_Standing_Windowing; FAZ_Sitting_Windowing;
FAZ_Walking_Windowing;FAZ_Downstairs_Windowing;FAZ_Upstairs_Windowing];
fftM = [FAMag_Jogging_Windowing; FAMag_Standing_Windowing; FAMag_Sitting_Windowing;
FAMag_Walking_Windowing;FAMag_Downstairs_Windowing;FAMag_Upstairs_Windowing];
%% Statistical Features: Your Assignment :)
% Mean
Mean_FAX_Jogging = mean(FAX_Jogging_Windowing,2); Mean_FAY_Jogging = mean(FAY_Jogging_Windowing,2); Mean_FAZ_Jogging = mean(FAZ_Jogging_Windowing,2);
Mean_FAMag_Jogging=mean(FAMag_Jogging_Windowing,2);
Mean_FAX_Standing = mean(FAX_Standing_Windowing,2); Mean_FAY_Standing = mean(FAY_Standing_Windowing,2); Mean_FAZ_Standing = mean(FAZ_Standing_Windowing,2);
Mean_FAMag_Standing=mean(FAMag_Standing_Windowing,2);
Mean_FAX_Sitting = mean(FAX_Sitting_Windowing,2); Mean_FAY_Sitting = mean(FAY_Sitting_Windowing,2); Mean_FAZ_Sitting = mean(FAZ_Sitting_Windowing,2);
Mean_FAMag_Sitting=mean(FAMag_Sitting_Windowing,2);
Mean_FAX_Walking = mean(FAX_Walking_Windowing,2); Mean_FAY_Walking = mean(FAY_Walking_Windowing,2); Mean_FAZ_Walking = mean(FAZ_Walking_Windowing,2);
Mean_FAMag_Walking=mean(FAMag_Walking_Windowing,2);
Mean_FAX_Downstairs = mean(FAX_Downstairs_Windowing,2); Mean_FAY_Downstairs = mean(FAY_Downstairs_Windowing,2); Mean_FAZ_Downstairs = mean(FAZ_Downstairs_Windowing,2);
Mean_FAMag_Downstairs=mean(FAMag_Downstairs_Windowing,2);
Mean_FAX_Upstairs = mean(FAX_Upstairs_Windowing,2); Mean_FAY_Upstairs = mean(FAY_Upstairs_Windowing,2); Mean_FAZ_Upstairs = mean(FAZ_Upstairs_Windowing,2);
Mean_FAMag_Upstairs=mean(FAMag_Upstairs_Windowing,2);
MeanX = [Mean_FAX_Jogging; Mean_FAX_Standing; Mean_FAX_Sitting;
Mean_FAX_Walking;Mean_FAX_Downstairs;Mean_FAX_Upstairs];
MeanY = [Mean_FAY_Jogging; Mean_FAY_Standing; Mean_FAY_Sitting;
Mean_FAY_Walking;Mean_FAY_Downstairs;Mean_FAY_Upstairs];
MeanZ = [Mean_FAZ_Jogging; Mean_FAZ_Standing; Mean_FAZ_Sitting;
Mean_FAZ_Walking;Mean_FAZ_Downstairs;Mean_FAZ_Upstairs];
MeanM = [Mean_FAMag_Jogging; Mean_FAMag_Standing; Mean_FAMag_Sitting;
Mean_FAMag_Walking;Mean_FAMag_Downstairs;Mean_FAMag_Upstairs];
% Standard deviation
std_FAX_Jogging = std(FAX_Jogging_Windowing')'; std_FAY_Jogging = std(FAY_Jogging_Windowing')'; std_FAZ_Jogging = std(FAZ_Jogging_Windowing')';
std_FAMag_Jogging = std(FAMag_Jogging_Windowing')';
std_FAX_Standing = std(FAX_Standing_Windowing')'; std_FAY_Standing = std(FAY_Standing_Windowing')'; std_FAZ_Standing = std(FAZ_Standing_Windowing')';
std_FAMag_Standing = std(FAMag_Standing_Windowing')';
std_FAX_Sitting = std(FAX_Sitting_Windowing')'; std_FAY_Sitting = std(FAY_Sitting_Windowing')'; std_FAZ_Sitting = std(FAZ_Sitting_Windowing')';
std_FAMag_Sitting = std(FAMag_Sitting_Windowing')';
std_FAX_Walking = std(FAX_Walking_Windowing')'; std_FAY_Walking = std(FAY_Walking_Windowing')'; std_FAZ_Walking = std(FAZ_Walking_Windowing')';
std_FAMag_Walking = std(FAMag_Walking_Windowing')';
std_FAX_Downstairs = std(FAX_Downstairs_Windowing')'; std_FAY_Downstairs = std(FAY_Downstairs_Windowing')'; std_FAZ_Downstairs = std(FAZ_Downstairs_Windowing')'; std_FAMag_Downstairs = std(FAMag_Downstairs_Windowing')';
std_FAX_Upstairs = std(FAX_Upstairs_Windowing')'; std_FAY_Upstairs = std(FAY_Upstairs_Windowing')'; std_FAZ_Upstairs = std(FAZ_Upstairs_Windowing')';
std_FAMag_Upstairs = std(FAMag_Upstairs_Windowing')';
stdX = [std_FAX_Jogging; std_FAX_Standing; std_FAX_Sitting;
std_FAX_Walking;std_FAX_Downstairs;std_FAX_Upstairs];
stdY = [std_FAY_Jogging; std_FAY_Standing; std_FAY_Sitting;
std_FAY_Walking;std_FAY_Downstairs;std_FAY_Upstairs];
stdZ = [std_FAZ_Jogging; std_FAZ_Standing; std_FAZ_Sitting;
std_FAZ_Walking;std_FAZ_Downstairs;std_FAZ_Upstairs];
stdM = [std_FAMag_Jogging; std_FAMag_Standing; std_FAMag_Sitting;
std_FAMag_Walking; std_FAMag_Downstairs; std_FAMag_Upstairs];
% median
median_FAX_Jogging = median(FAX_Jogging_Windowing,2); median_FAY_Jogging = median(FAY_Jogging_Windowing,2); 
median_FAZ_Jogging = median(FAZ_Jogging_Windowing,2); 
median_FAMag_Jogging = median(FAMag_Jogging_Windowing,2);
median_FAX_Standing = median(FAX_Standing_Windowing,2);
median_FAY_Standing = median(FAY_Standing_Windowing,2);
median_FAZ_Standing = median(FAZ_Standing_Windowing,2); 
median_FAMag_Standing = median(FAMag_Standing_Windowing,2);
median_FAX_Sitting = median(FAX_Sitting_Windowing,2); 
median_FAY_Sitting = median(FAY_Sitting_Windowing,2); 
median_FAZ_Sitting = median(FAZ_Sitting_Windowing,2); 
median_FAMag_Sitting = median(FAMag_Sitting_Windowing,2);
median_FAX_Walking = median(FAX_Walking_Windowing,2); 
median_FAY_Walking = median(FAY_Walking_Windowing,2); 
median_FAZ_Walking = median(FAZ_Walking_Windowing,2); 
median_FAMag_Walking = median(FAMag_Walking_Windowing,2);
median_FAX_Downstairs = median(FAX_Downstairs_Windowing,2); 
median_FAY_Downstairs = median(FAY_Downstairs_Windowing,2); 
median_FAZ_Downstairs = median(FAZ_Downstairs_Windowing,2); 
median_FAMag_Downstairs = median(FAMag_Downstairs_Windowing,2);
median_FAX_Upstairs = median(FAX_Upstairs_Windowing,2); 
median_FAY_Upstairs = median(FAY_Upstairs_Windowing,2); 
median_FAZ_Upstairs = median(FAZ_Upstairs_Windowing,2);
median_FAMag_Upstairs = median(FAMag_Upstairs_Windowing,2);
medX = [median_FAX_Jogging; median_FAX_Standing; median_FAX_Sitting;
median_FAX_Walking;median_FAX_Downstairs;median_FAX_Upstairs];
medY = [median_FAY_Jogging; median_FAY_Standing; median_FAY_Sitting;
median_FAY_Walking;median_FAY_Downstairs;median_FAY_Upstairs];
medZ = [median_FAZ_Jogging; median_FAZ_Standing; median_FAZ_Sitting;
median_FAZ_Walking;median_FAZ_Downstairs;median_FAZ_Upstairs];
medM = [median_FAMag_Jogging; median_FAMag_Standing; median_FAMag_Sitting;
median_FAMag_Walking;median_FAMag_Downstairs;median_FAMag_Upstairs];
Features = [MeanX, MeanY, MeanZ, MeanM,stdX, stdY, stdZ, stdM, medX,medY, medZ,medM];
% Displaying Mean values
disp('Mean Features:');
disp('-------------------------');
disp('MeanX:');
disp(MeanX);
disp('MeanY:');
disp(MeanY);
disp('MeanZ:');
disp(MeanZ);
disp('MeanM:');
disp(MeanM);
% Displaying Standard Deviation values
disp('-------------------------');
disp('Standard Deviation Features:');
disp('-------------------------');
disp('stdX:');
disp(stdX);
disp('stdY:');
disp(stdY);
disp('stdZ:');
disp(stdZ);
disp('stdM:');
disp(stdM);
% Displaying Median values
disp('-------------------------');
disp('Median Features:');
disp('-------------------------');
disp('medX:');
disp(medX);
disp('medY:');
disp(medY);
disp('medZ:');
disp(medZ);
disp('medM:');
disp(medM);
%% Other Features in Frequency Domain
%% Plots: your Assignment :)
% Heat Map
[R,P,RL,RU] = corrcoef(Features);
h = heatmap(R);
h.YDisplayLabels = {'MeanX', 'MeanY', 'MeanZ', 'MeanM',...
'stdX', 'stdY', 'stdZ', 'stdM', 'medX',...
'medY', 'medZ', 'medM'};
h.XDisplayLabels = {'MeanX', 'MeanY', 'MeanZ', 'MeanM',...
'stdX', 'stdY', 'stdZ', 'stdM', 'medX',...
'medY', 'medZ', 'medM'};
figure
subplot(2,2,1)
plot(Mean_FAX_Jogging, Mean_FAMag_Jogging, 'o', 'MarkerEdgeColor',[0 0 0],...
'MarkerFaceColor',[0 0.4470 0.7410] )
hold on
plot(Mean_FAX_Walking, Mean_FAMag_Walking, 'o', 'MarkerEdgeColor',[0 0 0],...
'MarkerFaceColor',[0.8500 0.3250 0.0980] )
hold on
plot(Mean_FAX_Standing, Mean_FAMag_Standing, 'o', 'MarkerEdgeColor',[0 0 0],...
'MarkerFaceColor',[0.4940 0.1840 0.5560])
hold on
plot(Mean_FAX_Downstairs, Mean_FAMag_Downstairs, 'o', 'MarkerEdgeColor',[0 0 0],...
'MarkerFaceColor',[0.4660 0.6740 0.1880] )
hold on
plot(Mean_FAX_Upstairs, Mean_FAMag_Upstairs, 'o', 'MarkerEdgeColor',[0 0 0],...
'MarkerFaceColor',[0.3010 0.7450 0.9330] )
hold on
plot(Mean_FAX_Sitting, Mean_FAMag_Sitting, 'o', 'MarkerEdgeColor',[0 0 0],...
'MarkerFaceColor',[0.6350 0.0780 0.1840] )
legend({'Jogging', 'Walking', 'Standing', 'Downstairs','Upstairs','Sitting'})
xlabel('Mean FAX')
ylabel(['Mean ' ...
'FAMag'])
subplot(2,2,2)
plot(std_FAX_Jogging, std_FAMag_Jogging, 'o', 'MarkerEdgeColor',[0 0 0],...
'MarkerFaceColor',[0 0.4470 0.7410] )
hold on
plot(std_FAX_Walking, std_FAMag_Walking, 'o', 'MarkerEdgeColor',[0 0 0],...
'MarkerFaceColor',[0.8500 0.3250 0.0980] )
hold on
plot(std_FAX_Standing, std_FAMag_Standing, 'o', 'MarkerEdgeColor',[0 0 0],...
'MarkerFaceColor',[0.4940 0.1840 0.5560])
hold on
plot(std_FAX_Downstairs, std_FAMag_Downstairs, 'o', 'MarkerEdgeColor',[0 0 0],...
'MarkerFaceColor',[0.4660 0.6740 0.1880] )
hold on
plot(std_FAX_Upstairs, std_FAMag_Upstairs, 'o', 'MarkerEdgeColor',[0 0 0],...
'MarkerFaceColor',[0.3010 0.7450 0.9330] )
hold on
plot(std_FAX_Sitting, std_FAMag_Sitting, 'o', 'MarkerEdgeColor',[0 0 0],...
'MarkerFaceColor',[0.6350 0.0780 0.1840] )
legend({'Jogging', 'Walking', 'Standing', 'Downstairs','Upstairs','Sitting'})
xlabel('std FAX')
ylabel(['std ' ...
'FAMag'])
% Create a box plot
figure;
acceleration_data = Jogging.time;
boxplot(acceleration_data, 'Labels', {'AX', 'AY', 'AZ'});
title('Box Plot of Accelerometer Data');
ylabel('Acceleration');
%% Clustering Unlabled data: Your Assignment :)
% Kmeans
Labels = kmeans(Features,6);
Labels2 = kmeans(Features,4);
% Quality of the clusters: silhouette Plot
figure
silhouette(Features,Labels)
figure
silhouette(Features,Labels2)
% Evaluation