Config
  {
    font = "xft:FreeSans:pixelsize=13",
    bgColor = "grey3",
    commands = [ Run Date "%_d.%m.%y, %R" "date" 10,
                 Run StdinReader ],
    alignSep = "}{",
    template = "%StdinReader% }{ %date%"
  }
