#Requires AutoHotkey v2.0
#SingleInstance Force
#NoTrayIcon


getRandomChristmasGif() {
    return randomChristmasGifs[random(1, randomChristmasGifs.Length)]
}

getRandomWindowPos() {
    return "x" random(A_ScreenWidth - 300) " y" random(A_ScreenHeight - 300)
}

getRandomX() {
    return random(A_ScreenWidth - 300)
}

getRandomY() {
    return random(A_ScreenHeight - 300)
}

getRandomMs() {
    return random(500, 800)
}

randomChristmasGifs := [
    "https://c.tenor.com/-06xcr3Mxo0AAAAd/tenor.gif",
    "https://c.tenor.com/i9tVYDAYUvgAAAAd/tenor.gif",
    "https://c.tenor.com/ypLX85SGrRgAAAAd/tenor.gif",
    "https://c.tenor.com/QQoEUp8rtCIAAAAd/tenor.gif",
    "https://c.tenor.com/oXvMy34w4YkAAAAd/tenor.gif",
    "https://c.tenor.com/E99nyHaTIAUAAAAd/tenor.gif",
    "https://c.tenor.com/_NHaDPTEOE8AAAAd/tenor.gif",
    "https://c.tenor.com/RFqq13DGbKYAAAAd/tenor.gif",
    "https://c.tenor.com/72q-_3keS_QAAAAC/tenor.gif",
    "https://c.tenor.com/TDOPpurbwqMAAAAC/tenor.gif",
    "https://c.tenor.com/wLhxyDIzUSoAAAAC/tenor.gif",
    "https://c.tenor.com/pNpMd47XpwMAAAAd/tenor.gif",
]


addGif() {
    updatePos() {
        randomX := getRandomX()
        randomY := getRandomY()
        
        MyGui.Move(randomX, randomY)
    }

    MyGui := Gui()
    MyGui.Opt("+AlwaysOnTop -Caption +ToolWindow +Disabled")
    MyGui.MarginX := -20
    MyGui.MarginY := -20

    pic := getRandomChristmasGif()
    MyGui.Add("ActiveX", "w300 h300", "mshtml:<img style='width: 100%; height: 100%' src='" pic "' />")
    MyGui.Show(getRandomWindowPos() . " NoActivate")

    SetTimer(updatePos, getRandomMs())
}

^s::{
    SetTimer(addGif, 500)
}
