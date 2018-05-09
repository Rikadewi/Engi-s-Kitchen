unit F13;
interface
    uses bentukan;
    procedure lihatInventori(var arrMentah : tabiMentah; arrOlah : tabiOlah);
	{ 
	I.S.: arrmentah, arrolah terdefinisi
	F.S.: menampilkan data daftar bahan mentah dan bahan olahan yang tersedia di inventori saat ini. Daftar bahan mentah dan daftar bahan olahan ditampilkan terurut membesar/mengecil menurut nama bahan. }
implementation
    procedure lihatInventori(var arrMentah : tabiMentah; arrOlah : tabiOlah);
	{KAMUS}
	var
        i, j: integer;
		tabInv	: tabIn;
		s : Inv;
    {ALGORITMA}
	begin
		tabInv.neff:= arrMentah.neff + arrOlah.neff;
        for i:= 1 to arrMentah.neff do
        begin
			tabInv.tab[i].nama:= arrMentah.tab[i].nama;
			tabInv.tab[i].jenis:= 'mentah';
			tabInv.tab[i].tgl:= arrMentah.tab[i].tgl;
			tabInv.tab[i].jml:= arrMentah.tab[i].jml;
		end;
        for i:= arrMentah.neff + 1 to tabInv.neff do
        begin
			tabInv.tab[i].nama:= arrOlah.tab[i - arrMentah.neff].nama;
			tabInv.tab[i].jenis:= 'olahan';
			tabInv.tab[i].tgl:= arrOlah.tab[i - arrMentah.neff].tgl;
			tabInv.tab[i].jml:= arrOlah.tab[i - arrMentah.neff].jml;
        end;
		for i:=1 to tabInv.neff do
		begin
			for j:=1 to tabInv.neff - i do
			begin
				if (tabInv.tab[j].nama>tabInv.tab[j+1].nama) then
				begin
					s:=tabInv.tab[j];
					tabInv.tab[j]:=tabInv.tab[j+1];
					tabInv.tab[j+1]:=s;
				end;
			end;
		end;
		for i:=1 to tabInv.neff do
		begin
			writeln(i, '. nama bahan: ', tabInv.tab[i].nama);
			writeln('   jenis bahan: ', tabInv.tab[i].jenis);
			writeln('   tanggal pembelian: ', tabInv.tab[i].tgl.day, '/', tabInv.tab[i].tgl.month, '/', tabInv.tab[i].tgl.year);
			writeln('   jumlah bahan: ', tabInv.tab[i].jml);
		end;
		if (tabInv.neff = 0) then
		begin
			writeln('inventori kosong');
		end;
    end;
end.
