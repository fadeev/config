Config {
    font = "xft:FreeSans:pixelsize=13",
    bgColor = "grey3",
    fgColor = "white",
    position = Top,
    lowerOnStart = True,
    commands = [ Run Date "%_d.%m.%y, %R" "date" 10,
                 Run StdinReader ],
    sepChar = "%",
    alignSep = "}{",
    template = "%StdinReader% }{ %date%"
}
