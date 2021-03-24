
run=K_means(5);
data=K_means.Output_2d_df('SepalLengthCm','SepalWidthCm');

%%%
%K_means.Plot_2d_df(data)
%data=K_means.Output_3d_df('SepalLengthCm','SepalWidthCm','PetalLengthCm')
%K_means.Plot_3d_df(data)
%%%

run.initialPoints(data);
%K_means.Plot_2d_with_points(data,run.points)
res=run.Clustering(data);

run.Plot_2d_df(res);

