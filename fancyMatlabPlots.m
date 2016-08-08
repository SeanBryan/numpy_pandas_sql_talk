% Nice plotting Template

% Plotting ===============================================================
FW  = 'fontweight';
FSz = 'fontsize';
tsz = 14;   % title size
lsz = 12;   % label & legend size 
lst = 'linestyle';
LW  = 'linewidth';
lw  = 2;    % linewidth
c   = 'color';
ftn = 'fontname';
sym = 'symbol';
hlv = 'helvitica';
loc = 'location';

% Basic Figure Ex ========================================================
figure(1)
set(gcf,'position',[30,30,750,400])
set(gca, LW,lw,FSz,lsz,'box','off','tickdir','out')

plot(X,Y,LW,lw)
xlim([array(1) array(end)])
title([var1 'string'],FW,'bold',FSz,tsz)
xlabel('x',FSz,lsz)
ylabel('y',FSz,lsz)
legend('label_1',loc,'SW')

% Marker Ticks ========================================================

figure(2)
hold on
r = plot(X,Y,'b.');
x = plot(X,Y,'k-.',LW,lw);
hold off
set(r,'marker','o','markersize',2,'markerfacecolor',[.15 .15 .75])

% Symbolic Ticks ======================================================

figure(3)
hold on
plot(X,Y,'b.',LW,lw)
plot(X,Y,'r.-',LW,0.5)
hold off
set(gcf,'position',[60,30,750,400])
set(gca, LW,lw,FSz,lsz,'box','off','tickdir','out')
ylim([-30*pi 0])
sep = -30:3:0;
set(gca,'YTick',sep*pi);
% set(gca,'YTickLabel',{'-30p','-27p','-24p','-21p','-18p','-15p','-12p','-9p','-6p','-3p','0'},ftn,sym)
xlim([time_vec(1) time_vec(end)])
datetick('x',15,'keeplimits')
title([var1 'str1'],FSz,tsz,FW,'bold',ftn,hlv) 
xlabel('x',fsz,12,ftn,hlv)
ylabel('y',fsz,12,fn,hlv)
L = legend('y1','y2',loc,'NE');
set(L,ftn,hlv)

% Horizontal line ======================================================

hLine_value = 1;
hLine = linspace(x(1),x(end),length(x));
plot(x,y,hLine,hLine_value)

% Vertical line ======================================================
Ylim = ([minY maxY]);
plot(X,Y)
line1 = line([v_value v_value],[minY maxY]);
% ======================================================================
% Varous axis handles
axis square
xlim([xstart xend]);
ylim([y(1) y(end)]);
datetick('x',15,'keeplimits')


% ======================================================================
% 2D plots with Imagescale 
figure(1)
clf
imagesc(mm,mm,Z);
set(gca,FSz,lsz,'ydir','normal');


% ======================================================================
% 2D plots with Colorabar and Colorbar axis
figure(1)
clf
imagesc(mm,mm,Z);
axis square
set(gca,FSz,lsz,'ydir','normal');
colormap(parula);
t = colorbar('peer',gca);
get(t,'ylabel');
set(gca,FSz,lsz);
minQW = min(Z);
caxis([-60 0]);
QWlimits = ceil(-60:10:0);
set(t,'Ytick',QWlimits);
set(get(t,'ylabel'),'String', 'Amplitude (dB)',FSz,lsz,FW,'bold');
title([QW ' Amp'],FSz,tsz,FW,'bold')
xlabel('X position (mm)',FSz,lsz,FW,'bold')
ylabel('Y position (mm)',FSz,lsz,FW,'bold')


% Contour =============================================================
%[L,h] = contour(data);
[L,h] = contourf(data); % contourf fills the contour
set(h,LW,lw);
colormap(winter);
t = colorbar('peer',gca);
get(t,'ylabel');
set(get(t,'ylabel'),'String', 'Amplitude (dB)');
title([res 'Plot Title'],FW,'bold',FSz,tsz)
xlabel('\theta (deg)',FSz,lsz)
ylabel('\phi (deg)',FSz,lsz)

% surface
% surface is a 3D version of contour. you may need to specify the
% projection direction. 

% ======================================================================
% Subplotting
figure(1)
subplot(2,1,1) % subplot(# rows of plots, # columns of plots, which plot I am now plotting) 
plot(x,y1,'b')

subplot(2,1,2)
plot(x,y2,'g')


% ======================================================================
% ======================================================================

% Annotation =========================================================
text(1.897,-20,'  \nu_{CII}',c,[1 0 0],FSz,lsz)
uicontrol('style','text','string','something','units','normalized','position',[0.9 0.8 .1 .1])

% Saving ==============================================================

saveas(1,[var1 'name.jpg'])
% if you specify the extention type in the string, it knows to save as 
%  that image type
% the fignumber is the first variable you put into saveas

% ======================================================================
% ======================================================================
% ======================================================================
% Colors
%http://www.mathworks.com/help/matlab/ref/colormap.html

colormaps = 'jet' = default, 'parula'
            'spring','summer','autumn','winter'
            'hot','cold'
            hsv = circular colormap

color_mtx= [
0    1    0    ;... % standard green
0.5  0.0  0.9  ;... % royal blue/purple
1    0.6  0.7  ;... % pink
0.2  0.8  0.8  ;... % turquoise
0.0  0.6  0.1  ;... % forest green
1    0.5  0.0  ;... % orange
0.25 0.55 0.9  ;... % sky blue
0.6  0.8  0.4  ;... % sea green
0.9  0.7  0.3  ;... % tan
0.7  0.2  0.5  ;... % purple (fuscia)
0.1  0.3  0.6  ;... % navy blue
0.9  0.9  0.1  ;... % off-yellow
0.9  0    0    ;... % blood red
1.0  1.0  0.1  ;... % yellow
1.0  0    0    ;... % standard blue
];
% Custom color map that you can call in the plot line

% ======================================================================
% ======================================================================
% ======================================================================
% Websites
% http://www.mathworks.com/products/matlab/plot-gallery.html#standardplots
% 
