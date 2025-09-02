#!/bin/bash

# Liste der verfügbaren Pakete
packages=("curl" "lsd" "git" "vim" "htop" "wget")

# Funktion um das Alias zu setzen
set_alias_for_lsd() {
    echo "Setze Alias für lsd..."
    # Überprüfen, ob das Alias bereits existiert, um doppelte Einträge zu vermeiden
    if ! grep -q "alias ls='ls -CF'" ~/.bashrc; then
        echo "alias ls='lsd'" >> ~/.bashrc
        echo "Alias 'ls' für 'lsd' wurde hinzugefügt!"
    else
        echo "Alias für 'ls' existiert bereits."
    fi
}

echo "Willkommen zum interaktiven Paket-Installer!"
echo "Verfügbare Pakete:"
select pkg in "${packages[@]}" "Fertig"; do
    case $pkg in
        "Fertig")
            echo "Installation abgeschlossen."
            break
            ;;
        "")
            echo "Ungültige Auswahl, bitte wähle ein Paket aus."
            ;;
        *)
            echo "Installiere $pkg..."
            sudo apt update
            sudo apt install -y $pkg
            echo "$pkg wurde erfolgreich installiert!"

            # Wenn lsd installiert wurde, setze das Alias
            if [ "$pkg" == "lsd" ]; then
                set_alias_for_lsd
            fi
            ;;
    esac
done

# Falls lsd installiert wurde, den Benutzer auffordern, die Änderungen zu laden
if grep -q "alias ls='lsd'" ~/.bashrc; then
    echo "Bitte führe 'source ~/.bashrc' aus, um das neue Alias zu aktivieren."
fi
