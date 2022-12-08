
H = 0.35;
R=realize_fbm(H,10000);


figure(1);
plot(R(:,1), R(:,2));

steps = 5000;
runs = 6000;

%ens_msd = zeros(runs,steps);
%for i = 1:runs
%    ens_msd(i,:) = realize_fbm_norm(H,steps);
%end

%ens_msd = sum(ens_msd, 1)./runs;
%figure(2);
%plot(1:steps, ens_msd)

runsx = zeros(runs,steps);
for i = 1:runs
    runsx(i,:) = realize_fbm_1d(H,steps);
end

writematrix(runsx, 'fbmwalks_xaxis.txt')

runsy = zeros(runs,steps);
for i = 1:runs
    runsy(i,:) = realize_fbm_1d(H,steps);
end

writematrix(runsy, 'fbmwalks_yaxis.txt')

function R = realize_fbm(H,m)
    x = wfbm(H,m,10)';
    y = wfbm(H,m,10)';
    
    R=[x y]; %trajectory
end

function R = realize_fbm_1d(H,m)
    x = wfbm(H,m,10)';
    
    R=[x];
end

function R = realize_fbm_norm(H,m)
    x = wfbm(H,m,10)';
    y = wfbm(H,m,10)';
    
    R=[x.^2.+ y.^2]; %trajectory
end


