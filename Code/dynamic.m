htm=vision.TemplateMatcher;
hmi = vision.MarkerInserter('Size', 10, ...
    'Fill', true, 'FillColor', 'White', 'Opacity', 0.25); 
imgCell={'11.png','12.png','13.png','14.png'};
T=rgb2gray(imread('sourcelogo.png'));
T1=rgb2gray(imread('destilogo.png'));
T2=rgb2gray(imread('LOGO1.png'));
ori=imread('new.png');
ori = rgb2gray(ori);
Loc=step(htm,ori,T);  
Loc1=step(htm,ori,T1); 
x1=int16(Loc(1));y1=int16(Loc(2));
x2=int16(Loc1(1));y2=int16(Loc1(2));
slope=(y1-y2)/(x1-x2);
const=y1-slope*x1;
for a = 1:4
    figure;  
    image1=imgCell{a};
    I=imread(image1);
    %hold on
    Igray = rgb2gray(I); 
    Loc2=step(htm,Igray,T2);
    x3=int16(Loc2(1));y3=int16(Loc2(2));
    comp=slope*x3+const
    if  abs(comp-y3)>30
        k = ((y2-y1) * (x3-x1) - (x2-x1) * (y3-y1)) / ((y2-y1)^2 + (x2-x1)^2);
        x4 = x3 - k * (y2-y1);
        y4 = y3 + k * (x2-x1);
        yintr=(y2-slope*x2+slope*slope*y3+slope*x3)/(slope*slope+1);
        xintr=slope*(y3-yintr)+x3;
        radius=sqrt(double((x3-xintr)*(x3-xintr)+(y3-yintr)*(y3-yintr)));
        x5=radius/sqrt(double(1+slope*slope))+xintr+3;
        y5=(radius*slope)/sqrt(double(1+slope*slope))+yintr+3;
        x6=(-radius)/sqrt(double(1+slope*slope))+xintr+1;
        y6=((-1)*radius*slope)/sqrt(double(1+slope*slope))+yintr+1;
        dist1=sqrt(double((x6-x2)*(x6-x2)+(y6-y2)*(y6-y2)));
        dist2=sqrt(double((x5-x2)*(x5-x2)+(y5-y2)*(y5-y2)));
        imshow(I); 
        hold on;
        %r=100;
        theta = 0 : (2 * pi / 10000) : (2 * pi);
        pline_x = double(r * cos(theta)) + double(x3);
        pline_y = double(r * sin(theta)) + double(y3);
        plot(pline_x, pline_y, '-');
        r= r - 20;
        %imshow(imread('liveflight3copy.png'));
        if (dist1<dist2)
            line([x3,x6],[y3,y6],'Color','r','LineWidth',1)
            line([x6,x2],[y6,y2],'Color','r','LineWidth',1)
        else
            line([x3,x5],[y3,y5],'Color','r','LineWidth',1)
            line([x5,x2],[y5,y2],'Color','r','LineWidth',1)
        end
        line([x3,x2],[y3,y2],'Color','w','LineWidth',1)
        hold off
    else
        imshow(I);
        hold off;
        r= r - 20;
    end
end
