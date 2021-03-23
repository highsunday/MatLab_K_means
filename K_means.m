classdef K_means
    
    properties
        Property1
    end

    methods (Static)
        function data = Output_2d_df(col1,col2)
            DataFrame = readtable ('data/Iris.csv')		% 將 data.csv 的內容讀到矩陣 A	
            data= cell2mat(table2cell(DataFrame(:,{col1,col2})))
        end
        
        function Plot_2d_df(data)
           scatter(data(:,1),data(:,2))
        end
    end
end

