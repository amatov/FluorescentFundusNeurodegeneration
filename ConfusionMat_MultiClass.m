function [all_ACC,all_sn, all_sp, all_ppv ] = ConfusionMat_MultiClass(cmat,classNames)

classNum = numel(classNames) ;
ACC_Class=zeros(1,classNum);       % Accuracy
SN_Class=zeros(1,classNum);        % Sensitivity
SP_Class=zeros(1,classNum);        % Specificity
ppv_class=zeros(1,classNum);       % precision



for C=1:classNum

    TP=0;   TN=0;   FP=0;  FN=0;
    
 %%%%%%%%%%%%%%%%% compute TP

            TP =TP +cmat(C,C);
                

%%%%%%%%%%%%%%%%% compute FN
             i=C;
                 for j=1:classNum
                     if j ~= i 
                      FN =FN +cmat(i,j);
                     end
                 end
            

%%%%%%%%%%%%%%%%% compute FP
             i=C;
                 for j=1:classNum
                     if j ~= i
                       FP =FP +cmat(j,i);
                     end
                 end
           
%%%%%%%%%%%%%%%%% compute TN
            for i=1:classNum
                if i ~= C
                   for j=1:classNum
                        if j ~= C
                             TN= TN +cmat(i,j);
                        end
                   end
                end
            end
 

ACC_Class(1,C)=(TP+TN)/(TP+TN+FP+FN);
SN_Class(1,C) = TP / (TP + FN);        
SP_Class(1,C)= TN /(TN + FP); 
ppv_class(1,C)= TP / (TP + FP);
            
end
    

all_ACC= mean(ACC_Class) ;
all_sn= mean(SN_Class) ;
all_sp= mean(SP_Class) ;
all_ppv= mean(ppv_Class) ;

end
