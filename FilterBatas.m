A = imread('1.png');
F=rgb2gray(A);
Ukuran = size(F);
tinggi = Ukuran(1);
lebar = Ukuran(2);
G = F;
for baris=2 : tinggi-1
    for kolom=2 : lebar-1
        minPiksel = min([F(baris-1, kolom-1) ...
            F(baris-1, kolom) F(baris, kolom+1) ...
            F(baris, kolom-1) ...
            F(baris, kolom+1) F(baris+1, kolom-1) ...
            F(baris+1, kolom) F(baris+1, kolom+1)]);
        maksPiksel = min([F(baris-1, kolom-1) ...
            F(baris-1, kolom) F(baris, kolom+1) ...
            F(baris, kolom-1) ...
            F(baris, kolom+1) F(baris+1, kolom-1) ...
            F(baris+1, kolom) F(baris+1, kolom+1)]);
        if F(baris, kolom) < minPiksel
            G(baris, kolom) = minPiksel;
        else
            if F(baris, kolom) > maksPiksel
                G(baris, kolom) = maksPiksel;
            else
                G(baris, kolom) = F(baris, kolom);
            end
        end
    end
end
subplot(2,2,1);imshow(F);subplot(2,2,2);imhist(F);
subplot(2,2,3);imshow(G);subplot(2,2,4);imhist(G);
clear;
