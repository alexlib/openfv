% This function converts the calibration_results.mat file for refractive
% calibration to a calibration_results.txt file which can be used by the
% C++ refocusing code
%
% Usage: refrac_calib_mat2txt('path to folder just before calibration_result/ folder')
%
% Written by Abhishek Bajpayee

function refrac_calib_mat2txt(path)

load([path, 'calibration_result/calibration_results.mat']);

file = fopen([path 'calibration_result/calibration_results.txt'], 'w');

sizeP = size(P);
fprintf(file, '%d\n', sizeP(3));
for n=1:sizeP(3)
    
    fprintf(file, '%s\n', cam_names{n});
    
    for i=1:3
        for j=1:4
            fprintf(file, '%f\t', P(i,j,n));
        end
        fprintf(file, '\n');
    end
    
    for i=1:3
        fprintf(file, '%f\t', cam_params(i,n));
    end
    fprintf(file, '\n');
    
end
fprintf(file, '\n');

fprintf(file, '%f\t%f\t%f\t%f\t%f\n', selfcal.Zw, selfcal.t, selfcal.n1, selfcal.n2, selfcal.n3);

fprintf(file, '%d\t%d\t%f\n', selfcal.img_size_u, selfcal.img_size_v, calib_data.pixperphys);

fclose(file);

end