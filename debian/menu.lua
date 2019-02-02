-- automatically generated file. Do not edit (see /usr/share/doc/menu/html)

module("debian.menu")

Debian_menu = {}

--Debian_menu["Debian_LGP"] = {
--	{"LGP_Update","/usr/local/games/LGP_Update//lgp_update","/usr/local/games/LGP_Update//icon.xpm"},
--}
Debian_menu["Debian_Игры_Игрушки"] = {
	{"Oclock","oclock"},
	{"Xclock (analog)","xclock -analog"},
	{"Xclock (digital)","xclock -digital -update 1"},
	{"Xeyes","xeyes"},
	{"Xlogo","xlogo"},
}
Debian_menu["Debian_Игры_Стратегии"] = {
	{"Battle for Wesnoth (1.10)","/usr/games/wesnoth-1.10-nolog","/usr/share/pixmaps/wesnoth-1.10-icon.xpm"},
	{"Freeciv client (GTK version)","/usr/games/freeciv-gtk2"},
	{"Freeciv server", "x-terminal-emulator -e ".."/usr/games/freeciv-server"},
	{"Scorched3D","/usr/games/scorched3d","/usr/share/pixmaps/scorched3d.xpm"},
}
Debian_menu["Debian_Игры_Стрелялки"] = {
	{"Battle Tanks","/usr/games/btanks","/usr/share/pixmaps/btanks.xpm"},
	{"Blobwars","/usr/games/blobwars","/usr/share/pixmaps/blobwars.xpm"},
	{"BomberClone","/usr/games/bomberclone","/usr/share/pixmaps/bomberclone.xpm"},
	{"etracer","/usr/games/etracer","/usr/share/pixmaps/etracer.xpm"},
	{"Granatier","/usr/games/granatier"},
	{"Gunroar","/usr/games/gunroar","/usr/share/pixmaps/gunroar.xpm"},
	{"Overgod","/usr/games/overgod","/usr/share/games/overgod/overgod.xpm"},
	{"SuperTux","/usr/games/supertux","/usr/share/games/supertux/images/icon.xpm"},
	{"vectoroids","/usr/games/vectoroids --fullscreen","/usr/share/pixmaps/vectoroids-icon.xpm"},
}
Debian_menu["Debian_Игры_Утилиты"] = {
	{"Battle for Wesnoth Editor (1.10)","/usr/games/wesnoth-1.10-nolog -e","/usr/share/pixmaps/wesnoth-1.10_editor-icon.xpm"},
  }
