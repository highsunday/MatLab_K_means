classdef K_means
    
    properties
        Property1
    end

    methods (Static)
        function data = Output_2d_df(col1,col2)
            DataFrame = readtable ('data/Iris.csv')		% �N data.csv �����eŪ��x�} A	
            data= cell2mat(table2cell(DataFrame(:,{col1,col2})))
        end
        
        function Plot_2d_df(data)
           scatter(data(:,1),data(:,2))
        end
    end
end

