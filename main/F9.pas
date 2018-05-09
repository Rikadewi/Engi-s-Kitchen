unit F9;
interface
	uses bentukan;
	procedure programMakan(var A:tabsimulasi;var B:jumlahAksi;i:integer);

implementation

procedure programMakan(var A:tabsimulasi;var B:jumlahAksi;i:integer);
{Prosedur untuk melakukan aksi makan, yaitu aksi yang dapat menambah energi sebanyak 3}
begin
	if (B.makan<=2)then {aksi maksimal sebanyak 3 kali}
	begin
		if (A.tab[i].energi<=7)then {bertambah sebanyak 3}
		begin
			A.tab[i].energi:=A.tab[i].energi+3;
			B.makan:=B.makan+1;
			writeln('Berhasil Makan!');
		end else if ((A.tab[i].energi=8)or(A.tab[i].energi=9))then {maksimal menjadi 10}
		begin
			A.tab[i].energi:=10;
			B.makan:=B.makan+1;
			writeln('Berhasil Makan!');
		end else {Energi > 9}
		begin
			writeln('Energi Penuh');
			B.makan:=B.makan+1;
		end;
	end else {aksi>2}
	begin
		writeln('Tidak Boleh Makan lagi untuk hari ini');
	end;
end;
end.


