@Echo off
mkdir c:\temp
Set "pastatemp=c:\temp"
Set "pastaprojeto=sts-4.16.0.RELEASE"
Set "url=https://download.springsource.com/release/STS4/4.16.0.RELEASE/dist/e4.25/spring-tool-suite-4-4.16.0.RELEASE-e4.25.0-win32.win32.x86_64.self-extracting.jar"
DEL /F /A c:\temp\sts.jar
RMDIR /S /Q %pastatemp%\%pastaprojeto%

SetLocal EnableDelayedExpansion
Set folder=%pastatemp%\sts.jar

echo Download: %url% 
echo para %folder%
echo Baixando ...
powershell.exe -Command (new-object System.Net.WebClient).DownloadFile('%url%','%folder%')

echo Dowmload Concluido!

echo Descompactando STS...
cd %pastatemp%
java -jar sts.jar > %pastatemp%\extracao-sts.log
echo Concluido!

echo Criando Link na area de trabalho da pasta ...
cd %userprofile%\Desktop
MKlink /j %pastaprojeto% %pastatemp%\%pastaprojeto%
echo Concluido!

echo Removendo Cache...
DEL /F /A c:\temp\sts.jar
echo Concluido!

pause
