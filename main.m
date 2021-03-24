
%========CFG========
K=2
iteration=10
%===================




% initial
run=K_means(K);
data=K_means.Output_2d_df('SepalLengthCm','SepalWidthCm');
run.initialPoints(data);

for i=1:iteration
    %���s
    res=run.Clustering(data);
    run.Plot_2d_df(res);
    
    last_points=run.points;
	drawnow				% �ߧY�@��
    pause(1)
    
    % ���s�w��s��
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





