clc ; clear all; close all;
load('NIFS_KoreaSea_1966_2022_L3.mat')

% 정점들 대충 보려고 만든 플롯
figure;
for ii=1:length(dd)
    plot(dd{ii}.lon,dd{ii}.lat,'+');
    hold on;
end

%% KOREA NIFS stations
clc ; clear all; close all;
load('NIFS_KoreaSea_1966_2022_L3.mat')
ncfile='gebco_2023_n40.0_s31.0_w123.0_e136.0.nc';
ele=ncread(ncfile,'elevation'); ele=flipud(rot90(double(ele))); ele(ele>0)=NaN;
lon=ncread(ncfile,'lon'); lat=ncread(ncfile,'lat');
[LON,LAT]=meshgrid(lon,lat);


f=figure;
f.Position = [800 100 1500 1200];
m_proj('Mercator','lon',[123 136],'lat',[31 40]);
m_pcolor(LON, LAT, abs(ele)); hold on;
[c1,h1] = m_contour(LON, LAT, abs(ele),[100,200,300,500],':','color','k'); 
hold on; clabel(c1,h1,'labelspacing',600)
[c2,h2] = m_contour(LON, LAT, abs(ele),[1000,1500,2000,2500,3000],'-','color','k');
hold on; clabel(c2,h2,'labelspacing',600); 
shading interp;
m_gshhs_h('patch',[.7 .7 .7]);    % costline  c<l<i<h<f .
m_grid('xtick',[123 136], 'ytick',[31 40],'xticklabel',[],'yticklabel',[]);
m_grid('linestyle','none','box','fancy','xtick',[123:1:136] ,'ytick',[31:1:40]);
colormap(slanCM('deep')); hold on;

hold on;
for i=1:length(dd)
    stline(1,i)=dd{i}.line;
end
% line location
for ii=1:21 % 연안에 가까운 5정점 출력
    if length(dd{ii}.lon)>4
        m_plot(dd{ii}.lon(1:5),dd{ii}.lat(1:5),'+','linewidth',2,'color','m');
        hold on;
    else
        m_plot(dd{ii}.lon,dd{ii}.lat,'+','linewidth',2,'color','m');
        hold on;    
    end
end
for jj=22:26 % 다 모여있는 정점들
    m_plot(dd{jj}.lon,dd{jj}.lat,'+','linewidth',2,'color','m');
    hold on;    
end
m_plot(dd{29}.lon(1:5),dd{29}.lat(1:5),'+','linewidth',2,'color','m');
m_plot(dd{30}.lon,dd{30}.lat,'+','linewidth',2,'color','m');
hold on;
for k=1:5 % st.500,501 울릉도,독도 기준
    m_plot(dd{27}.lon(k),dd{27}.lat(k),'+','linewidth',2,'color','m');
    m_plot(dd{28}.lon(k),dd{28}.lat(k),'+','linewidth',2,'color','m');
    hold on;
end
for k=0:6 % st.500,501 울릉도,독도 기준
    m_plot(dd{27}.lon(end-k),dd{27}.lat(end-k),'+','linewidth',2,'color','m');
    m_plot(dd{28}.lon(end-k),dd{28}.lat(end-k),'+','linewidth',2,'color','m');
    hold on;
end

% line name
for ii=1:6
    m_text(dd{ii}.lon(5)+0.1,dd{ii}.lat(5),string(stline(ii)),'fontsize',12,'FontWeight','bold','linewidth',2,'color','m');
    hold on;
