%% Bias Data 10-14
calib001bi= rfits('calib-001-bi.fit');
bias001= calib001bi.data; 

calib002bi= rfits('calib-002-bi.fit');
bias002= calib002bi.data;

calib003bi= rfits('calib-003-bi.fit');
bias003= calib003bi.data;

calib004bi= rfits('calib-004-bi.fit');
bias004= calib004bi.data;

calib005bi= rfits('calib-005-bi.fit');
bias005= calib005bi.data;

calib006bi= rfits('calib-006-bi.fit');
bias006= calib006bi.data;

calib007bi= rfits('calib-007-bi.fit');
bias007= calib007bi.data;

% Master bias 10-14
combi14= cat(3,bias001,bias002,bias003,bias004,bias005,bias006,bias007);
masterbias14= median(combi14,3);
wfits(masterbias14,'MasterBias1014.fit');

%% Dark Data 10-14
calibd00114= rfits('14calib-001-d.fit');
dark00114= calibd00114.data;

calibd00214= rfits('14calib-002-d.fit');
dark00214= calibd00214.data;

calibd00314= rfits('14calib-003-d.fit');
dark00314= calibd00314.data;

calibd00414= rfits('14calib-004-d.fit');
dark00414= calibd00414.data;

calibd00514= rfits('14calib-005-d.fit');
dark00514= calibd00514.data;

calibd00614= rfits('14calib-006-d.fit');
dark00614= calibd00614.data;

calibd00714= rfits('14calib-007-d.fit');
dark00714= calibd00714.data;

%% Master Dark 10-14
dark114= dark00114-masterbias14;
dark214= dark00214-masterbias14;
dark314= dark00314-masterbias14;
dark414= dark00414-masterbias14;
dark514= dark00514-masterbias14;
dark614= dark00614-masterbias14;
dark714= dark00714-masterbias14;
    comd= cat(3,dark114,dark214,dark314,dark414,dark514,dark614,dark714);
    masterdark14= median(comd,3);
    wfits(masterdark14,'MasterDark1014.fit');

%% Flat Data 10-14

% ha filter
haflat00114= rfits('14flats-001-ha.fit');
ha00114= haflat00114.data;

haflat00214= rfits('14flats-002-ha.fit');
ha00214= haflat00214.data;

haflat00314= rfits('14flats-003-ha.fit');
ha00314= haflat00314.data;

haflat00414= rfits('14flats-004-ha.fit');
ha00414= haflat00414.data;

haflat00514= rfits('14flats-005-ha.fit');
ha00514= haflat00514.data;

haflat00614= rfits('14flats-006-ha.fit');
ha00614= haflat00614.data;

haflat00714= rfits('14flats-007-ha.fit');
ha00714= haflat00714.data;

% o filter 
oflat00114= rfits('14flats-001-o.fit');
o00114= oflat00114.data;

oflat00214= rfits('14flats-002-o.fit');
o00214= oflat00214.data;

oflat00314= rfits('14flats-003-o.fit');
o00314= oflat00314.data;

oflat00414= rfits('14flats-004-o.fit');
o00414= oflat00414.data;

oflat00514= rfits('14flats-005-o.fit');
o00514= oflat00514.data;

oflat00614= rfits('14flats-006-o.fit');
o00614= oflat00614.data;

oflat00714= rfits('14flats-007-o.fit');
o00714= oflat00714.data;

%% 
newdarkha= masterdark14*(15/300);
haflat114= ha00114-masterbias14-newdarkha;
haflat214= ha00214-masterbias14-newdarkha;
haflat314= ha00314-masterbias14-newdarkha;
haflat414= ha00414-masterbias14-newdarkha;
haflat514= ha00514-masterbias14-newdarkha;
haflat614= ha00614-masterbias14-newdarkha;
haflat714= ha00714-masterbias14-newdarkha;
    comd3= cat(3,haflat114,haflat214,haflat314,haflat414,haflat514,haflat614,haflat714);
    hamasterflat14= median(comd3,3);
    wfits(hamasterflat14,'HaMasterFlat1014.fit');

newdarko= masterdark14*(20/300);
oflat114= o00114-masterbias14-newdarko;
oflat214= o00214-masterbias14-newdarko;
oflat314= o00314-masterbias14-newdarko;
oflat414= o00414-masterbias14-newdarko;
oflat514= o00514-masterbias14-newdarko;
oflat614= o00614-masterbias14-newdarko;
oflat714= o00714-masterbias14-newdarko;
    comd4= cat(3,oflat114,oflat214,oflat314,oflat414,oflat514,oflat614,oflat714);
    omasterflat14= median(comd4,3);
    wfits(omasterflat14,'OMasterFlat1014.fit');

%% Normalizing and apply to science images

avgOflat14= mean(omasterflat14(:));
avgHaflat14= mean(hamasterflat14(:));
NormalOflat14= omasterflat14/avgOflat14;
NormalHaflat14= hamasterflat14/avgHaflat14;

wfits(NormalHaflat14,'NormalhaflatO14.fit');

%% 10-14 Science images

NGC24614ha1= rfits('14NGC2461ha.fit');
NGC14ha1= NGC24614ha1.data;
NGC24614o1= rfits('14NGC2461o.fit');
NGC14o1= NGC24614o1.data;

NGC24614ha2= rfits('14NGC2462ha.fit');
NGC14ha2= NGC24614ha2.data;
NGC24614o2= rfits('14NGC2462o.fit');
NGC14o2= NGC24614o1.data;

NGC24614ha3= rfits('14NGC2463ha.fit');
NGC14ha3= NGC24614ha3.data;
NGC24614o3= rfits('14NGC2463o.fit');
NGC14o3= NGC24614o3.data;

