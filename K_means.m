classdef K_means < handle
    
    properties
        %k ���s�Ӽ� ; points:�s�� ; cluster : ��s�i���k��
        k
        points
        cluster
        axis_x
        axis_y
        image_count
    end
     methods
            function obj = K_means(k,axis_x,axis_y)   %�غc�禡�A�禡���W�@�P�A���������ܼƪ���l��
                obj.k = k; 
                obj.axis_x = axis_x; 
                obj.axis_y = axis_y; 
                obj.image_count = 0; 
            end
            
            function data = Output_2d_df(obj)
                DataFrame = readtable ('data/Iris.csv')	;	% �N data.csv �����eŪ��x�} A	
                data= cell2mat(table2cell(DataFrame(:,{obj.axis_x,obj.axis_y})));
            end
            
            function obj=initialPoints(obj,data)
                %�H�����k���I:�q����I�����(�i�୫��)
                r = randi([1 length(data)],1,obj.k);
                %disp(data(r,:));
                obj.points=data(r,:); 
            end
            
            function res=Clustering(obj,data)
                %��Ҧ��I�i���k��
                cluster_index=zeros(150,1);
                for i= 1:length(data)
                    shortDis=realmax;
                    shortIndex=-1;
                    for j =1: obj.k
                        dis=(data(i,1)-obj.points(j,1))^2+((data(i,2)-obj.points(j,2)))^2;
                        if(dis<shortDis)
                            shortDis=dis;
                            shortIndex=j;
                        end
                    end
                    cluster_index(i,1)=shortIndex;
                end
                res=[data cluster_index];
                res=array2table(res,'VariableNames',{'x','y','group'});
            end
            
            
            function Plot_2d_df(obj,data)    
                hold off
                for i=1:obj.k
                   tf = (data.group == i);
                   scatter(data.x(tf),data.y(tf),'o')
                   hold on
                end
                obj.image_count= obj.image_count+1;
                scatter(obj.points(:,1),obj.points(:,2),'r','x')
                xlabel(obj.axis_x)
                ylabel(obj.axis_y)
                title(['K-means : iteration ',num2str(obj.image_count)])
            end
            
             function recalculate_points(obj,data)         
                for i=1:obj.k
                    fprintf('for cluster %d',i)
                   tf = (data.group == i);
                   disp([mean(data.x(tf)),mean(data.y(tf))])
                   obj.points(i,1)=mean(data.x(tf));
                   obj.points(i,2)=mean(data.y(tf));
                end
            end
    end
    methods (Static)

        
        function data = Output_3d_df(col1,col2,col3)
            DataFrame = readtable ('data/Iris.csv')	;% �N data.csv �����eŪ��x�} A	
            data= cell2mat(table2cell(DataFrame(:,{col1,col2,col3})));
        end
        
         function Plot_3d_df(data)
           plot3(data(:,1),data(:,2),data(:,3),'o')
         end
       
    end
end

