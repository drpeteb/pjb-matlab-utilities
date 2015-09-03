function export_pdf( fig, filename, wid, hei, units )
%EXPORT_PDF Export figure as a pdf, sensibly.

% Defaults
if (nargin<5)||isempty(units)
    units = 'inches';
end

if (nargin<4)||isempty(wid)||isempty(hei)
    wid = 4;
    hei = 3;
end

if (nargin<2)||isempty(filename)||isempty(fig)
    error('Must specify filename and figure');
end

% set(gcf, 'Units', 'Inches');
% pos = get(gcf, 'Position');
% set(gcf, 'Position', [pos(1), pos(2), 0.9*wid, 0.9*hei]);

% Set size options
% set(fig, 'PaperOrientation', 'landscape');
set(fig, 'PaperUnits', units);
set(fig, 'PaperSize', [wid hei]);
set(fig, 'PaperPositionMode', 'manual');
set(fig, 'PaperPosition', [0 0 wid hei]);

% Set renderer for 2D simple images
set(fig, 'renderer', 'painters');

% % Make the surround white
% set(gcf,'color',[1 1 1]);

% Name of temporary file
tmp_file = 'temporary_eps_file_used_by_export_pdf.eps';

% Save it using pdf driver
print(fig, '-depsc2', tmp_file);

% % Convert it to a temporary eps
% print2eps(tmp_file, fig)

% Now convert to a pdf and delete the temporary file
eps2pdf(tmp_file, filename);
delete(tmp_file);

end

