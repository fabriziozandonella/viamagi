Get-ChildItem -Filter *.html -Recurse | ForEach-Object {
    $content = Get-Content $_.FullName -Raw
    
    # Sostituisce l'inizio dei percorsi inserendo la sottocartella
    $content = $content -replace 'href="/', 'href="/viamagi-static/'
    $content = $content -replace 'src="/', 'src="/viamagi-static/'
    
    # Sicurezza: rimuove eventuali raddoppi accidentali (es: /viamagi-static/viamagi-static/)
    $content = $content -replace '/viamagi-static/viamagi-static/', '/viamagi-static/'
    
    Set-Content $_.FullName -Value $content -NoNewline
}