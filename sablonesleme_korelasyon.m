clc;
clear all;



%kaçtane e?le?me buldu?umuzu görmek için
pozDegerSayisi = 0;
pozDegerler = zeros(50,1);
cerceveSayisi =0;

temp = imread('marcelo.jpg');
list = imread('realmadrid.jpg');

tempG = rgb2gray(temp);
listG = rgb2gray(list);

[sat,sut] =size(listG);
[tx, ty] = size(tempG);

%kaynak görüntünün geni?lik ve uzunluk say?s?n? buluyoruz
% gezme i?lemini sat?r ve sütün say?s?na göre yap?yoruz.
%template göre li ste üzerine çerçeve olu?turaca??z e?er positif bir e?le?me
%kar??la??rsak e?le?tirece?iz

figure(1);  imshow(tempG);
hold on;
for i = 1:sat
    for j =1:sut
               if(i+tx<=sat && j+ty<=sut)
                    araCerceve = listG(i:i+(tx-1),j:j+(ty-1)); 
                    % 1:99 a kadar piksel de?erlerini almam?z gerekiyor
                    % j = 1 >> 1:1+(99-1) = 1:99
                    % j = 2 >> 2:2+(99-1) = 2:100
                    % j = 3 >> 3:3+(99-1) = 3:101
                    bGrayKatsayi = corr2(tempG,araCerceve);
                    cerceveSayisi = cerceveSayisi + 1;
                    if bGrayKatsayi > 0.45
                        pozDegerSayisi = pozDegerSayisi+1;
                        pozDegerler(pozDegerSayisi,1) = bGrayKatsayi;
                        bx = [i i       i+tx    i+tx    i];
                        by = [j j+ty j+ty   j           j];  
                        plot(by,bx,'r','LineWidth',1)
                    end
               end
               disp(['i=' num2str(i) ' -- j=' num2str(j) '-- cerceve no=' num2str(cerceveSayisi) '-- katsayi=' num2str(bGrayKatsayi)])
    end
end
figure(1); imshow(listG)




