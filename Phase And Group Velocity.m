%%%%%%%%%%%%%%%%%%%% Group Velocity and Phase Velocity Animation %%%%%%%%%%%%%%%%%%%%

while(1)
t = 0:0.1:150;
x = 0:0.1:150;

%           Creates a Menu at top left corner for different choice       %            

choice = menu('Choose a case:','1. Phase velocity= group velocity','2. Phase velocity is greater than group velocity','3. Group velocity is greater than phase velocity','4. Non-zero phase velocity, zero group velocity','5. Zero phase velocity, non-zero group velocity','6. Phase velocity=-group velocity');
if (choice== 1)
    k1=-2.0;w1=5 ;k2=-1.8;w2=4.5;
end
if (choice==2)
    k1=-1.9;w1=7.4;k2=-1.7;w2=7.1;
end
if (choice==3)
    k1=-1.9;w1=7;k2=-1.7;w2=5;
end
if (choice==4)
    k1=-1.9;w1=5;k2=-1.7;w2=5;
end
if (choice==5)
    k1=-1.9;w1=0.5;k2=-1.7;w2=-0.5;
end
if (choice==6)
    k1=-2.0;w1=4.5 ;k2=-1.8;w2=5;
end
 
%                     Creates a Object of figure                      %

figure_handle=figure;

%                                Loop Length                          %   

for k = 700:length(t)
    
%                  Ends a session when figure is closed               %

   if ~ishandle(figure_handle);continue;end
  
%                            Component Waves                          % 

    Wave1=cos(k1*x(1:k)+w1*t(k));
    Wave2=cos(k2*x(1:k)+w2*t(k));
    
%                           Wave 1 Marker                             %

    T1=floor(w1*70/(2*pi));   %Timeperiod correction factor
    Wavelength1=2*pi/abs(k1); %Wavelength
    i1=floor((70)/Wavelength1)*(Wavelength1); %Wavelength correction factor
    x1=w1*t(k)/abs(k1)-double(T1*Wavelength1)+i1;% Marker
    subplot(4,2,[1 2])% Divide the plot into 8 blocks
    grid on
    hold on
    title('Wave 1')
    ylabel('cos(k1*t+w1*t)','FontSize',8,'FontWeight','bold','Color','k')
    
%          Restarts the Marker from initial position                   %
    
    if(t(k)>=i1)
         if(x1>=i1)
             d=floor(x1/i1);
             s=floor(i1/Wavelength1);
             x1=x1-double(d*s*Wavelength1);
         end
         plot(x1,1,'bo','MarkerFaceColor','b')%plots marker
         hold on            
    end
    
%                      Plots Wave 1                           %

     plot(x(1:k),Wave1,'b')  
     axis([0 70 -1 1]);
     xlim([0 i1]);
     
 %                           Wave 2 Marker                             %
 
     subplot(4,2,[3 4])
     grid on
     hold on
     title('Wave 2')
     ylabel('cos(k2*t+w2*t)','FontSize',8,'FontWeight','bold','Color','k')
     Wavelength2=2*pi/abs(k2);%Wavelength
     T2=floor(w2*70/(2*pi));%Timeperiod correction factor
     i2=floor((70)/Wavelength2)*(Wavelength2);%Wavelength correction factor
     x2=w2*t(k)/abs(k2)-double(T2*Wavelength2)+i2;%Marker   
     
 %              Restarts the Marker from initial position            %
      
     if(t(k)>=i2)
         if(x2>=i2)
             d2=floor(x2/i2);
             s2=floor(i2/Wavelength2);
             x2=x2-double(d2*s2*Wavelength2);
         end
         plot(x2,1,'ro','MarkerFaceColor','r')
         hold on
     end
     
 %                      Plots Wave 1                           %
 
     plot(x(1:k),Wave2,'r')
     axis([0 70 -1 1]);
     xlim([0 i2]);
%           Group and Phase Velocity Markers                    %

     subplot(4,2,[5 8])
      hold on
      title('Wave 1 + Wave 2')
     xlabel('O represents phase Velocity * represents Group Velocity','FontSize',12,'FontWeight','bold','Color','k')
     ylabel('cos(k1*t+w1*t)+ cos(k2*t+w2*t)','FontSize',8,'FontWeight','bold','Color','k')
    x_phase=(w1+w2)*(t(k))/abs(k1+k2); %Phase marker
    l3=2*pi/abs((k1-k2)/2);            %Correction Factor   
    
   %              Restarts the Marker from initial position            %
   
    if(t(k)>=l3)
        np=floor(x_phase/l3);
        x_phase=x_phase-double(np*l3);
        plot(x_phase,cos(k1*x_phase+w1*(t(k)))+cos(k2*x_phase+w2*t(k)),'bo','MarkerFaceColor','b')
        hold on
    end
 %                        Group Marker                            %
 
    x_group=(w1-w2)*(t(k))/abs(k1-k2);
    if(t(k)>=l3)
        ng=floor(x_group/l3) ;
        x_group=x_group-double(ng*l3);
        plot(x_group,2,'r*','MarkerFaceColor','b')
        hold on
    end
    
%                      Plots Resultant Wave                 %

    plot(x(1:k),cos(k1*x(1:k)+w1*t(k))+cos(k2*x(1:k)+w2*t(k)))
    hold on
    axis([0 l3 -2 2]);
    xlim([0 l3]);
    pause(0.05);
    hold on
  
    if k~=length(t)
        clf
    end

end
%    Closing figure opens a menu to ask for another session   
choice = menu('Do you want to see another case?','Yes','No');
if choice==2 || choice==0
   break;
end
end