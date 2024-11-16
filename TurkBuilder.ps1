$word = "abi"

Function addPastSimpleDef {
    param([string]$word)

    #gezdim
    $vowels = "aeıioöuü"
}

Function addPastContDef {
    param([string]$word)

    # geziyordum
    $vowels = "aeıioöuü"
}

Function addFutureDef {
    param([string]$word)

    # gezecegim, bilecegim
    $vowels = "aeıioöuü"
}

Function addPresentContDef {
    param([string]$word)
    # geziyorum, kesiyorum, yuzuyorum, koyuyorum, biliyorum

    $vowels = $vowels = "aeıioöuü"
}

Function addAoristDef {
    param([string]$word)
    # gezebilirim, yuzebilirim, gidebilirim, gelebilirim, bilebilirim

    $vowels = $vowels = "aeıioöuü"
}

Function addInperative {
    # a, in
}

Function addCanDef {
    param($word)
}

Function addDative {
    # (y)a / (y)e
}

Function addLocative {
    # da, de, ta, te
}

Function addAblative {
    # dan, den, tan, ten
}

Function addGenitive {
    # (n)ın, (n)in, (n)un, (n)ün
}

Function addInstrumental {
    # (y)le, (y)lar
}

Function plural {
    # ler, lar
}

Function kkenDef {
    # when I was
}

Function bagliDef {
    
}

Function ragmenDef {
    # bamamana ragmen
}

Function addDef {
    param([string]$word)

    $wordArr = $word.ToCharArray()
    $output = $null
    $suffix = $null

    # ZAMIANA LITER
    # sehir -> sehri, nehir, nehri

    # GLOSSAL HARMONY BY CONSONANT EXCEPTIONS 
    # ç c  p b  g ğ  t d 

    # GLOSSAL HARMONY EXCEPTIONS
    $iexc = @("saat", "kalp", "hayal", "alkol", "seyahat")
    $ueExc = @("alkol") # -> ü

    # ENCEPTION Y INSTEAD S
    $yExc = @("su")

    # CHANGING 

    $vowels = "aeıioöuü"
    $lastVowel = $null

    foreach ($l in $wordArr) {
        Write-Host "Letter $l"
        if ($vowels.Contains($l)) {
            $lastVowel = $l
            #$index = $i
        }
    }

    $lastLetter = $word.Substring($word.Length-1,1)
    $addS = ""

    if ($vowels.Contains($lastLetter)) {

        $addS = "s"
        if ($yExc.Contains($word)) {
            $addS = "y"
        }

    }

    Write-Host "last vowel: $lastVowel"


    switch($lastVowel) {
        { @("a", "ı") -contains $_ } {
            $suffix = "ı"
            break;
        }
        { @("e", "i") -contains $_ } {
            $suffix = "i"
            break;
        }
        { @("o", "u") -contains $_ } {
            $suffix = "u"
            break;
        } 
        { @("ö", "ü") -contains $_} {
            $suffix = "ü"
            break;
        }
        default {
            Write-Host "def"
        }
    }

    if ($iExc.Contains($word)) {
        $suffix = "i"
    }

    Write-Host "suffix $suffix"

    $output = "$($word)$($addS)$($suffix)"

    <#
    switch($lastVowel) {
        "a" {
            $output = "ı"
            break;
        }
        "e" {
            $output = "i"
            break;
        }
        "u" {
            $output = "u"
            break;
        }
        "ü" {
            $output = "ü"
            break;
        }
        "ı" {
            $output = "ı"
            break;
        }
        "i" {
            $output = "i"
            brake;
        }
        "o" {
            $output = "u"
            brake;
        }
        "ö" {
            $output = "ü"
        }
        
    }
    #>

    return $output
}

addDef "saat"



<#

$specifiedSuffixes = @(
    ("a", "ı"),
    ("e", "i"),
    ("u", "u"),
    ("ü", "ü"),
    ("i", "i")
)

$nounFormats = @(
    @("benim", "im", "ım", "um", "üm, m, m, m, m"),
    @("senin", "in", "ın", "un", "ün, n, n, n, n"),
    @("onun", "i", "ı", "u", "ü", "si", "sı", "su", "sü")  # x like i, u
    @("bizim", "iz", "ız", "uz", "üz", "miz", "mız", "muz", "müz")
    @("sizin", "iniz", "ınız", "unuz", "ünüz", "niz", "nız", "nuz", "nüz")
    @("onların", "i", "ı", "u", "ü", "si", "sı", "su", "sü")
)

$cFormats = @(
    @("i", "in"),
    @("ı", "ın"),
    @("u", "un"),
    @("ü", "ün")
)

$dFormats = @(
    @("i", "i"),
    @("ı", "ı"),
    @("u", "u"),
    @("ü", "ü")
)

$mFormats = @(
    @("i", "ler"),
    @("ı", "lar"),
    @("u", "lar"),
    @("ü", "ler")
)

$nounForms = @(
    @("rzecz", "w"),
    @("rzeczy", "wc"),
    @("moja rzecz", "wf")
    @("mojej rzeczy", "wfc")
    @("twoja rzecz", "wfd")
    @("jego rzecz", "wfd")
    @("jej rzecz", "wfd")
    @("nasza rzecz", "wfd"),
    @("wasza rzecz", "wfd"),
    @("ich rzecz", "wfd")
)

#>