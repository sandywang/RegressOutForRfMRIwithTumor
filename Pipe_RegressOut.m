ParentFunDir='FunImgARW'; % R-fMRI parent directory for all subjects
ParentTumorDir='T1Img'; % T1 parent directory for all subjects
PrefixOfTumorMask='wReslice_Tumor_Mask_'; % Prefix of tumor mask, should be prefix(subject_name).nii

GSPath='';
WMPath='WhiteMask_09_61x73x61.hdr';
CSFPath='CsfMask_07_61x73x61';

ParentHMDir='RealignParameter'; % Head motion parameters directory for all subjects
PrefixOfHMParameter='rp_arest.txt'; % Head motion file name

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
D=dir(fullfile(ParentFunDir, '*'));
D={D.name}';

for i=1:numel(D)
    fprintf('RegreeOut %s\n', D{i});

    Run_RegressOut({fullfile(ParentFunDir, D{i}, 'wrarest.nii')},...
        fullfile(ParentT1Dir, D{i}, [PrefixOfTumorMask, D{i}, '.nii']),...
        GSPath,...
        WMPath,...
        CSFPath,...
        4, {fullfile(ParentHMDir, D{i}, PrefixOfHMParameter)});
end

