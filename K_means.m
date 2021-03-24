classdef K_means < handle
    
    properties
        %k 分群個數 ; points:群心 ; cluster : 對群進行歸類
        k
        points
        cluster
    end
     methods
            function obj = K_means(k)   %建構函式，函式類名一致，完成類中變數的初始化
                obj.k = k;     
            end
            
            function obj=initialPoints(obj,data)
                %隨機選取k個點:從資料點中選取(可能重複)
                r = randi([1 length(data)],1,obj.k);
                disp(data(r,:));
                obj.points=data(r,:); 
            end
    end
    methods (Static)
        function data = Output_2d_df(col1,col2)
            DataFrame = readtable ('data/Iris.csv')	;	% 將 data.csv 的內容讀到矩陣 A	
            data= cell2mat(table2cell(DataFrame(:,{col1,col2})));
        end
        
        function Plot_2d_df(data)
           scatter(data(:,1),data(:,2))
        end
        
         function Plot_2d_with_points(data,points)
            % disp(points)
           scatter(data(:,1),data(:,2),'b','.')
           hold on
           scatter(points(:,1),points(:,2),'r','x')
         end
        
        function data = Output_3d_df(col1,col2,col3)
            DataFrame = readtable ('data/Iris.csv')	;	;% 將 data.csv 的內容讀到矩陣 A	
            data= cell2mat(table2cell(DataFrame(:,{col1,col2,col3})));
        end
        
         function Plot_3d_df(data)
           plot3(data(:,1),data(:,2),data(:,3),'o')
         end
       
    end
end

