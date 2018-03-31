%
% This file is part of fastms.
% 
% Copyright 2014 Evgeny Strekalovskiy <evgeny dot strekalovskiy at in dot tum dot de> (Technical University of Munich)
% 
% fastms is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
% 
% fastms is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
% GNU General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with fastms. If not, see <http://www.gnu.org/licenses/>.
% 
    in_image = imread('../../images/dog.png');
    in_image = rgb2gray(in_image);

    out_image = fastms(in_image, 'weight', true, 'lambda', 0.5, 'alpha', 10,'engine',0);
    
    out_image2 = fastms(in_image, 'weight', true,'lambda', 2, 'alpha', -1,'engine',0,'stop_eps',1e-7,'iterations',50000);
    % show_images(in_image, out_image);    
    
    out.im_in = in_image;
    out.im_out = out_image;
    out.im_out2= out_image2;
    
    %% 
    
    rid = 230;
    cid = 225;
    cidm= 480;
    out.x = in_image(rid,cid:cidm);
    out.y = out_image(rid,cid:cidm);
    out.z = out_image2(rid,cid:cidm);
    figure(1);plot(out.x,'Color',[0.66 0.66 0.66],'LineWidth',1.5);hold on;plot(out.y,'LineWidth',3);
    plot(out.z,':','LineWidth',3);hold off;axis off;
    pbaspect([3 1 1])
    lgd = legend('True','Mumford-Shah','TV','Location','northwest','Orientation','horizontal');
    lgd.FontSize = 25;
    lgd.EdgeColor = 'w';
    saveas(gcf,'1dex','epsc')
    saveas(gcf,'1dex','fig')
    save('data.mat','out');
    
