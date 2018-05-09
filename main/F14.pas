unit F14;
interface
	uses bentukan;
	procedure lihatResep(var arrresep:tabresep);
	{
	I.S.: arresep terdefinisi
	F.S.: melihat daftar resep yang tersedia, termasuk semua daftar bahan penyusunnya. Daftar resep ditampilkan terurut membesar/mengecil berdasarkan nama resep. }
implementation
	procedure lihatResep(var arrresep:tabresep);
	{KAMUS}
	var
		i, j : integer;
		s : resep;
	{ALGORITMA}
	begin
		for i:=1 to arrresep.neff do
		begin
			for j:=1 to arrresep.neff - i do
			begin
				if (arrresep.tab[j].nama[1]>arrresep.tab[j+1].nama[1]) then
				begin
					s:=arrresep.tab[j];
					arrresep.tab[j]:=arrresep.tab[j+1];
					arrresep.tab[j+1]:=s;
				end;
			end;
		end;
		for i:=1 to arrresep.neff do
		begin
			writeln(i, '. nama resep: ', arrresep.tab[i].nama);
			writeln('   harga resep: ', arrresep.tab[i].harga);
			writeln('   bahan penyusun: ');
			for j:=1 to arrresep.tab[i].n do
			begin
				writeln('                   ', j, '. ', arrresep.tab[i].bahan[j]);
			end;
			if (arrresep.neff = 0) then
			begin
				writeln('resep kosong');
			end;
		end;
	end;
end.