Debian_menu["Debian_Игры"] = {
	{ "Игрушки", Debian_menu["Debian_Игры_Игрушки"] },
	{ "Стратегии", Debian_menu["Debian_Игры_Стратегии"] },
	{ "Стрелялки", Debian_menu["Debian_Игры_Стрелялки"] },
	{ "Утилиты", Debian_menu["Debian_Игры_Утилиты"] },
}
Debian_menu["Debian_Приложения_Видео"] = {
	{"Totem","/usr/bin/totem","/usr/share/pixmaps/totem.xpm"},
	{"VLC media player","/usr/bin/qvlc","/usr/share/icons/hicolor/32x32/apps/vlc.xpm"},
}
Debian_menu["Debian_Приложения_Графика"] = {
	{"dotty","/usr/bin/dotty"},
	{"Font Manager","/usr/bin/font-manager"},
	{"Geeqie","/usr/bin/geeqie-standard","/usr/share/pixmaps/geeqie.xpm"},
	{"Hugin","/usr/bin/hugin"},
	{"ImageMagick","/usr/bin/display.im6 logo:","/usr/share/pixmaps/display.im6.xpm"},
	{"Inkscape","/usr/bin/inkscape","/usr/share/pixmaps/inkscape.xpm"},
	{"lefty","/usr/bin/lefty"},
	{"LibreOffice Draw","/usr/bin/libreoffice --draw","/usr/share/icons/hicolor/32x32/apps/libreoffice-draw.xpm"},
	{"PTBatcherGUI","/usr/bin/PTBatcherGUI"},
	{"Rawstudio","/usr/bin/rawstudio","/usr/share/pixmaps/rawstudio.xpm"},
	{"RawTherapee","rawtherapee","/usr/share/pixmaps/rawtherapee.xpm"},
	{"The GIMP","/usr/bin/gimp","/usr/share/pixmaps/gimp.xpm"},
	{"X Window Snapshot","xwd | xwud"},
}
Debian_menu["Debian_Приложения_Мобильные_устройства"] = {
	{"JPilot","/usr/bin/jpilot","/usr/share/pixmaps/jpilot.xpm"},
}
Debian_menu["Debian_Приложения_Научные_Геофизика"] = {
	{"GRASS GIS", "x-terminal-emulator -e ".."/usr/bin/grass","/usr/share/icons/hicolor/32x32/apps/grass64.xpm"},
	{"QLandkarteGT","/usr/bin/qlandkartegt","/usr/share/pixmaps/qlandkartegt.xpm"},
	{"Quantum GIS","/usr/bin/qgis","/usr/share/pixmaps/qgis-icon.xpm"},
	{"SunClock","/usr/bin/sunclock","/usr/share/pixmaps/sunclock.xpm"},
}
Debian_menu["Debian_Приложения_Научные_Математика"] = {
	{"Bc", "x-terminal-emulator -e ".."/usr/bin/bc"},
	{"Dc", "x-terminal-emulator -e ".."/usr/bin/dc"},
	{"Gnuplot", "x-terminal-emulator -e ".."/usr/bin/gnuplot"},
	{"LibreOffice Math","/usr/bin/libreoffice --math","/usr/share/icons/hicolor/32x32/apps/libreoffice-math.xpm"},
	{"Xcalc","xcalc"},
}
Debian_menu["Debian_Приложения_Научные_Техническая_разработка"] = {
	{"Dia","/usr/bin/dia-normal","/usr/share/pixmaps/dia_menu.xpm"},
	{"LibreCAD","/usr/bin/librecad","/usr/share/pixmaps/librecad.xpm"},
}
Debian_menu["Debian_Приложения_Научные"] = {
	{ "Геофизика", Debian_menu["Debian_Приложения_Научные_Геофизика"] },
	{ "Математика", Debian_menu["Debian_Приложения_Научные_Математика"] },
	{ "Техническая разработка", Debian_menu["Debian_Приложения_Научные_Техническая_разработка"] },
}
Debian_menu["Debian_Приложения_Оболочки"] = {
	{"Bash", "x-terminal-emulator -e ".."/bin/bash --login"},
	{"Dash", "x-terminal-emulator -e ".."/bin/dash -i"},
	{"Python (v2.5)", "x-terminal-emulator -e ".."/usr/bin/python2.5","/usr/share/pixmaps/python2.5.xpm"},
	{"Sh", "x-terminal-emulator -e ".."/bin/sh --login"},
}
Debian_menu["Debian_Приложения_Офисные"] = {
	{"AbiWord Word Processor","/usr/bin/abiword","/usr/share/pixmaps/abiword.xpm"},
	{"gnumeric","/usr/bin/gnumeric","/usr/share/pixmaps/gnome-gnumeric.xpm"},
	{"Iceowl","/usr/bin/iceowl","/usr/share/pixmaps/iceowl.xpm"},
	{"LibreOffice Calc","/usr/bin/libreoffice --calc","/usr/share/icons/hicolor/32x32/apps/libreoffice-calc.xpm"},
	{"LibreOffice Impress","/usr/bin/libreoffice --impress","/usr/share/icons/hicolor/32x32/apps/libreoffice-impress.xpm"},
	{"LibreOffice Writer","/usr/bin/libreoffice --writer","/usr/share/icons/hicolor/32x32/apps/libreoffice-writer.xpm"},
	{"Tellico","/usr/bin/tellico","/usr/share/pixmaps/tellico.xpm"},
}
Debian_menu["Debian_Приложения_Программирование"] = {
	{"GDB", "x-terminal-emulator -e ".."/usr/bin/gdb"},
	{"Ocaml", "x-terminal-emulator -e ".."/usr/bin/ocaml","/usr/share/pixmaps/ocaml.xpm"},
	{"Python (v2.6)", "x-terminal-emulator -e ".."/usr/bin/python2.6","/usr/share/pixmaps/python2.6.xpm"},
	{"Python (v2.7)", "x-terminal-emulator -e ".."/usr/bin/python2.7","/usr/share/pixmaps/python2.7.xpm"},
	{"Python (v3.2)", "x-terminal-emulator -e ".."/usr/bin/python3.2","/usr/share/pixmaps/python3.2.xpm"},
	{"qgit","/usr/bin/qgit"},
	{"Qt Assistant","/usr/bin/assistant-qt4"},
	{"Qt Designer","/usr/bin/designer-qt4"},
	{"Qt Linguist","/usr/bin/linguist-qt4"},
	{"Ruby (irb1.8)", "x-terminal-emulator -e ".."/usr/bin/irb1.8"},
	{"Ruby (irb1.9.1)", "x-terminal-emulator -e ".."/usr/bin/irb1.9.1"},
	{"Sun Java 6 Web Start","/usr/lib/jvm/java-6-sun-1.6.0.26/bin/javaws -viewer","/usr/share/pixmaps/sun-java6.xpm"},
	{"Tclsh8.4", "x-terminal-emulator -e ".."/usr/bin/tclsh8.4"},
	{"Tclsh8.5", "x-terminal-emulator -e ".."/usr/bin/tclsh8.5"},
	{"TkWish8.4","x-terminal-emulator -e /usr/bin/wish8.4"},
	{"TkWish8.5","x-terminal-emulator -e /usr/bin/wish8.5"},
}
Debian_menu["Debian_Приложения_Программы_просмотра"] = {
	{"digikam","/usr/bin/digikam"},
	{"DjView4","/usr/bin/djview4","/usr/share/icons/hicolor/32x32/apps/djvulibre-djview4.xpm"},
	{"docker","/usr/bin/docker"},
	{"Evince","/usr/bin/evince","/usr/share/pixmaps/evince.xpm"},
	{"Eye of GNOME","/usr/bin/eog","/usr/share/pixmaps/gnome-eog.xpm"},
	{"F-Spot","/usr/bin/f-spot"},
	{"Shotwell","/usr/bin/shotwell"},
	{"Xditview","xditview"},
	{"XDvi","/usr/bin/xdvi"},
	{"Xpdf","/usr/bin/xpdf","/usr/share/pixmaps/xpdf.xpm"},
}
Debian_menu["Debian_Приложения_Работа_со_звуком"] = {
	{"Audacity","/usr/bin/audacity","/usr/share/pixmaps/audacity32.xpm"},
	{"Clementine","/usr/bin/clementine"},
	{"GNOME ALSA Mixer","/usr/bin/gnome-alsamixer","/usr/share/pixmaps/gnome-alsamixer/gnome-alsamixer-icon.xpm"},
	{"grecord (GNOME 2.0 Recorder)","/usr/bin/gnome-sound-recorder","/usr/share/pixmaps/gnome-grecord.xpm"},
	{"gtick","/usr/bin/gtick","/usr/share/pixmaps/gtick_32x32.xpm"},
	{"jack", "x-terminal-emulator -e ".."/usr/bin/jack -Q -D --wait"},
	{"JACK Control","/usr/bin/qjackctl","/usr/share/pixmaps/qjackctl.xpm"},
	{"kmetronome","/usr/bin/kmetronome"},
	{"pavucontrol","/usr/bin/pavucontrol"},
	{"Picard","/usr/bin/picard","/usr/share/pixmaps/picard.xpm"},
	{"qsynth","/usr/bin/qsynth","/usr/share/pixmaps/qsynth.xpm"},
	{"tuxguitar","/usr/bin/tuxguitar"},
	{"Xfce Mixer","/usr/bin/xfce4-mixer","/usr/share/pixmaps/xfce4-mixer.xpm"},
}
Debian_menu["Debian_Приложения_Работа_с_текстом"] = {
	{"Fortune","sh -c 'while /usr/games/fortune | col -x | xmessage -center -buttons OK:1,Another:0 -default OK -file - ; do :; done'"},
	{"GNOME Dictionary","/usr/bin/gnome-dictionary","/usr/share/pixmaps/gdict.xpm"},
}
Debian_menu["Debian_Приложения_Редакторы"] = {
	{"Emacs 23 (text)", "x-terminal-emulator -e ".."/usr/bin/emacs23 -nw"},
	{"Emacs 23 (X11)","/usr/bin/emacs23"},
	{"Emacs Snapshot (text)", "x-terminal-emulator -e ".."/usr/bin/emacs-snapshot -nw","/usr/share/emacs/24.0.92/etc/emacs.xpm"},
	{"Gedit","/usr/bin/gedit","/usr/share/pixmaps/gedit-icon.xpm"},
	{"GVIM","/usr/bin/vim.gtk -g -f","/usr/share/pixmaps/vim-32.xpm"},
	{"Nano", "x-terminal-emulator -e ".."/bin/nano","/usr/share/nano/nano-menu.xpm"},
	{"Xedit","xedit"},
}
Debian_menu["Debian_Приложения_Сеть_Мониторинг"] = {
	{"Mtr","mtr"},
	{"Wireshark","/usr/bin/wireshark","/usr/share/pixmaps/wsicon32.xpm"},
}
Debian_menu["Debian_Приложения_Сеть_Общение"] = {
	{"Evolution","/usr/bin/evolution","/usr/share/pixmaps/evolution.xpm"},
	{"Icedove Mail","icedove","/usr/share/pixmaps/icedove.xpm"},
	{"Mutt", "x-terminal-emulator -e ".."/usr/bin/mutt","/usr/share/pixmaps/mutt.xpm"},
	{"Psi+","/usr/bin/psi-plus","/usr/share/psi-plus/psi-plus.xpm"},
	{"Remmina","/usr/bin/remmina"},
	{"Telnet", "x-terminal-emulator -e ".."/usr/bin/telnet"},
	{"twinkle","/usr/bin/twinkle","/usr/share/pixmaps/twinkle-32x32.xpm"},
	{"Xbiff","xbiff"},
	{"xtightvncviewer","/usr/bin/xtightvncviewer"},
}
Debian_menu["Debian_Приложения_Сеть_Пересылка_файлов"] = {
	{"amule","/usr/bin/amule","/usr/share/pixmaps/amule.xpm"},
	{"Deluge BitTorrent Client","/usr/bin/deluge","/usr/share/pixmaps/deluge.xpm"},
	{"Nicotine-Plus","/usr/bin/nicotine","/usr/share/pixmaps/nicotine.xpm"},
	{"Transmission BitTorrent Client (GTK)","/usr/bin/transmission-gtk","/usr/share/pixmaps/transmission.xpm"},
}
Debian_menu["Debian_Приложения_Сеть_Просмотр_веб"] = {
	{"ELinks WWW browser", "x-terminal-emulator -e ".."/usr/bin/elinks"},
	{"Epiphany web browser","/usr/bin/epiphany-browser"},
	{"Iceweasel","iceweasel","/usr/share/pixmaps/iceweasel.xpm"},
	{"Lynx-cur", "x-terminal-emulator -e ".."lynx"},
	{"w3m", "x-terminal-emulator -e ".."/usr/bin/w3m /usr/share/doc/w3m/MANUAL.html"},
}
Debian_menu["Debian_Приложения_Сеть"] = {
	{ "Мониторинг", Debian_menu["Debian_Приложения_Сеть_Мониторинг"] },
	{ "Общение", Debian_menu["Debian_Приложения_Сеть_Общение"] },
	{ "Пересылка файлов", Debian_menu["Debian_Приложения_Сеть_Пересылка_файлов"] },
	{ "Просмотр веб", Debian_menu["Debian_Приложения_Сеть_Просмотр_веб"] },
}
Debian_menu["Debian_Приложения_Системные_Администрирование"] = {
	{"Debian Task selector", "x-terminal-emulator -e ".."su-to-root -c tasksel"},
	{"Editres","editres"},
	{"fontmatrix","/usr/bin/fontmatrix"},
	{"Gnome Control Center","/usr/bin/gnome-control-center","/usr/share/pixmaps/gnome-control-center.xpm"},
	{"GNOME partition editor","su-to-root -X -c /usr/sbin/gparted","/usr/share/pixmaps/gparted.xpm"},
	{"GTK+ 2.0 Theme Switch","/usr/bin/gtk-theme-switch2"},
	{"Openbox Configuration Manager","/usr/bin/obconf","/usr/share/pixmaps/obconf.xpm"},
	{"Reportbug", "x-terminal-emulator -e ".."/usr/bin/reportbug --exit-prompt"},
	{"Reportbug (GTK+)","/usr/bin/reportbug --exit-prompt --ui gtk2"},
	{"stalonetray","/usr/bin/stalonetray"},
	{"Sun Java 6 Plugin Control Panel","/usr/lib/jvm/java-6-sun-1.6.0.26/bin/ControlPanel","/usr/share/pixmaps/sun-java6.xpm"},
	{"TeXconfig", "x-terminal-emulator -e ".."/usr/bin/texconfig"},
	{"UNetbootin","/usr/bin/unetbootin","/usr/share/pixmaps/unetbootin.xpm"},
	{"Wmclock","/usr/bin/wmclock"},
	{"Xclipboard","xclipboard"},
	{"Xfce Application Finder","xfce4-appfinder","/usr/share/pixmaps/xfce4-appfinder.xpm"},
	{"Xfontsel","xfontsel"},
	{"xfprint4","xfprint4"},
	{"XFrun4","xfrun4"},
	{"Xkill","xkill"},
	{"Xrefresh","xrefresh"},
	{"xxkb","/usr/bin/xxkb"},
}
Debian_menu["Debian_Приложения_Системные_Аппаратное_обеспечение"] = {
	{"Xvidtune","xvidtune"},
}
Debian_menu["Debian_Приложения_Системные_Безопасность"] = {
	{"fpm2","/usr/bin/fpm2","/usr/share/pixmaps/fpm2/fpm2.xpm"},
	{"Sun Java 6 Policy Tool","/usr/lib/jvm/java-6-sun-1.6.0.26/bin/policytool","/usr/share/pixmaps/sun-java6.xpm"},
}
Debian_menu["Debian_Приложения_Системные_Мониторинг"] = {
	{"GNOME system monitor","/usr/bin/gnome-system-monitor"},
	{"Pstree", "x-terminal-emulator -e ".."/usr/bin/pstree.x11","/usr/share/pixmaps/pstree16.xpm"},
	{"Sun Java 6 VisualVM","/usr/lib/jvm/java-6-sun-1.6.0.26/bin/jvisualvm","/usr/share/pixmaps/sun-java6.xpm"},
	{"Top", "x-terminal-emulator -e ".."/usr/bin/top"},
	{"Xconsole","xconsole -file /dev/xconsole"},
	{"Xev","x-terminal-emulator -e xev"},
	{"Xload","xload"},
}
Debian_menu["Debian_Приложения_Системные_Управление_пакетами"] = {
	{"Aptitude Package Manager (text)", "x-terminal-emulator -e ".."/usr/bin/aptitude-curses"},
	{"Synaptic Package Manager","synaptic-pkexec","/usr/share/synaptic/pixmaps/synaptic_32x32.xpm"},
}
Debian_menu["Debian_Приложения_Системные_Языковое_окружение"] = {
	{"Belarusian environment", "x-terminal-emulator -e ".."/usr/bin/set-language-env -l be"},
	{"Bulgarian environment", "x-terminal-emulator -e ".."/usr/bin/set-language-env -l bg"},
	{"Catalan environment", "x-terminal-emulator -e ".."/usr/bin/set-language-env -l ca"},
	{"Danish environment", "x-terminal-emulator -e ".."/usr/bin/set-language-env -l da"},
	{"French environment", "x-terminal-emulator -e ".."/usr/bin/set-language-env -l fr"},
	{"German environment", "x-terminal-emulator -e ".."/usr/bin/set-language-env -l de"},
	{"Japanese environment", "x-terminal-emulator -e ".."/usr/bin/set-language-env -l ja"},
	{"Korean environment", "x-terminal-emulator -e ".."/usr/bin/set-language-env -l ko"},
	{"Lithuanian environment", "x-terminal-emulator -e ".."/usr/bin/set-language-env -l lt"},
	{"Macedonian environment", "x-terminal-emulator -e ".."/usr/bin/set-language-env -l mk"},
	{"Native Language Environment","/usr/bin/tklanguage"},
	{"Native Language Environment - remove", "x-terminal-emulator -e ".."/usr/bin/set-language-env -r"},
	{"Polish environment", "x-terminal-emulator -e ".."/usr/bin/set-language-env -l pl"},
	{"Russian environment", "x-terminal-emulator -e ".."/usr/bin/set-language-env -l ru"},
	{"Serbian environment", "x-terminal-emulator -e ".."/usr/bin/set-language-env -l sr"},
	{"Spanish environment", "x-terminal-emulator -e ".."/usr/bin/set-language-env -l es"},
	{"Thai environment", "x-terminal-emulator -e ".."/usr/bin/set-language-env -l th"},
	{"Turkish environment", "x-terminal-emulator -e ".."/usr/bin/set-language-env -l tr"},
	{"Ukrainian environment", "x-terminal-emulator -e ".."/usr/bin/set-language-env -l uk"},
}
Debian_menu["Debian_Приложения_Системные"] = {
	{"Alternatives Configurator","/usr/sbin/galternatives","/usr/share/pixmaps/galternatives.xpm"},
	{ "Администрирование", Debian_menu["Debian_Приложения_Системные_Администрирование"] },
	{ "Аппаратное обеспечение", Debian_menu["Debian_Приложения_Системные_Аппаратное_обеспечение"] },
	{ "Безопасность", Debian_menu["Debian_Приложения_Системные_Безопасность"] },
	{ "Мониторинг", Debian_menu["Debian_Приложения_Системные_Мониторинг"] },
	{ "Управление пакетами", Debian_menu["Debian_Приложения_Системные_Управление_пакетами"] },
	{ "Языковое окружение", Debian_menu["Debian_Приложения_Системные_Языковое_окружение"] },
}
Debian_menu["Debian_Приложения_Специальные_возможности"] = {
	{"Xmag","xmag"},
}
Debian_menu["Debian_Приложения_Управление_данными"] = {
	{"LibreOffice Base","/usr/bin/libreoffice --base","/usr/share/icons/hicolor/32x32/apps/libreoffice-base.xpm"},
	{"Tomboy","/usr/bin/tomboy"},
}
Debian_menu["Debian_Приложения_Управление_файлами"] = {
	{"Baobab","/usr/bin/baobab","/usr/share/pixmaps/baobab.xpm"},
	{"Brasero","/usr/bin/brasero"},
	{"File-Roller","/usr/bin/file-roller","/usr/share/pixmaps/file-roller.xpm"},
	{"mc", "x-terminal-emulator -e ".."/usr/bin/mc","/usr/share/pixmaps/mc.xpm"},
	{"Nautilus","/usr/bin/nautilus","/usr/share/pixmaps/nautilus.xpm"},
	{"PCManFM","/usr/bin/pcmanfm"},
	{"Thunar","/usr/bin/thunar"},
	{"tuxcmd","/usr/bin/tuxcmd"},
	{"Xarchiver","/usr/bin/xarchiver","/usr/share/pixmaps/xarchiver.xpm"},
	{"Xfdesktop","xfdesktop"},
}
Debian_menu["Debian_Приложения_Эмуляторы"] = {
	{"Virtualbricks","/usr/bin/virtualbricks","/usr/share/pixmaps/virtualbricks.xpm"},
}
Debian_menu["Debian_Приложения_Эмуляторы_терминалов"] = {
	{"Gnome Terminal","/usr/bin/gnome-terminal","/usr/share/pixmaps/gnome-terminal.xpm"},
	{"LXTerminal","/usr/bin/lxterminal","/usr/share/pixmaps/lxterminal.xpm"},
	{"Xfce Terminal","/usr/bin/xfce4-terminal","/usr/share/pixmaps/terminal.xpm"},
	{"Xfterm4", "x-terminal-emulator -e ".."xfterm4"},
	{"XTerm","xterm","/usr/share/pixmaps/xterm-color_32x32.xpm"},
	{"X-Terminal as root (GKsu)","/usr/bin/gksu -u root /usr/bin/x-terminal-emulator","/usr/share/pixmaps/gksu-debian.xpm"},
	{"XTerm (Unicode)","uxterm","/usr/share/pixmaps/xterm-color_32x32.xpm"},
}
Debian_menu["Debian_Приложения"] = {
	{ "Видео", Debian_menu["Debian_Приложения_Видео"] },
	{ "Графика", Debian_menu["Debian_Приложения_Графика"] },
	{ "Мобильные устройства", Debian_menu["Debian_Приложения_Мобильные_устройства"] },
	{ "Научные", Debian_menu["Debian_Приложения_Научные"] },
	{ "Оболочки", Debian_menu["Debian_Приложения_Оболочки"] },
	{ "Офисные", Debian_menu["Debian_Приложения_Офисные"] },
	{ "Программирование", Debian_menu["Debian_Приложения_Программирование"] },
	{ "Программы просмотра", Debian_menu["Debian_Приложения_Программы_просмотра"] },
	{ "Работа со звуком", Debian_menu["Debian_Приложения_Работа_со_звуком"] },
	{ "Работа с текстом", Debian_menu["Debian_Приложения_Работа_с_текстом"] },
	{ "Редакторы", Debian_menu["Debian_Приложения_Редакторы"] },
	{ "Сеть", Debian_menu["Debian_Приложения_Сеть"] },
	{ "Системные", Debian_menu["Debian_Приложения_Системные"] },
	{ "Специальные возможности", Debian_menu["Debian_Приложения_Специальные_возможности"] },
	{ "Управление данными", Debian_menu["Debian_Приложения_Управление_данными"] },
	{ "Управление файлами", Debian_menu["Debian_Приложения_Управление_файлами"] },
	{ "Эмуляторы", Debian_menu["Debian_Приложения_Эмуляторы"] },
	{ "Эмуляторы терминалов", Debian_menu["Debian_Приложения_Эмуляторы_терминалов"] },
}
Debian_menu["Debian_Справка"] = {
	{"Info", "x-terminal-emulator -e ".."info"},
	{"TeXdoctk","/usr/bin/texdoctk"},
	{"Xfce4-about","xfce4-about"},
	{"Xfhelp4","xfhelp4"},
	{"Xman","xman"},
	{"yelp","/usr/bin/yelp"},
}
Debian_menu["Debian_Экран_Блокировщики"] = {
	{"Lock Screen (XScreenSaver)","/usr/bin/xscreensaver-command -lock"},
	{"Xflock4", "x-terminal-emulator -e ".."xflock4"},
}
Debian_menu["Debian_Экран_Хранители_экрана"] = {
	{"Activate ScreenSaver (Next)","/usr/bin/xscreensaver-command -next"},
	{"Activate ScreenSaver (Previous)","/usr/bin/xscreensaver-command -prev"},
	{"Activate ScreenSaver (Random)","/usr/bin/xscreensaver-command -activate"},
	{"Demo Screen Hacks","/usr/bin/xscreensaver-command -demo"},
	{"Disable XScreenSaver","/usr/bin/xscreensaver-command -exit"},
	{"Enable XScreenSaver","/usr/bin/xscreensaver"},
	{"Reinitialize XScreenSaver","/usr/bin/xscreensaver-command -restart"},
	{"ScreenSaver Preferences","/usr/bin/xscreensaver-command -prefs"},
}
Debian_menu["Debian_Экран"] = {
	{ "Блокировщики", Debian_menu["Debian_Экран_Блокировщики"] },
	{ "Хранители экрана", Debian_menu["Debian_Экран_Хранители_экрана"] },
}
Debian_menu["Debian"] = {
--	{ "LGP", Debian_menu["Debian_LGP"] },
	{ "Игры", Debian_menu["Debian_Игры"] },
	{ "Приложения", Debian_menu["Debian_Приложения"] },
	{ "Справка", Debian_menu["Debian_Справка"] },
	{ "Экран", Debian_menu["Debian_Экран"] },
}