end
m_text(dd{7}.lon(4)-0.4,dd{7}.lat(4),string(stline(7)),'fontsize',12,'FontWeight','bold','linewidth',2,'color','m');
m_text(dd{8}.lon(5)-0.3,dd{8}.lat(5)-0.1,string(stline(8)),'fontsize',12,'FontWeight','bold','linewidth',2,'color','m');
m_text(dd{9}.lon(5)-0.4,dd{9}.lat(5),string(stline(9)),'fontsize',12,'FontWeight','bold','linewidth',2,'color','m');
m_text(dd{10}.lon(5)-0.3,dd{10}.lat(5)-0.1,string(stline(10)),'fontsize',12,'FontWeight','bold','linewidth',2,'color','m');
m_text(dd{11}.lon(5)+0.1,dd{11}.lat(5),string(stline(11)),'fontsize',12,'FontWeight','bold','linewidth',2,'color','m');
m_text(dd{12}.lon(5)+0.1,dd{12}.lat(5)-0.1,string(stline(12)),'fontsize',12,'FontWeight','bold','linewidth',2,'color','m');
m_text(dd{13}.lon(5)+0.1,dd{13}.lat(5)-0.1,string(stline(13)),'fontsize',12,'FontWeight','bold','linewidth',2,'color','m');
for kk=14:19
    m_text(dd{kk}.lon(5)-0.4,dd{kk}.lat(5),string(stline(kk)),'fontsize',12,'FontWeight','bold','linewidth',2,'color','m');
end
m_text(dd{20}.lon(5)-0.2,dd{20}.lat(5)-0.1,string(stline(20)),'fontsize',12,'FontWeight','bold','linewidth',2,'color','m');
m_text(dd{21}.lon(5)-0.5,dd{21}.lat(5),string(stline(21)),'fontsize',12,'FontWeight','bold','linewidth',2,'color','m');
for jj=22:25
    m_text(dd{jj}.lon(end)-0.5,dd{jj}.lat(1),string(stline(jj)),'fontsize',12,'FontWeight','bold','linewidth',2,'color','m');
end
m_text(dd{26}.lon(2),dd{26}.lat(2)-0.1,string(stline(26)),'fontsize',12,'FontWeight','bold','linewidth',2,'color','m');
m_text(dd{27}.lon(1)-0.1,dd{27}.lat(1)-0.1,string(stline(27)),'fontsize',12,'FontWeight','bold','linewidth',2,'color','m');
m_text(dd{28}.lon(1)-0.2,dd{28}.lat(1)-0.1,string(stline(28)),'fontsize',12,'FontWeight','bold','linewidth',2,'color','m');
m_text(dd{29}.lon(5)-0.4,dd{29}.lat(5),string(stline(29)),'fontsize',12,'FontWeight','bold','linewidth',2,'color','m');
m_text(dd{30}.lon(4)-0.1,dd{30}.lat(4)-0.3,string(stline(30)),'fontsize',12,'FontWeight','bold','linewidth',2,'color','m');

hold on;
title('NIFS stations', 'FontWeight','bold','FontSize',20);
h=colorbar;
set(h,'YDir','reverse');


%% East Sea in KOREA (not BL01~BL05)
clc; clear all; close all;
load('NIFS_KoreaSea_1966_2022_L3.mat');
ncfile='gebco_2023_n38.5_s34.5_w128.0_e133.0.nc';
ele=ncread(ncfile,'elevation'); ele=flipud(rot90(double(ele))); ele(ele>0)=NaN;
lon=ncread(ncfile,'lon'); lat=ncread(ncfile,'lat');
[LON,LAT]=meshgrid(lon,lat);


