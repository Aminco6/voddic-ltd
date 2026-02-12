@echo off
title Product JSON Combiner - FINAL
echo ========================================
echo    PRODUCT JSON COMBINER - FINAL
echo ========================================
echo.

del products.json 2>nul
echo Creating new products.json file...
echo [ > products.json
set first=1

for %%f in (*.json) do (
    if not "%%f"=="products.json" (
        echo Processing: %%f
        
        if !first!==0 (
            echo , >> products.json
        ) else (
            set first=0
        )
        
        :: Read and append JSON
        type "%%f" >> products.json
    )
)

echo ] >> products.json

echo.
echo ========================================
echo    ✅ SUCCESS! Products combined
echo    📁 Output: products.json
echo ========================================
echo.

:: Clean up the file to ensure proper format
powershell -Command "(Get-Content products.json -Raw) -replace '}{', '},{' | Set-Content products.json"

echo Final check - Number of products:
powershell -Command "$json = Get-Content products.json -Raw | ConvertFrom-Json; Write-Host '   Found ' $json.Count 'products' -ForegroundColor Green"

echo.
pause