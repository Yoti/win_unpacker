@echo off
title ASUS by Yoti
echo Android System Unpacker Script by Yoti

echo Step 1: brotli.exe
rem https://github.com/google/brotli/releases/tag/v1.0.4
if exist "system.new.dat.br" (
	brotli.exe -d -o system.new.dat system.new.dat.br
	if exist "system.new.dat" (
		ren system.new.dat.br system.new.dat.br_done
	)
)

echo Step 2: sdat2img.exe
rem https://github.com/RealYoti/sdat2img/releases/tag/v1.0
if exist "system.new.dat" (
	if exist "system.transfer.list" (
		sdat2img.exe system.transfer.list system.new.dat system.img
		if exist "system.img" (
			ren system.new.dat system.new.dat_done
			ren system.transfer.list system.transfer.list_done
		)
	)
)

echo Step 3: ImgExtractor.exe
rem https://4pda.ru/forum/index.php?s=&showtopic=496786&view=findpost&p=38004733
if exist "system.img" (
	ImgExtractor.exe system.img system
	if exist "system" (
		ren system.img system.img_done
	)
)

pause
