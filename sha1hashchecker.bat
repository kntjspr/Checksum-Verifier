@ECHO OFF
color 0a
title SHA-1 Checksum
echo Github Repository: https://github.com/kntjspr/SHA1-Checksum-Verifier
set /p original=Enter SHA-1 Hash:
certutil -hashfile %1 sha1 | find /i /v "sha1" | find /i /v "certutil" >> checksum.txt
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
