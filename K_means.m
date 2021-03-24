classdef K_means
    
    properties
        Property1
    end

    methods (Static)
        function data = Output_2d_df(col1,col2)
            DataFrame = readtable ('data/Iris.csv')	;	% 將 data.csv 的內容讀到矩陣 A	
            data= cell2mat(table2cell(DataFrame(:,{col1,col2})));
        end
        
        function Plot_2d_df(data)
           scatter(data(:,1),data(:,2))
        end
        
        function points=initialPoints(k,data)
            %隨機選取k個點:從資料點中選取(可能重複)
            r = randi([1 length(data)],1,k);
            points=data(r,:);
            
        end
        
        function data = Output_3d_df(col1,col2,col3)
            DataFrame = readtable ('data/Iris.csv')		;% 將 data.csv 的內容讀到矩陣 A	
            data= cell2mat(table2cell(DataFrame(:,{col1,col2,col3})));
        end
        
         function Plot_3d_df(data)
           plot3(data(:,1),data(:,2),data(:,3),'o')
         end
       
    end
end

