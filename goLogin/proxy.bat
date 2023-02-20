@echo off
if exist "%cd%\Data\%~n0" (
	start "" "%cd%\App\chrome.exe" --disable-background-networking --enable-features=NetworkService,NetworkServiceInProcess --disable-background-timer-throttling --disable-backgrounding-occluded-windows --disable-breakpad --disable-client-side-phishing-detection --disable-dev-shm-usage --disable-features=Translate --disable-hang-monitor --disable-ipc-flooding-protection --disable-popup-blocking --disable-prompt-on-repost --disable-renderer-backgrounding --disable-sync --force-color-profile=srgb --metrics-recording-only --no-first-run --password-store=basic --use-mock-keychain --enable-blink-features=IdleDetection --export-tagged-pdf --user-data-dir="%cd%\Data\%~n0" --lang=en-US --disable-encryption --font-masking-mode=2 --proxy-server=socks5://168.158.172.52:12324 --host-resolver-rules="MAP * 0.0.0.0 , EXCLUDE 168.158.172.52" --flag-switches-begin --flag-switches-end &
exit	
) else (
	echo ------
	echo Khong ton tai thu muc profile ten "%~n0" ben trong folder Data
	echo ------
	pause
)
