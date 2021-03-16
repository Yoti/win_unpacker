@echo off
title AVUS by Yoti
echo Android Vendor Unpacker Script by Yoti

echo Step 1: brotli.exe
rem https://github.com/google/brotli/releases/tag/v1.0.4
if exist "vendor.new.dat.br" (
	brotli.exe -d -o vendor.new.dat vendor.new.dat.br
	if exist "vendor.new.dat" (
		ren vendor.new.dat.br vendor.new.dat.br_done
	)
)

echo Step 2: sdat2img.exe
rem https://github.com/RealYoti/sdat2img/releases/tag/v1.0
if exist "vendor.new.dat" (
	if exist "vendor.transfer.list" (
		sdat2img.exe vendor.transfer.list vendor.new.dat vendor.img
		if exist "vendor.img" (
			ren vendor.new.dat vendor.new.dat_done
			ren vendor.transfer.list vendor.transfer.list_done
		)
	)
)

echo Step 3: ImgExtractor.exe
rem https://4pda.ru/forum/index.php?s=&showtopic=496786&view=findpost&p=38004733
if exist "vendor.img" (
	ImgExtractor.exe vendor.img vendor
	if exist "vendor" (
		ren vendor.img vendor.img_done
	)
)

pause
