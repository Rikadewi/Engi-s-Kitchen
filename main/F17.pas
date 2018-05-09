unit F17;

interface

uses bentukan;

procedure upgradeInventori(var arrsim:tabsimulasi;nosim:integer);
	{
	I.S.: arrsim, nosim terdefinisi
	F.S.: melakukan perluasan kapasitas inventori. Jumlah perluasan setiap kali upgrade dilakukan adalah 25. Sebagai contoh, jumlah inventori awal adalah 25 sehingga pada saat dilakukan upgrade kapasitas bertambah menjadi 50}
implementation

	procedure upgradeInventori(var arrsim:tabsimulasi;nosim:integer);
	{ALGORITMA}
	begin
		if ((arrsim.tab[nosim].uang - 500) < 0) then
		begin
			writeln('uang kurang, upgrade inventori gagal!');
		end else
		begin
			arrsim.tab[nosim].maks:= arrsim.tab[nosim].maks + 25;
			arrsim.tab[nosim].klr:= arrsim.tab[nosim].klr + 500;
			arrsim.tab[nosim].uang:= arrsim.tab[nosim].uang - 500;
			writeln('upgrade inventori berhasil');
		end;
	end;
end.