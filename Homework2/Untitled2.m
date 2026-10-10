[spike,nshift] = shiftdim(spike);
[xIsMatrix,autoFlag,maxlag,scaleType] = parseinput(spike,lfp{:});

if xIsMatrix,
        [c,M,N] = matrixCorr(spike);
else
        [c,M,N] = vectorXcorr(spike,autoFlag,lfp{:});
end

% Force correlation to be real when inputs are real
c = forceRealCorr(c,spike,autoFlag,lfp{:});


lags = -maxlag:maxlag;


% Keep only the lags we want and move negative lags before positive lags
if maxlag >= M,
        c = [zeros(maxlag-M+1,N^2);c(end-M+2:end,:);c(1:M,:);zeros(maxlag-M+1,N^2)];
else
        c = [c(end-maxlag+1:end,:);c(1:maxlag+1,:)];
end

% Scale as specified
c = scaleXcorr(c,xIsMatrix,scaleType,autoFlag,M,maxlag,lags,spike,lfp{:});

% If first vector is a row, return a row
c = shiftdim(c,-nshift);