f=figure;
f.Position = [800 100 1500 1200];
m_proj('Mercator','lon',[128 133],'lat',[34.5 38.5]);
m_pcolor(LON, LAT, abs(ele)); hold on;
[c1,h1] = m_contour(LON, LAT, abs(ele),[100,200,300,500],':','color','k'); 
hold on; clabel(c1,h1,'labelspacing',600)
[c2,h2] = m_contour(LON, LAT, abs(ele),[1000,1500,2000,2500,3000],'-','color','k');
hold on; clabel(c2,h2,'labelspacing',600); 
shading interp;
m_gshhs_h('patch',[.7 .7 .7]);    % costline  c<l<i<h<f .
m_grid('xtick',[128 133], 'ytick',[34.5 38.5],'xticklabel',[],'yticklabel',[]);
m_grid('linestyle','none','box','fancy','xtick',[128:.5:133] ,'ytick',[34.5:.5:38.5]);
colormap(slanCM('deep')); hold on;
m_plot(dd{1}.lon(1:8),dd{1}.lat(1:8),'+','linewidth',2,'color','m'); hold on; % 102 line
m_plot(dd{3}.lon(1:5),dd{3}.lat(1:5),'+','linewidth',2,'color','m'); hold on; % 104 line
m_plot(dd{4}.lon(1:5),dd{4}.lat(1:5),'+','linewidth',2,'color','m'); hold on; % 105 line
m_plot(dd{5}.lon(1:5),dd{5}.lat(1:5),'+','linewidth',2,'color','m'); hold on; % 106 line
m_plot(dd{11}.lon(1:3),dd{11}.lat(1:3),'+','linewidth',2,'color','m'); hold on; % 207 line
m_plot(dd{12}.lon(1:4),dd{12}.lat(1:4),'+','linewidth',2,'color','m'); hold on; % 208 line


%% East Sea in KOREA (BL01~BL05)
clc; clear all; close all;
load('NIFS_KoreaSea_1966_2022_L3.mat');
ncfile='gebco_2023_n38.5_s34.5_w128.0_e133.0.nc';
ele=ncread(ncfile,'elevation'); ele=flipud(rot90(double(ele))); ele(ele>0)=NaN;
lon=ncread(ncfile,'lon'); lat=ncread(ncfile,'lat');
[LON,LAT]=meshgrid(lon,lat);

BL_lon=[131.03;131.21;131.39;131.57;131.74];
BL_lat=[37.48;37.44;37.39;37.35;37.30];

f=figure;
f.Position = [800 100 1500 1200];
m_proj('Mercator','lon',[128 133],'lat',[34.5 38.5]);
m_pcolor(LON, LAT, abs(ele)); hold on;
[c1,h1] = m_contour(LON, LAT, abs(ele),[100,200,300,500],':','color','k'); 
hold on; clabel(c1,h1,'labelspacing',600)
[c2,h2] = m_contour(LON, LAT, abs(ele),[1000,1500,2000,2500,3000],'-','color','k');
hold on; clabel(c2,h2,'labelspacing',600); 
shading interp;
m_gshhs_h('patch',[.7 .7 .7]);    % costline  c<l<i<h<f .
m_grid('xtick',[128 133], 'ytick',[34.5 38.5],'xticklabel',[],'yticklabel',[]);
m_grid('linestyle','none','box','fancy','xtick',[128:.5:133] ,'ytick',[34.5:.5:38.5]);
colormap(slanCM('deep')); hold on;
m_plot(dd{1}.lon(1:8),dd{1}.lat(1:8),'+','linewidth',2,'color','m'); hold on; % 102 line
m_plot(dd{3}.lon(1:5),dd{3}.lat(1:5),'+','linewidth',2,'color','m'); hold on; % 104 line
m_plot(dd{4}.lon(1:5),dd{4}.lat(1:5),'+','linewidth',2,'color','m'); hold on; % 105 line
m_plot(dd{5}.lon(1:5),dd{5}.lat(1:5),'+','linewidth',2,'color','m'); hold on; % 106 line
m_plot(dd{11}.lon(1:3),dd{11}.lat(1:3),'+','linewidth',2,'color','m'); hold on; % 207 line
m_plot(dd{12}.lon(1:4),dd{12}.lat(1:4),'+','linewidth',2,'color','m'); hold on; % 208 line
for ii=1:5
    m_plot(BL_lon(ii),BL_lat(ii),'+','linewidth',2,'color','m'); % BL line
    hold on;
end

