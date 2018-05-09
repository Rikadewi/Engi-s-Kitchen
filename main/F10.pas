unit F10;
interface
	uses bentukan;
	procedure programIstirahat(var A:tabsimulasi;var B:jumlahAksi;i:integer);

implementation

procedure programIstirahat(var A:tabsimulasi;var B:jumlahAksi;i:integer);
{Program untuk melakukan kegiatan istirahat yang dapat menambah energi sebanyak 1}
begin
	if (B.istirahat<=5)then {hanya bisa dilakukan maksimal 6 kali}
	begin
		if (A.tab[i].energi<=9)then {bertambah 1} 
		begin
			A.tab[i].energi:=A.tab[i].energi+1;
			B.istirahat:=B.istirahat+1;
			writeln('Berhasil istirahat!');
		end else {Energi > 9}
		begin
			writeln('Energi Penuh');
			B.istirahat:=B.istirahat+1;
		end;
	end else {aksi>5}
	begin
		writeln('Tidak Boleh Istirahat lagi untuk hari ini');
	end;
end;
end.
	
		