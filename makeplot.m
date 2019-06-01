function makeplot(sectors,rings,data,sizes,colors)
figure();
set(gcf,'color','white');
total = sum(sizes(1:rings));
sectorsize = 2*pi/sectors;
polarhistogram('NumBins',1,'FaceColor','white','FaceAlpha',1)
hold on;
ax = gca;
rticks([]);
thetaticks([]);
for sector = 1:sectors
    for ring = flip(1:rings)
        counts = zeros(sectors,1);
        counts(sector) = sum(sizes(1:ring));
        polarhistogram('BinEdges',0:sectorsize:2*pi,'BinCounts',counts ...
            ,'FaceColor',getcolor(ax,data(ring,sector),colors(sector)) ...
            ,'FaceAlpha',1)
    end
end