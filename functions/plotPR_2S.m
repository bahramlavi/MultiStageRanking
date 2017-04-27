% plots
titleValue = 'Cumulative Matching Characteristic (CMC)';
fileNameEps = ['./Figures/' desc_name '_' ds_name '_' '_N' num2str(exp_num_people) '_S2.eps'];
fileNameFig = ['./Figures/' desc_name '_' ds_name '_' '_N' num2str(exp_num_people) '_S2.fig'];

legendPosition = 'southeast';

close all;
gcf = figure(1);
set(gcf,'PaperUnits','centimeters');
xSize = 13; ySize =7;%centimeters
set(gcf,'Position',[0 0 xSize*50 ySize*50])


hold on;

hyLabel = ylabel('Recognition Rate (%)');
hxLabel = xlabel('Rank (%)');
hTitle = title (titleValue);


if size(CMC3,2)==1
    h = plot (CMC3);
    set(h, ...
        'LineWidth' ,   3,...
        'Color'     ,   'r');
   str_legend=['Three-Stage', 'Original','2nd Stage','1st Stage'];
else
    for cmc=1:3
        col=['r' 'm' 'c'];
        h = plot (CMC3(:,cmc));
        set(h, ...
            'LineWidth' ,   3,...
            'Color'     ,   col(cmc));   
    end
end


h = plot (CMC3_org);
set(h, ...
    'LineWidth' ,   3,...
    'Color'     ,   'b');



h = plot (CMC2_org);
set(h, ...
    'LineWidth' ,   3,...
    'Color'     ,   'k');

% h = plot (CMC3);
% set(h, ...
%     'LineWidth' ,   3,...
%     'Color'     ,   'r');

ylim([CMC1_org(1) 100]);

hLegend = legend(['Two-Stage: Ratio=' num2str(ratios(1))],['Two-Stage: Ratio=' num2str(ratios(2))],['Two-Stage: Ratio=' num2str(ratios(3))], 'Original','1st Stage');

set(gca, 'FontName', 'AvantGarde');
set(gca, 'FontSize', 18);
set(gca, ...
  'Box'         , 'off'     , ...
  'TickDir'     , 'out'     , ...
  'TickLength'  , [.02 .02] , ...
  'XMinorTick'  , 'on'      , ...
  'YMinorTick'  , 'on'      , ...
  'XGrid'       , 'on'      , ...
  'YGrid'       , 'on'      , ...
  'XColor'      , [0 0 0], ...
  'YColor'      , [0 0 0], ...
  'XTick'       , [1:20:exp_num_people], ...
  'YTick'       , [0:20:100], ...
  'LineWidth'   , 0.5         );
set([hxLabel, hyLabel], 'FontName', 'AvantGarde');
set([hxLabel, hyLabel], 'FontSize', 18);
set([hxLabel, hyLabel], 'FontWeight', 'bold');

set(hLegend,'Location', legendPosition);


set(hTitle, 'FontName', 'AvantGarde');
set(hTitle, 'FontSize', 18);
set(hTitle, 'FontWeight', 'bold');


