# Download-Skript für Rezept-Bilder
# Führe dieses Skript aus dem Ordner "Rezepte\bilder\" aus
# oder passe $dest entsprechend an.

$dest = $PSScriptRoot

$images = @(
    @{ file = "party-filet.jpg";                              url = "https://api.swissmilk.ch/wp-content/uploads/2021/08/SM2021_DIVE_14_Partyfilet-scaled-1-scaled.jpg" },
    @{ file = "coq-au-vin.jpg";                               url = "https://www.gutekueche.at/storage/media/recipe/164075/conv/coq-au-vin-default.jpg" },
    @{ file = "roastbeef-nature.jpg";                         url = "https://www.gutekueche.at/storage/media/recipe/12523/conv/roastbeef-default.jpg" },
    @{ file = "cordon-bleu.jpg";                              url = "https://www.gutekueche.at/storage/media/recipe/134960/conv/cordon-bleu-default.jpg" },
    @{ file = "apfelwaehe.jpg";                               url = "https://www.gutekueche.at/storage/media/recipe/50253/conv/apfelwahe-default.jpg" },
    @{ file = "birchermuesli.jpg";                            url = "https://www.gutekueche.at/storage/media/recipe/163649/conv/bircher-muesli-default.jpg" },
    @{ file = "rahmschnitzel.jpg";                            url = "https://www.gutekueche.at/storage/media/recipe/12498/conv/rahmschnitzel-default.jpg" },
    @{ file = "filet-wellington.jpg";                         url = "https://www.gutekueche.at/storage/media/recipe/12530/conv/filet-wellington-default.jpg" },
    @{ file = "grosis-sauerbraten.jpg";                       url = "https://www.gutekueche.at/storage/media/recipe/166139/conv/sauerbraten-default.jpg" },
    @{ file = "bolognese-sauce.jpg";                          url = "https://www.gutekueche.at/storage/media/recipe/14375/conv/sauce-bolognese-default.jpg" },
    @{ file = "roesti.jpg";                                   url = "https://www.gutekueche.at/storage/media/recipe/168436/conv/roesti-default.jpg" },
    @{ file = "ossobuco.jpg";                                 url = "https://www.gutekueche.at/storage/media/recipe/28882/conv/ossobuco-default.jpg" },
    @{ file = "polenta.jpg";                                  url = "https://www.gutekueche.at/storage/media/recipe/135667/conv/polenta-grundrezept-default.jpg" },
    @{ file = "gratin-dauphinois.jpg";                        url = "https://www.gutekueche.at/storage/media/recipe/26869/conv/gratin-dauphinois-default.jpg" },
    @{ file = "gerstensuppe.jpg";                             url = "https://www.gutekueche.at/storage/media/recipe/14953/conv/gerstensuppe-default.jpg" },
    @{ file = "marronisuppe.jpg";                             url = "https://api.swissmilk.ch/wp-content/uploads/2023/09/KB_SP2004_012_Marronisuppe-2560x1708.jpg" },
    @{ file = "ghackets-und-hoernli.jpg";                     url = "https://api.swissmilk.ch/wp-content/uploads/2019/09/LM200903_89-2560x1707.jpg" },
    @{ file = "gemuese-lasagne.jpg";                          url = "https://www.gutekueche.at/storage/media/recipe/130050/conv/gemuselasagne-default.jpg" },
    @{ file = "glasierte-karotten.jpg";                       url = "https://www.gutekueche.at/storage/media/recipe/166698/conv/glasierte-karotten-default.jpg" },
    @{ file = "pouletspiessli-mit-erdnuss-sauce.jpg";         url = "https://www.gutekueche.at/storage/media/recipe/31943/conv/chicken-sate-default.jpg" },
    @{ file = "saltimbocca-filet.jpg";                        url = "https://www.gutekueche.at/storage/media/recipe/103462/conv/saltimbocca-alla-romana-default.jpg" },
    @{ file = "bearnaise-sauce.jpg";                          url = "https://www.gutekueche.at/storage/media/recipe/8710/conv/sauce-bearnaise-sauce-bernaise-default.jpg" },
    @{ file = "hackfleisch-burger.jpg";                       url = "https://www.gutekueche.at/storage/media/recipe/128264/conv/burger-patties-default.jpg" },
    @{ file = "gemueseterrine-im-rueeblimantel.jpg";          url = "https://api.swissmilk.ch/wp-content/uploads/2019/06/gemueseterrine-mit-kraeuter-vinaigrette-2560x2042.jpg" },
    @{ file = "kartoffel-lauch-gratin.jpg";                   url = "https://www.gutekueche.at/storage/media/recipe/163278/conv/kartoffelgratin-mit-lauch-default.jpg" },
    @{ file = "kartoffelgratin-mit-lauch-und-steinpilzen.jpg"; url = "https://www.gutekueche.at/storage/media/recipe/125910/conv/kartoffelgratin-mit-steinpilzen-default.jpg" },
    @{ file = "poulet-satay-mit-erdnusssauce.jpg";            url = "https://api.swissmilk.ch/wp-content/uploads/2019/06/satay-spiessli-vom-grill-auf-fruehlingsgemuese-2560x1707.jpg" },
    @{ file = "avocado-lachs-creme.jpg";                      url = "https://www.gutekueche.at/storage/media/recipe/26255/conv/avocado-lachs-creme-default.jpg" },
    @{ file = "leckerli-mousse.jpg";                          url = "https://api.swissmilk.ch/wp-content/uploads/2019/06/laeckerli-parfait-1920x2560.jpg" },
    @{ file = "entrecotes-mit-avocadobutter.jpg";             url = "https://www.gutekueche.at/storage/media/recipe/25706/conv/entrecote-default.jpg" },
    @{ file = "chateaubriand-mit-curry-orangenbutter.jpg";    url = "https://api.swissmilk.ch/wp-content/uploads/2022/04/LM20160708_10_Chateaubriand-scaled-1-scaled.jpg" },
    @{ file = "forellentatar.jpg";                            url = "https://api.swissmilk.ch/wp-content/uploads/2019/06/randen-ingwer-suppe-mit-forellentatar-1646x2560.jpg" },
    @{ file = "kalbskoteletts-mit-morchelfuellung.jpg";       url = "https://api.swissmilk.ch/wp-content/uploads/2019/06/gefuellte-kalbskoteletts.jpg" },
    @{ file = "kartoffelkuechlein.jpg";                       url = "https://api.swissmilk.ch/wp-content/uploads/2019/06/kartoffelkuechlein-party.jpg" },
    @{ file = "gefuelltes-pouletbruestli.jpg";                url = "https://api.swissmilk.ch/wp-content/uploads/2019/06/pouletbruestchen-mit-morchelfuellung-1920x2560.jpg" },
    @{ file = "pochierte-eier-im-nudelnest.jpg";              url = "https://api.swissmilk.ch/wp-content/uploads/2023/01/KO2022_SBLV_42_Pochierte_Eier-2560x1707.jpg" },
    @{ file = "bratkartoffeln-a-la-provencale.jpg";           url = "https://api.swissmilk.ch/wp-content/uploads/2019/06/bratkartoffeln-mit-baerlauch-spinat-2560x1920.jpg" },
    @{ file = "russischer-sommersalat.jpg";                   url = "https://www.gutekueche.at/storage/media/recipe/41092/conv/russischer-salat-default.jpg" },
    @{ file = "gemuesewaehe.jpg";                             url = "https://api.swissmilk.ch/wp-content/uploads/2021/01/SM2020_DIVE_61_Gemuesewaehe.jpg" },
    @{ file = "ricotta-zitronen-ravioli.jpg";                 url = "https://api.swissmilk.ch/wp-content/uploads/2022/01/Ricotta-Spinat-Ravioli_SM2021_DIVE87.jpg" },
    @{ file = "pilztarte-mit-feldsalat.jpg";                  url = "https://www.gutekueche.at/storage/media/recipe/30694/conv/pilztarte-default.jpg" },
    @{ file = "gratin-aus-rohen-kartoffeln-mit-zucchini.jpg"; url = "https://api.swissmilk.ch/wp-content/uploads/2019/06/kartoffel-zucchini-gratin-scaled.jpg" },
    @{ file = "kartoffel-curry.jpg";                          url = "https://www.gutekueche.at/storage/media/recipe/20124/conv/kartoffel-curry-default.jpg" },
    @{ file = "osterlaemmchen.jpg";                           url = "https://www.gutekueche.at/storage/media/recipe/25361/conv/osterlaemmchen-default.jpg" },
    @{ file = "kartoffel-speck-gratin.jpg";                   url = "https://www.gutekueche.at/storage/media/recipe/26982/conv/kartoffelgratin-mit-speck-default.jpg" },
    @{ file = "gefuelltes-schweinsfilet.jpg";                 url = "https://www.gutekueche.at/storage/media/recipe/19126/conv/herzhaftes-schweinsfilet-default.jpg" },
    @{ file = "kartoffelstock.jpg";                           url = "https://api.swissmilk.ch/wp-content/uploads/2019/06/kartoffelstock-rueebli-taetschli-2560x1707.jpg" },
    @{ file = "gebratene-spargeln-mit-kartoffeln-und-spiegelei.jpg"; url = "https://www.gutekueche.at/storage/media/recipe/26224/conv/spargel-mit-spiegelei-default.jpg" },
    @{ file = "kalbskotelett-mit-spinatkartoffeln.jpg";       url = "https://www.gutekueche.at/storage/media/recipe/20787/conv/kalbskotelett-default.jpg" },
    @{ file = "fruechtegratin.jpg";                           url = "https://www.gutekueche.at/storage/media/recipe/167820/conv/topfengratin-mit-fruechten-default.jpg" },
    @{ file = "coq-au-porto.jpg";                             url = "https://www.gutekueche.at/storage/media/recipe/101638/conv/coq-au-vin-veltliner-default.jpg" },
    @{ file = "bettys-sommer-muesli.jpg";                     url = "https://api.swissmilk.ch/wp-content/uploads/2020/05/SM2020_DIVE_21_Bircherm%C3%BCesli-mit-Beeren-scaled.jpg" },
    @{ file = "zanderpaeckli.jpg";                            url = "https://www.gutekueche.at/storage/media/recipe/168485/conv/gebratener-zander-mit-knoblauch-default.jpg" },
    @{ file = "fenchelsuppchen-en-croute.jpg";                url = "https://api.swissmilk.ch/wp-content/uploads/2021/12/LM200501_53_A-scaled.jpg" },
    @{ file = "huehnchen-salat-im-blaetterteig-koerbchen.jpg"; url = "https://www.gutekueche.at/storage/media/recipe/14786/conv/huehnersalat-default.jpg" },
    @{ file = "apfel-glace.jpg";                              url = "https://api.swissmilk.ch/wp-content/uploads/2019/06/apfelglace-mit-rosmarin-an-balsamico-sauce-2311x2560.jpg" },
    @{ file = "aargauer-braten-alla-grill-ueli.jpg";          url = "https://www.gutekueche.at/storage/media/recipe/31923/conv/krustenbraten-default.jpg" },
    @{ file = "oster-parfait.jpg";                            url = "https://www.gutekueche.at/storage/media/recipe/30232/conv/mascarpone-parfait-mit-himbeeren-default.jpg" },
    @{ file = "strudelnestli.jpg";                            url = "https://www.gutekueche.at/storage/media/recipe/28510/conv/strudel-mit-blaetterteig-default.jpg" },
    @{ file = "filet-chuesseli.jpg";                          url = "https://www.gutekueche.at/storage/media/recipe/133412/conv/boeuf-stroganoff-default.jpg" },
    @{ file = "pulled-pork.jpg";                              url = "https://www.gutekueche.at/storage/media/recipe/164259/conv/pulled-pork-default.jpg" },
    @{ file = "cremiges-poulet-geschnetzeltes.jpg";           url = "https://www.gutekueche.at/storage/media/recipe/133038/conv/huehnchen-geschnetzeltes-default.jpg" }
)

$ok = 0; $skip = 0; $fail = 0

foreach ($img in $images) {
    $path = Join-Path $dest $img.file
    if (Test-Path $path) {
        Write-Host "SKIP  $($img.file)" -ForegroundColor DarkGray
        $skip++
        continue
    }
    try {
        Invoke-WebRequest -Uri $img.url -OutFile $path -UseBasicParsing -ErrorAction Stop
        Write-Host "OK    $($img.file)" -ForegroundColor Green
        $ok++
    } catch {
        Write-Host "FAIL  $($img.file)  ($_)" -ForegroundColor Red
        $fail++
    }
}

Write-Host ""
Write-Host "Fertig: $ok heruntergeladen, $skip bereits vorhanden, $fail fehlgeschlagen."
