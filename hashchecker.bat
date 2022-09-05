@ECHO OFF
color 0a
title SHA-512 Checksum
echo Github Repository: https://github.com/kntjspr/SHA1-Checksum-Verifier


set /p htype=Enter Hash Type (MD5/SHA1/SHA256/SHA512):

goto %htype%

:md5
set /p original=Enter MD5 Hash:
certutil -hashfile %1 md5 | find /i /v "md5" | find /i /v "certutil" >> checksum.txt
goto check

:sha512
set /p original=Enter SHA-512 Hash:
certutil -hashfile %1 sha512 | find /i /v "sha512" | find /i /v "certutil" >> checksum.txt
goto check

:sha256
set /p original=Enter SHA-256 Hash:
certutil -hashfile %1 sha256 | find /i /v "sha256" | find /i /v "certutil" >> checksum.txt
goto check

:sha1
set /p original=Enter SHA-1 Hash:
certutil -hashfile %1 sha1 | find /i /v "sha1" | find /i /v "certutil" >> checksum.txt
goto check

:check
set /P checksum=<checksum.txt
del checksum.txt
if "%checksum%"=="%original%" (goto run) else (goto fail)

:fail
echo Input: %original%
echo Result: %checksum%
echo Checksum bad
pause
exit

:run
echo Input: %original%
echo Result: %checksum%
echo Checksum good
PAUSE
exit