%% Applying

ONGC141 = NGC14o1 - masterbias14 - masterdark14;
HaNGC141 = NGC14ha1 - masterbias14 - masterdark14;

ONGC142 = NGC14o2 - masterbias14 - masterdark14;
HaNGC142 = NGC14ha2 - masterbias14 - masterdark14;

ONGC143 = NGC14o3 - masterbias14 - masterdark14;
HaNGC143 = NGC14ha3 - masterbias14 - masterdark14;

HaNGC141Science = HaNGC141./NormalHaflat14;
ONGC141Science = ONGC141./NormalOflat14;

HaNGC142Science = HaNGC142./NormalHaflat14;
ONGC142Science = ONGC142./NormalOflat14;

HaNGC143Science = HaNGC143./NormalHaflat14;
ONGC143Science = ONGC143./NormalOflat14;

wfits(HaNGC141Science,'1ha141.fit');
wfits(ONGC141Science,'1o141.fit');
wfits(HaNGC142Science,'2ha141.fit');
wfits(ONGC142Science,'2o141.fit');
wfits(HaNGC143Science,'3ha141.fit');
wfits(ONGC143Science,'3o141.fit');

%% Coadding science images

% o 

NGCo1= rfits('1o141.fit');
NGCo2= rfits('2o141.fit');
NGCo3= rfits('3o141.fit');
NGC14o1= NGCo1.data;
NGC14o2= NGCo2.data;
NGC14o3= NGCo3.data;
    NGCo1shift= imshift(NGC14o1,-1,2);
    NGCo3shift= imshift(NGC14o3,25,0);
    Coadd14o= NGCo1shift+NGC14o2+NGCo3shift;
    wfits(Coadd14o,'NGC14o.fit');

% ha 

NGCha1= rfits('1ha141.fit');
NGCha2= rfits('2ha141.fit');
NGCha3= rfits('3ha141.fit');
NGC14ha1= NGCha1.data;
NGC14ha2= NGCha2.data;
NGC14ha3=NGCha3.data;
    NGCha1shift= imshift(NGC14ha1,-21,4);
    NGCha3shift= imshift(NGC14ha3,8,-1);
    Coadd14ha= NGCha1shift+NGC14ha2+NGCha3shift;
    wfits(Coadd14ha,'NGC14ha.fit');

%% Aperture Photometry 

% ha filter
NGC14ha= rfits('NGC14ha.fit');
    figure(1) % Left star
    [flux,err]= aperE(NGC14ha.data,433.35,907.34,11,9.8,4.5,5,13,13,1/2.5999);
    colorbar

    figure(2) % Middle star
    [flux,err]= aperE(NGC14ha.data,496.448,1020.744,11.7,11.7,9.3,6.2,15,15,1/2.5999);

    figure(3) % Right star
    [flux,err]= aperE(NGC14ha.data,404.864,1218.736,9,9,5.5,5.5,13.5,13.5,1/2.5999);


% o filter
NGC14o= rfits('NGC14o.fit');
    figure(5) % Left star
    [flux,err]= aperE(NGC14o.data,436.696,919.064,11.5,10.5,7,6.5,13.5,13.5,1/2.5999);
    colorbar

    figure(6) % Middle star
    [flux,err]= aperE(NGC14o.data,498.178,1032.84,10.2,10.2,8,6.5,13.8,13.8,1/2.5999);

    figure(7) % Right star
    [flux,err]= aperE(NGC14o.data,409.048,1229.1,9,9,5.5,5.5,14,14,1/2.5999);

%% Nebula Aperture ha New Pixels

image_thresholded = zeros(size(Coadd14ha));
for ii=1:size(Coadd14ha,1);
    for jj=1:size(Coadd14ha,2);
        pixel = Coadd14ha(ii,jj);
            if pixel<180
                new_pixel=0;
            else
                new_pixel = pixel;
            end
            
            image_thresholded(ii,jj)= new_pixel;
    end
end

wfits(image_thresholded, 'AdjustedNGCHA.fit');

NewPixelha= rfits('AdjustedNGCHA.fit');
NewPixelNGCha= NewPixelha.data;
    figure(4) % Whole Nebula (before star subraction)
    [flux,err]= aperE(NewPixelNGCha,500.7,1033.85,263,309,254.35,285.4,265,325,1/2.5999);
    colorbar; 
%% Nebula Aperture o New Pixels

image_thresholded = zeros(size(Coadd14o));
for ii=1:size(Coadd14o,1)
    for jj=1:size(Coadd14o,2)
        pixel = Coadd14o(ii,jj);
            if pixel<200
                new_pixel=0;
            else
                new_pixel = pixel;
            end
            
            image_thresholded(ii,jj)= new_pixel;
    end
end

wfits(image_thresholded, 'AdjustedNGCHO.fit');

NewPixelo= rfits('AdjustedNGCHO.fit');
NewPixelNGCo= NewPixelo.data;
    figure(8) % Whole Nebula (before star subtraction)
    [flux,err]= aperE(NewPixelNGCo,506.023,1064.598,270,312,262.79,288,279,327,1/2.5999);
    colorbar;
    
%% Deviation of Aperture

TargetRadiiHaVertical= [275,280,265,278,283];
stdevHaVert= std(TargetRadiiHaVertical);
TargetRadiiHaHoriz= [254,260,258,250,252];
stdevHaHoriz= std(TargetRadiiHaHoriz);
    
TargetRadiiOVert= [288,292,296,299,287];
stdevOVert= std(TargetRadiiOVert);
TargetRadiiOHoriz= [262,263,260,258,265];
stdevOHoriz= std(TargetRadiiOHoriz);