m_text(dd{1}.lon(8)+0.1,dd{1}.lat(8),string(stline(1)),'fontsize',12,'FontWeight','bold','linewidth',2,'color','m');
m_text(dd{3}.lon(5)+0.1,dd{3}.lat(5),string(stline(3)),'fontsize',12,'FontWeight','bold','linewidth',2,'color','m');
m_text(dd{4}.lon(5)+0.1,dd{4}.lat(5),string(stline(4)),'fontsize',12,'FontWeight','bold','linewidth',2,'color','m');
m_text(dd{5}.lon(5)+0.1,dd{5}.lat(5),string(stline(5)),'fontsize',12,'FontWeight','bold','linewidth',2,'color','m');
m_text(dd{11}.lon(3)-0.1,dd{11}.lat(3)-0.1,string(stline(11)),'fontsize',12,'FontWeight','bold','linewidth',2,'color','m');
m_text(dd{12}.lon(4)+0.1,dd{12}.lat(4)-0.1,string(stline(12)),'fontsize',12,'FontWeight','bold','linewidth',2,'color','m');
m_text(BL_lon(1)-0.1,BL_lat(1)-0.1,'BL-01','fontsize',12,'FontWeight','bold','linewidth',2,'color','m');
m_text(BL_lon(5)-0.1,BL_lat(5)-0.1,'BL-05','fontsize',12,'FontWeight','bold','linewidth',2,'color','m');

hold on;
title('Stations in the East Sea', 'FontWeight','bold','FontSize',20);
h=colorbar;
set(h,'YDir','reverse');


%lons=[dd{11}.lon(3),dd{12}.lon(1),dd{12}.lon(4),dd{1}.lon(1),dd{1}.lon(8) ...
%    ,dd{3}.lon(5),dd{4}.lon(1),dd{4}.lon(5),dd{5}.lon(1)];
%lats=[dd{11}.lat(3),dd{12}.lat(1),dd{12}.lat(4),dd{1}.lat(1),dd{1}.lat(8) ...
%    ,dd{3}.lat(5),dd{4}.lat(1),dd{4}.lat(5),dd{5}.lat(1)];
%hold on;
%for k=1:length(lons)-1
%    [range,ln,lt]=m_lldist([lons(k) lons(k+1)],[lats(k) lats(k+1)],40); 
%    m_line(ln,lt,'color','r','linewi',2); 
%end


%% Distance
lon=round((lon),2); lat=round((lat),2);

lon104=dd{3}.lon(1:5); lat104=dd{3}.lat(1:5); % 104 line 
lon104=round(lon104,2); lat104=round(lat104,2);

lon105=dd{4}.lon(1:5); lat105=dd{4}.lat(1:5); % 105 line 
lon105=round(lon105,2); lat105=round(lat105,2);

lon106=dd{5}.lon(1:5); lat106=dd{5}.lat(1:5); % 106 line 
lon106=round(lon106,2); lat106=round(lat106,2);

ele(find(lon==lon104(1)),find(lat==lat104(1)))
ele(find(lon==lon104(2)),find(lat==lat104(2)))
ele(find(lon==lon104(3)),find(lat==lat104(3)))
ele(find(lon==lon104(4)),find(lat==lat104(4)))
ele(find(lon==lon104(5)),find(lat==lat104(5)))

ele(find(lon==lon105(1)),find(lat==lat105(1)))
ele(find(lon==lon105(2)),find(lat==lat105(2)))
ele(find(lon==lon105(3)),find(lat==lat105(3)))
ele(find(lon==lon105(4)),find(lat==lat105(4)))
ele(find(lon==lon105(5)),find(lat==lat105(5)))

ele(find(lon==lon106(1)),find(lat==lat106(1)))
ele(find(lon==lon106(2)),find(lat==lat106(2)))
ele(find(lon==lon106(3)),find(lat==lat106(3)))
ele(find(lon==lon106(4)),find(lat==lat106(4)))
ele(find(lon==lon106(5)),find(lat==lat106(5)))