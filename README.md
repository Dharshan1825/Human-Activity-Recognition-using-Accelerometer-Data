# Human Activity Recognition using Accelerometer Data

This project performs exploratory data analysis (EDA) and frequency-domain
feature extraction on smartphone accelerometer data for human activity
recognition. MATLAB is used to analyze time-domain and frequency-domain
characteristics of human activities such as Walking, Jogging, Sitting,
Standing, Upstairs, and Downstairs.

<img width="753" height="356" alt="image" src="https://github.com/user-attachments/assets/f42d941b-a6f6-40d9-9005-fab0a7528a89" />
<img width="457" height="344" alt="image" src="https://github.com/user-attachments/assets/24cd5803-ba1a-4d56-95d4-7692919a18ce" />
<img width="392" height="293" alt="image" src="https://github.com/user-attachments/assets/19a8aef0-239c-4cc6-8fc2-3b395b0c6bee" />
<img width="390" height="289" alt="image" src="https://github.com/user-attachments/assets/c86d6485-62c6-4073-b18e-570fe3eeb104" />
<img width="751" height="594" alt="image" src="https://github.com/user-attachments/assets/1db0dc00-ee78-4b39-9aba-bc0c759369e2" />





## Dataset Loading

The accelerometer dataset is loaded from a MAT-file containing structured
activity data.

```matlab
load DataSet.mat
DataSet = DataSet;


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


