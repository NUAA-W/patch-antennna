clear all 
clc
%% 天线参数计算  //单位cm//

f =10e9;    %设计的天线频率
c = 3e8;
lamda = c/f;
h = 0.1588; %天线高度 单位：cm
E_r = 2.2;
W = 100*calcu_W(f,E_r,c)    %天线宽度

E_reff = (E_r+1)/2 + (E_r-1) * (1+12*h/W)^(-1/2)/2

delta_L = 0.412 * h*(...
                (E_reff+0.3) * (W/h+0.264)...
                /(E_reff-0.258)...
                /(W/h+0.8)...
                )

 L = 100*lamda/2/sqrt(E_reff) - 2*delta_L  %天线长度
 
 
 
 %% 输入阻抗计算
 
 if W<100*lamda
     
     G1 = ( W/(100*lamda) )^2/90;
     
 else
     G1 = ( W/(100*lamda) )/120;
     
     
 end
 
 Z = 1/G1/2       %输入阻抗
 
 N = 8;%阵列数量
 x = zeros(N,3);
 a = 1000*lamda;%化成毫米单位
 for n=0:N-1
    
    x(n+1,1,1)=a*cos(n/N*2*pi);
    x(n+1,2,1)=a*sin(n/N*2*pi);
    
end
 
 
l = 1;      %模式数设置
fai_n = zeros(N,1); 


for n=0:N-1
    
    
    fai_n(n+1,1) = l*360*n/N;
    
    
    
end

No = (1:N).';

Amp= ones(N,1);%信号幅度

Antenna = [No,x,Amp,fai_n]; 

% save array.csv -ascii Antenna



