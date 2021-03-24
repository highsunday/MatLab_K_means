classdef K_means < handle
    
    properties
        %k ���s�Ӽ� ; points:�s�� ; cluster : ��s�i���k��
        k
        points
        cluster
    end
     methods
            function obj = K_means(k)   %�غc�禡�A�禡���W�@�P�A���������ܼƪ���l��
                obj.k = k;     
            end
            
            function obj=initialPoints(obj,data)
                %�H�����k���I:�q����I�����(�i�୫��)
                r = randi([1 length(data)],1,obj.k);
                disp(data(r,:));
                obj.points=data(r,:); 
            end
    end
    methods (Static)
        function data = Output_2d_df(col1,col2)
            DataFrame = readtable ('data/Iris.csv')	;	% �N data.csv �����eŪ��x�} A	
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
            DataFrame = readtable ('data/Iris.csv')	;	;% �N data.csv �����eŪ��x�} A	
            data= cell2mat(table2cell(DataFrame(:,{col1,col2,col3})));
        end
        
         function Plot_3d_df(data)
           plot3(data(:,1),data(:,2),data(:,3),'o')
         end
       
    end
end

