clear all 
clc
%% ���߲�������  //��λcm//

f =10e9;    %��Ƶ�����Ƶ��
c = 3e8;
lamda = c/f;
h = 0.1588; %���߸߶� ��λ��cm
E_r = 2.2;
W = 100*calcu_W(f,E_r,c)    %���߿��

E_reff = (E_r+1)/2 + (E_r-1) * (1+12*h/W)^(-1/2)/2

delta_L = 0.412 * h*(...
                (E_reff+0.3) * (W/h+0.264)...
                /(E_reff-0.258)...
                /(W/h+0.8)...
                )

 L = 100*lamda/2/sqrt(E_reff) - 2*delta_L  %���߳���
 
 
 
 %% �����迹����
 
 if W<100*lamda
     
     G1 = ( W/(100*lamda) )^2/90;
     
 else
     G1 = ( W/(100*lamda) )/120;
     
     
 end
 
 Z = 1/G1/2       %�����迹
 
 N = 8;%��������
 x = zeros(N,3);
 a = 1000*lamda;%���ɺ��׵�λ
 for n=0:N-1
    
    x(n+1,1,1)=a*cos(n/N*2*pi);
    x(n+1,2,1)=a*sin(n/N*2*pi);
    
end
 
 
l = 1;      %ģʽ������
fai_n = zeros(N,1); 


for n=0:N-1
    
    
    fai_n(n+1,1) = l*360*n/N;
    
    
    
end

No = (1:N).';

Amp= ones(N,1);%�źŷ���

Antenna = [No,x,Amp,fai_n]; 

% save array.csv -ascii Antenna



