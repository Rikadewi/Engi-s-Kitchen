unit F16;
interface
	uses bentukan;
	procedure tambahResep(var arrresep:tabresep;var arrmentah:tabMentah;var arrolah:tabOlah);
	{
	I.S.: arresep, arrmentah, arrolah terdefinisi
	F.S.: melakukan penambahan resep. Setiap resep dibuat dari minimum 2 buah bahan mentah/olahan yang ada (tidak boleh dari bahan yang tidak tersedia). Harga jual minimum adalah 12.5% lebih tinggi dari total harga bahan mentah dan olahan yang menyusunnya. Apabila terdapat desimal pada harga jual, dilakukan pembulatan ke atas }
implementation
	procedure tambahResep(var arrresep:tabresep;var arrmentah:tabMentah;var arrolah:tabOlah);
	{KAMUS}
	var
		i, j, hargabahan : integer;
		valid, namaresep , sudahada : boolean;
	{ALGORITMA}
	begin
		hargabahan:=0;
		repeat
			namaresep:=true;
			writeln('nama resep: ');readln(arrresep.tab[arrresep.neff + 1].nama);
			for i:=1 to arrresep.neff do
			begin
				if (arrresep.tab[i].nama = arrresep.tab[arrresep.neff + 1].nama) then
				begin
					namaresep:=false;
				end;
			end;
			if (namaresep = false) then
			begin
				writeln('nama bahan tersebut sudah ada, mohon tulis ulang nama bahan yang lain');
			end;
		until (namaresep = true);
		writeln('banyaknya bahan: ');readln(arrresep.tab[arrresep.neff + 1].n);
		while ((arrresep.tab[arrresep.neff + 1].n > 20) or (arrresep.tab[arrresep.neff + 1].n < 2)) do
		begin
			writeln('bahan resep tidak boleh kurang dari 2 atau lebih dari 20, mohon tulis ulang banyaknya bahan');
			writeln('banyaknya bahan: ');readln(arrresep.tab[arrresep.neff + 1].n);
		end;
		for i:=1 to arrresep.tab[arrresep.neff + 1].n do
		begin
			valid:=false;
			while (valid = false) do
			begin
				sudahada:=false;
				writeln('bahan ', i, ' : ');readln(arrresep.tab[arrresep.neff + 1].bahan[i]);
				for j:= 1 to i - 1 do
				begin
					if (arrresep.tab[arrresep.neff + 1].bahan[i] = arrresep.tab[arrresep.neff + 1].bahan[j]) then
					begin
						sudahada:=true;
					end;
				end;
				for j:= 1 to arrmentah.neff do
				begin
					if (arrmentah.tab[j].nama = arrresep.tab[arrresep.neff + 1].bahan[i]) and (sudahada = false) then
					begin
						hargabahan:= arrmentah.tab[j].harga + hargabahan;
						valid:=true;
					end;
				end;
				for j:=1 to arrolah.neff do
				begin
					if (arrolah.tab[j].nama = arrresep.tab[arrresep.neff + 1].bahan[i])and  (sudahada = false)then
					begin
						hargabahan:= arrolah.tab[j].harga + hargabahan;
						valid:=true;
					end;
				end;
				if (sudahada = true) then
				begin
					writeln('bahan tidak boleh sama');
				end;
				if (valid = false) and (sudahada = false) then
				begin
					writeln('bahan salah, mohon tulis kembali');
				end;
			end;
		end;
		if ((hargabahan * 1125) mod 100 > 0) then
		begin
			arrresep.tab[arrresep.neff + 1].harga:= ((hargabahan * 1125) div 100) + 1;
		end else
		begin
			arrresep.tab[arrresep.neff + 1].harga:= (hargabahan * 1125) div 100;
		end;
		arrresep.neff:= arrresep.neff + 1;
		writeln('tambah resep berhasil');
	end;
end.