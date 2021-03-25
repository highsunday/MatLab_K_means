
%========CFG========
K=3
iteration=100
is_2D=false % 2D為 true ; 3D為 false
%SepalLengthCm,SepalWidthCm,PetalLengthCm,PetalWidthCm
col1='PetalLengthCm'
col2='PetalWidthCm'
col3='SepalWidthCm'
%===================

% initial
if is_2D
    run=K_means(K,col1,col2);
    data=run.Output_df();
    run.initialPoints(data);

    %分群
    res=run.Clustering(data);
    run.Plot_df(res);

    for i=1:iteration
        last_points=run.points;
        drawnow				% 立即作圖
        pause(1)

        % 重新定位群心
        run.recalculate_points(res);
        run.Plot_df(res);
        res=run.Clustering(data);
        if(run.points==last_points)
            break
        end
    end
else
    run=K_means(K,col1,col2,col3);
    data=run.Output_df();
    run.initialPoints(data);
    res=run.Clustering(data);
    run.Plot_df(res);
    for i=1:iteration
        last_points=run.points;
        drawnow				% 立即作圖
        pause(1)

        % 重新定位群心
        run.recalculate_points(res);
        run.Plot_df(res);
        res=run.Clustering(data);
        if(run.points==last_points)
            break
        end
    end
end


%%% 3d case
%K_means.Plot_2d_df(data)
%data=K_means.Output_3d_df('SepalLengthCm','SepalWidthCm','PetalLengthCm')
%K_means.Plot_3d_df(data)
%%%





