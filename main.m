
%========CFG========
K=2
iteration=10
%===================




% initial
run=K_means(K);
data=K_means.Output_2d_df('SepalLengthCm','SepalWidthCm');
run.initialPoints(data);

for i=1:iteration
    %分群
    res=run.Clustering(data);
    run.Plot_2d_df(res);
    
    last_points=run.points;
	drawnow				% 立即作圖
    pause(1)
    
    % 重新定位群心
    run.recalculate_points(res);
    run.Plot_2d_df(res);
    
    if(run.points==last_points)
        break
    end
end

%%% 3d case
%K_means.Plot_2d_df(data)
%data=K_means.Output_3d_df('SepalLengthCm','SepalWidthCm','PetalLengthCm')
%K_means.Plot_3d_df(data)
%%%





