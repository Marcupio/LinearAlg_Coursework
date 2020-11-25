% approxhelper.m
%
% This script does the training, following LearnSchedule.

for i = 1:Inf

  if epoch >= sum(LearnSchedule(1:sched_pointer,1))
    sched_pointer = sched_pointer + 1;
    if sched_pointer > size(LearnSchedule,1), return, end
    end
  LearnRate = LearnSchedule(sched_pointer,2);
  epoch = epoch+1;

  bp_innerloop

  if rem(epoch-1,10) == 0
      PlotApprox(Patterns,Result1,Desired,Result2);
      fprintf('Epoch %4d:  Error = %f\n',epoch,TSS);
      drawnow
     end

  if TSS < TSS_Limit, break, end

  end
