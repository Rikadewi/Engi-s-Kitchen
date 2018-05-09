unit F15;

interface

uses bentukan;

procedure cariResep(var arrresep:tabresep);
	{
	I.S.: arresep terdefinisi
	F.S.: melakukan pencarian resep berdasarkan nama resep yang tersedia. Jika masukan nama resep ditemukan, maka program akan menampilkan nama resep dan nama bahan-bahan yang diperlukan dan harga jual resep tersebut. Jika tidak sesuai, maka program akan menampilkan pesan kesalahan. }
implementation
	procedure cariResep(var arrresep:tabresep);
	{KAMUS}
	var
		i, j : integer;
		resep: string;
		adaresep: boolean;
	{ALGORITMA}
	begin
		adaresep:=false;
		writeln('nama resep yang dicari: ');readln(resep);
		for i:= 1 to arrresep.neff do
		begin
			if (resep = arrresep.tab[i].nama) then
			begin
				writeln('nama resep: ', resep);
				writeln('harga jual resep: ', arrresep.tab[i].harga);
				writeln('jumlah bahan: ', arrresep.tab[i].n);
				for j:= 1 to arrresep.tab[i].n do
				begin
					writeln('bahan ', j, ' : ', arrresep.tab[i].bahan[j]);
				end;
				adaresep:= true;
			end;
		end;
		if (adaresep = false) then
		begin
			writeln('resep tidak ada')
		end;
	end;
end.